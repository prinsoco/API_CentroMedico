using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection.PortableExecutable;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using ProcesoMedico.Aplicacion.Interfaces;
using ProcesoMedico.Dominio.Entities;
using ProcesoMedico.Infraestructura.Interfaces;
//using Newtonsoft.Json;

namespace ProcesoMedico.Aplicacion.Services
{
    public class HorariosService : GenericService<HorariosMedico>, IHorariosService
    {
        private readonly IHorariosRepository _repoHorario;
        private readonly IGenericRepository<HorariosMedico> _repo;
        private readonly IConfiguration _configuration;

        public HorariosService(IGenericRepository<HorariosMedico> repo, IConfiguration configuration, IHorariosRepository repoHorario) : base(repo)
        {
            _repo = repo;
            _repoHorario = repoHorario;
            _configuration = configuration;
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
                EspecialidadId = int.Parse(string.IsNullOrEmpty(id) ? "0" : id)
            };

            return await _repoHorario.GetMedico(param);
        }
    }
}
