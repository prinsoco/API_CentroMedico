using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Reflection.PortableExecutable;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using Newtonsoft.Json;
using ProcesoMedico.Aplicacion.Interfaces;
using ProcesoMedico.Dominio.Entities;
using ProcesoMedico.Infraestructura.Interfaces;
using ProcesoMedico.Infraestructura.Seguridad;
//using Newtonsoft.Json;

namespace ProcesoMedico.Aplicacion.Services
{
    public class HorariosService : GenericService<HorariosMedico>, IHorariosService
    {
        private readonly IHorariosRepository _repoHorario;
        private readonly IGenericRepository<HorariosMedico> _repo;
        private readonly IConfiguration _configuration;
        private readonly IUnitOfWorkRepository _unitofWork;
        private readonly IMailService _mail;

        public HorariosService(IGenericRepository<HorariosMedico> repo, IConfiguration configuration, IHorariosRepository repoHorario,
            IUnitOfWorkRepository unitofWork, IMailService mail) : base(repo)
        {
            _repo = repo;
            _repoHorario = repoHorario;
            _configuration = configuration;
            _unitofWork = unitofWork;
            _mail = mail;
        }

        public async Task<List<HorariosMedico>> GetHorariosMedico(object? input)
        {
            var response = new List<HorariosMedico>();
            var dataReader = _repoHorario.GetHorariosMedico(input);

            if (dataReader != null)
            {
                if (dataReader.configMedico?.Any() == true)
                {
                    response = dataReader.configMedico.Select(r => new HorariosMedico()
                    {
                        Foto = r.Foto,
                        EspecialidadId = r.EspecialidadId,
                        Especialidad = r.DescEspecialidad,
                        MedicoId = r.MedicoId,
                        Nombre = r.Nombre,
                        FechaInicioLaboral = r.FechaInicioLaboral,
                        FechaFinalLaboral = r.FechaFinLaboral,
                        HorarioTexto = r.HorarioTexto
                    }).ToList();
                }

                if (dataReader.configSecuencia?.Any() == true)
                {
                    response.ForEach(r =>
                    {
                        r.DiasAtencion = dataReader.configSecuencia.Where(z => z.MedicoId == r.MedicoId && z.FechaInicioLaboral?.Date == r.FechaInicioLaboral?.Date).GroupBy(a => a.SecuenciaDia).Select(a => a.Key).ToList();
                    });
                }

                if (dataReader.configRango?.Any() == true)
                {
                    response.ForEach(r =>
                    {
                        var resultFechas = dataReader.configRango.Where(z => z.MedicoId == r.MedicoId && z.Hora >= r.FechaInicioLaboral && z.Hora <= r.FechaFinalLaboral).OrderBy(Z => Z.IdRango).ToList();

                        r.HorarioLaboral = resultFechas.Select(a => new HorasLaborales()
                        {
                            FechaFin = a.FechaFin,
                            FechaInicio = a.FechaInicio,
                            Hora = a.Hora,
                            IdRango = a.IdRango,
                            MedicoId = a.MedicoId,
                            Nombre = a.Nombre
                        }).ToList();
                    });
                }

                if (dataReader.citasMedico?.Any() == true)
                {
                    response.ForEach(r =>
                    {
                        var resultFechas = dataReader.citasMedico.Where(z => z.MedicoId == r.MedicoId).OrderBy(Z => Z.CitaId).ToList();

                        r.Citas = resultFechas.Select(a => new CitasxMedico()
                        {
                            CitaId = a.CitaId,
                            MedicoId = a.MedicoId,
                            PacienteId = a.PacienteId,
                            DescEstadoCita = a.DescEstadoCita,
                            EstadoCita = a.EstadoCita,
                            FechaCita = a.FechaCita,
                            Motivo = a.Motivo
                        }).ToList();
                    });
                }
            }

            return response;
        }

        public async Task<IEnumerable<Feriados>> GetFeriados(object? input)
        {
            return await _repoHorario.GetFeriados(input);
        }
        
        public async Task<CitaPaciente> GetCita(string input)
        {
            var param = new
            {
                Identificacion = input
            };

            return await _repoHorario.GetCita(param);
        }
        
        public async Task<IEnumerable<EspecialidadWS>> GetEspecialidad()
        {
            return await _repoHorario.GetEspecialidad();
        }
        
        public async Task<IEnumerable<MedicosWS>> GetMedico(string? id)
        {
            var param = new
            {
                Especialidad = id
            };

            return await _repoHorario.GetMedico(param);
        }
        
        public async Task<UsuarioWS> GetUsuario(string input)
        {
            var param = new
            {
                Identificacion = input
            };

            return await _repoHorario.GetUsuario(param);
        }
        public async Task<IEnumerable<HorarioWS>> GetHorarioWS(string ident, string especialidad, string medico)
        {
            string valueMed = string.Empty;

            if (!string.IsNullOrEmpty(medico))
            {
                try
                {
                    string[] medArray = medico.Split("-");
                    if (medArray != null)
                    {
                        valueMed = medArray[0] + "";
                    }
                    else
                    {
                        throw new Exception("Error");
                    }
                }
                catch (Exception)
                {
                    string[] medArray = medico.Split("-");
                    if (medArray != null)
                    {
                        valueMed = medArray[0] + "";
                    }
                }
                
                
            }

            var param = new
            {
                Identificacion = ident,
                Especialidad = especialidad,
                MedicoId = int.Parse(string.IsNullOrEmpty(valueMed) ? "0" : valueMed)
            };

            return await _repoHorario.GetHorarioWS(param);
        }

        public async Task<CitaWSAgendada> AgendarCita(string ident, string fechacita, string medico)
        {
            var agenda = new CitaWSAgendada();
            string valueMed = string.Empty;
            string valueFecha = string.Empty;
            string valueHora = string.Empty;

            if (!string.IsNullOrEmpty(medico))
            {
                try
                {
                    string[] medArray = medico.Split("-");
                    if (medArray != null)
                    {
                        valueMed = medArray[0] + "";
                    }
                    else
                    {
                        throw new Exception("Error");
                    }
                }
                catch (Exception)
                {
                    string[] medArray = medico.Split("-");
                    if (medArray != null)
                    {
                        valueMed = medArray[0] + "";
                    }
                }
            }

            if (!string.IsNullOrEmpty(fechacita))
            {
                try
                {
                    string[] fechaDiv = fechacita.Split(" ");
                    if (fechaDiv != null)
                    {
                        string[] fecha = fechaDiv[0].Split("/");
                        valueFecha = string.Format("{0}-{1}-{2} ", fecha[2]+"", fecha[1]+"", fecha[0]+"");
                        valueHora = string.Format("{0}:00", fechaDiv[1] + "");
                    }
                    else
                    {
                        throw new Exception("Error");
                    }
                }
                catch (Exception)
                {
                    
                }
            }

            var param = new
            {
                Identificacion = ident,
                MedicoId = int.Parse(string.IsNullOrEmpty(valueMed) ? "0" : valueMed),
                FechaCita = valueFecha,
                HoraCita = valueHora
            };

            var response = await _repoHorario.AgendarCita(param);

            if(response != null && response.Codigo == "0000")
            {
                generarNotiCita(response, $"{_configuration["Notificacion:GenerarCita"]}", $"{_configuration["Notificacion:Codigo"]}", null);

                agenda = new CitaWSAgendada()
                {
                    Codigo = response.Codigo,
                    Mensaje = response.Mensaje
                };
            }
            else
            {
                agenda = new CitaWSAgendada()
                {
                    Codigo = response.Codigo,
                    Mensaje = response.Mensaje
                };
            }

            return agenda;
        }

        #region Privados
        private void generarNotiCita(CitaNotifWSAgendada cita, string tipo, string codigo, string url)
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
            request.Subject = "Notificación Cancelación de Cita";

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
