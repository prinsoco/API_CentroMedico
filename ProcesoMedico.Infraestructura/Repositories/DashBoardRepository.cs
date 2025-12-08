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

namespace ProcesoMedico.Infraestructura.Repositories
{
    public class DashBoardRepository : IDashBoardRepository
    {
        private readonly DapperContext _context;

        public DashBoardRepository(DapperContext context)
        {
            _context = context;
        }

        private string Sp(string action) => $"sp_DashBoard_{action}";

        public async Task<SecionOne> SeccionOne()
        {
            using var conn = _context.CreateConnection();
            return await conn.QueryFirstOrDefaultAsync<SecionOne>(Sp("SeccionOne"), null, commandType: CommandType.StoredProcedure);
        }
    }
}
