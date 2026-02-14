using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;
using ProcesoMedico.Aplicacion.Interfaces;
using ProcesoMedico.Dominio.Entities;
using ProcesoMedico.Infraestructura.Interfaces;
using ProcesoMedico.Infraestructura.Seguridad;

namespace ProcesoMedico.Aplicacion.Services
{
    public class CitaService : GenericService<Cita>, ICitaService
    {
        private readonly IGenericRepository<Cita> _repo;
        private readonly IFrontRepository _frontReport;
        private readonly IUnitOfWorkRepository _unitofWork;
        private readonly IMailService _mail;
        private readonly IConfiguration _configuration;

        public CitaService(IGenericRepository<Cita> repo, IFrontRepository frontReport,
            IUnitOfWorkRepository unitofWork, IMailService mail, IConfiguration configuration) : base(repo)
        {
            _repo = repo;
            _frontReport = frontReport;
            _unitofWork = unitofWork;
            _mail = mail;
            _configuration = configuration;
        }

        public async Task<int> InsertCitaAsync(Cita Cita)
        {
            var spParams = new
            {
                Cita.PacienteId,
                Cita.MedicoId,
                Cita.FechaCita,
                Cita.Motivo,
                Cita.Estado,
                Cita.UsuarioCreacion
            };

            int result = _repo.InsertAsync(Cita, spParams).GetAwaiter().GetResult();

            if (result > 0)
            {
                generarNotiCita(Cita, $"{_configuration["Notificacion:GenerarCita"]}", $"{_configuration["Notificacion:Codigo"]}", null, "Notificación Asignación de Cita");
            }

            return result;
        }

        public async Task<int> UpdateCitaAsync(Cita Cita)
        {
            var spParams = new
            {
                Cita.CitaId,
                Cita.PacienteId,
                Cita.MedicoId,
                Cita.FechaCita,
                Cita.Motivo,
                Cita.EstadoCita,
                Cita.UsuarioModificacion
            };

            int result = _repo.UpdateAsync(Cita, spParams).GetAwaiter().GetResult();

            if (result > 0 && Cita?.EstadoCita == "CANC")
            {
                generarNotiCita(Cita, $"{_configuration["Notificacion:Eliminar"]}", $"{_configuration["Notificacion:Codigo"]}", null, "Notificación Cancelación de Cita");
            }

            return result;
        }

        public async Task<IEnumerable<Cita>> ReporteCitaAsync(object input)
        {
            return await _frontReport.ReporteCitaAsync(input);
        }

        #region Privados
        private void generarNotiCita(Cita cita, string tipo, string codigo, string url, string asunto)
        {
            //Notificaciones
            var notificacion = _unitofWork.Notificaciones(new { Combo = "S" }).GetAwaiter().GetResult();

            //Parametros email
            var param = _unitofWork.Parametros(new { Combo = "S", Tipo = "EmailSettings" }).GetAwaiter().GetResult();

            //parametro login
            var paramLogin = _unitofWork.Parametros(new { Combo = "S", Tipo = "NewUser", Codigo = url }).GetAwaiter().GetResult();

            var request = new MailRequest();

            //plantilla
            request.Body = notificacion.Where(x => x.Codigo == codigo && x.Tipo == tipo)?.FirstOrDefault()?.Plantilla;
            request.Parametros = param.Select(x => new ParametrosEmail
            {
                Nombre = x.Codigo,
                Valor = x.Valor
            }).ToList();

            string[] paciente = cita.Paciente.Split(";");
            request.Recipients = new List<Recipient>()
            {
                new Recipient()
                {
                    To = paciente[1]+"",
                    ToName = paciente[0]+""
                }
            };
            request.Subject = asunto;

            var cultureEc = new CultureInfo("es-EC");
            string fecha = cita.FechaCita?.ToString("yyyy-MM-dd", cultureEc);
            string hora = cita.FechaCita?.ToString("HH:mm:ss", cultureEc);
            

            request.Json = JsonConvert.SerializeObject(new
            {
                NombrePaciente = paciente[0] + "",
                FechaCita = fecha,
                HoraCita = hora,
                NombreMedico = cita.Medico,
                Especialidad = cita.Especialidad,
                AnioActual = DateTime.Now.Year
            });
            _mail.EnviarEmail(request);

        }
        #endregion
    }
}
