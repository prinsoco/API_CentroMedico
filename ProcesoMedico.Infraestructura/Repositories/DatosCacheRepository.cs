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
    public class DatosCacheRepository : IDatosCacheRepository
    {
        private readonly DapperContext _context;

        public DatosCacheRepository(DapperContext context)
        {
            _context = context;
        }

        private string Sp(string action) => $"sp_DatosCache_{action}";

        public async Task<IEnumerable<DatosCahe.CacheParametros>> GetParametros()
        {
            using var conn = _context.CreateConnection();
            conn.Open();
            return await conn.QueryAsync<DatosCahe.CacheParametros>(Sp("Parametros"), null, commandType: CommandType.StoredProcedure);
        }
    }
}
