using ProcesoMedico.Dominio.Entities;
using ProcesoMedico.Dominio.Ports;
using ProcesoMedico.Infraestructura.Persistence;
using Dapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ProcesoMedico.Dominio.Common;
using ProcesoMedico.Infraestructura.Interfaces;
using System.Data;
using Microsoft.Data.SqlClient;
using System.Reflection.PortableExecutable;
using System.Collections;
using Azure;
using System.Data.Common;

namespace ProcesoMedico.Infraestructura.Repositories
{
    public class HorariosRepository : IHorariosRepository
    {
        private readonly DapperContext _context;

        public HorariosRepository(DapperContext context)
        {
            _context = context;
        }

        public ConfiguracionHorario GetHorariosMedico(object? input)
        {
            var response = new ConfiguracionHorario();
            using var conn = _context.CreateConnection();
            conn.Open();
            
            var configData = conn.QueryMultiple("sp_GenerarHorariosMedicos", input, null, null, commandType: CommandType.StoredProcedure);

            response.configMedico = configData.Read<ConfigMedico>()?.ToList();
            response.configSecuencia = configData.Read<ConfigSecuencia>()?.ToList();
            response.configRango = configData.Read<ConfigRango>()?.ToList();
            response.citasMedico = configData.Read<CitasxMedico>()?.ToList();

            return response;
        }

        public async Task<IEnumerable<Feriados>> GetFeriados(object? input)
        {
            var response = new ConfiguracionHorario();
            using var conn = _context.CreateConnection();
            conn.Open();

            return await conn.QueryAsync<Feriados>("sp_Feriado_GetAll", input, null, null, commandType: CommandType.StoredProcedure);
        }

        public async Task<CitaPaciente> GetCita(object? input)
        {
            var respCita = new CitaPaciente();
            using var conn = _context.CreateConnection();
            conn.Open();

            var response = conn.QueryFirstAsync<CitaPaciente>("sp_CitaPaciente", input, null, null, commandType: CommandType.StoredProcedure).GetAwaiter().GetResult();
            if(response != null)
            {
                respCita.Codigo = string.IsNullOrEmpty(response.Codigo) ? "0000" : response.Codigo;
                respCita.Mensaje = string.IsNullOrEmpty(response.Mensaje) ? "" : response.Mensaje;
                respCita.Medico = string.IsNullOrEmpty(response.Medico) ? "" : response.Medico;
                respCita.FechaCita = string.IsNullOrEmpty(response.FechaCita) ? "" : response.FechaCita;
                respCita.Especialidad = string.IsNullOrEmpty(response.Especialidad) ? "" : response.Especialidad;
            }
            return respCita;
        }
        
        public async Task<IEnumerable<EspecialidadWS>> GetEspecialidad()
        {
            using var conn = _context.CreateConnection();
            conn.Open();

            var response = conn.QueryAsync<EspecialidadWS>("sp_EspecialidadWS", null, null, null, commandType: CommandType.StoredProcedure).GetAwaiter().GetResult();
            if(response == null || response?.Count() == 0)
            {
                var resp = new List<EspecialidadWS>()
                { 
                    new EspecialidadWS()
                    {
                        Especialidad = "General",
                        Id = "0"
                    }
                };

                return resp.AsEnumerable();
            }
            
            return response;
        }
        
        public async Task<IEnumerable<MedicosWS>> GetMedico(object? input)
        {
            using var conn = _context.CreateConnection();
            conn.Open();

            var response = conn.QueryAsync<MedicosWS>("sp_MedicoWS", input, null, null, commandType: CommandType.StoredProcedure).GetAwaiter().GetResult();
            if(response == null || response?.Count() == 0)
            {
                var resp = new List<MedicosWS>()
                { 
                    new MedicosWS()
                    {
                        Medico = "Juan1",
                        Id = "0"
                    },
                    new MedicosWS()
                    {
                        Medico = "Juan2",
                        Id = "0"
                    },
                    new MedicosWS()
                    {
                        Medico = "Juan3",
                        Id = "0"
                    },
                    new MedicosWS()
                    {
                        Medico = "Juan4",
                        Id = "0"
                    },
                    new MedicosWS()
                    {
                        Medico = "Juan5",
                        Id = "0"
                    }
                };

                return resp.AsEnumerable();
            }
            
            return response;
        }

        public async Task<UsuarioWS> GetUsuario(object? input)
        {
            var response = new UsuarioWS();
            using var conn = _context.CreateConnection();
            conn.Open();

            var respBD = conn.QueryFirstAsync<UsuarioWS>("sp_ValidarPaciente", input, null, null, commandType: CommandType.StoredProcedure).GetAwaiter().GetResult();
            if (respBD == null)
            {
                response.Codigo = "9999";
                response.Mensaje = "Lo sentimos!. Número de identificación no registrada";
                response.UrlLogin = "URL no valida";
            }
            else
            {
                response.Codigo = respBD.Codigo;
                response.UrlLogin = respBD.UrlLogin;
                response.Mensaje = respBD.Mensaje;
            }

            return response;
        }
    }
}
