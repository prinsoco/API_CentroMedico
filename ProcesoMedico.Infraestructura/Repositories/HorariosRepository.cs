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
    }
}
