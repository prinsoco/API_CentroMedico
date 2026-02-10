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
    public class FrontRepository : IFrontRepository
    {
        private readonly DapperContext _context;

        public FrontRepository(DapperContext context)
        {
            _context = context;
        }

        public async Task<IEnumerable<RouteInfo>> GetMenuFrontAsync(object param)
        {
            var response = new List<RouteInfo>();
            using var conn = _context.CreateConnection();
            conn.Open();
            
            var configData = conn.QueryMultiple("sp_MenuFront_GetAll", param, null, null, commandType: CommandType.StoredProcedure);

            var routerinfo = configData.Read<RouteInfo>()?.ToList();
            var childitems = configData.Read<ChildrenItems>()?.ToList();

            response = routerinfo
                        .Select(r =>
                        {
                            r.children = childitems
                                .Where(c => c.menuid == r.menuid)
                                .ToList() ?? new List<ChildrenItems>();
                            return r;
                        })
                        .ToList();

            return response.AsEnumerable();
        }
        
        public async Task<IEnumerable<Paciente>> ReportePacienteAsync(object param)
        {
            using var conn = _context.CreateConnection();
            conn.Open();
            
            var configData = await conn.QueryAsync<Paciente>("sp_Reporte_GetAll", param, null, null, commandType: CommandType.StoredProcedure);

            return configData;
        }
        
        public async Task<IEnumerable<Medico>> ReporteMedicoAsync(object param)
        {
            using var conn = _context.CreateConnection();
            conn.Open();
            
            var configData = await conn.QueryAsync<Medico>("sp_Reporte_GetAll", param, null, null, commandType: CommandType.StoredProcedure);

            return configData;
        }
        
        public async Task<IEnumerable<Cita>> ReporteCitaAsync(object param)
        { 
            using var conn = _context.CreateConnection();
            conn.Open();
            
            var configData = await conn.QueryAsync<Cita>("sp_Reporte_GetAll", param, null, null, commandType: CommandType.StoredProcedure);

            return configData;
        }
    }
}
