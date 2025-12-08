using ProcesoMedico.Dominio.Entities;
using ProcesoMedico.Dominio.Ports;
using ProcesoMedico.Infraestructura.Persistence;
using Dapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProcesoMedico.Infraestructura.Repositories
{
    public class RespuestasEncuestaRepository : IRepository<RespuestasEncuesta>
    {
        private readonly SqlConnectionFactory _factory;
        public RespuestasEncuestaRepository(SqlConnectionFactory factory) => _factory = factory;

        public async Task<int> CreateAsync(RespuestasEncuesta e)
        {
            using var c = _factory.Create();
            return await c.ExecuteScalarAsync<int>("sp_RespuestasEncuesta_Create",
                new { e.EncuestaId, e.PreguntaId, e.RespuestaTexto, e.ValorNumerico },
                commandType: System.Data.CommandType.StoredProcedure);
        }

        public async Task<bool> UpdateAsync(RespuestasEncuesta e)
        {
            using var c = _factory.Create();
            var rows = await c.ExecuteAsync("sp_RespuestasEncuesta_Update",
                new { e.RespuestaId, e.RespuestaTexto, e.ValorNumerico },
                commandType: System.Data.CommandType.StoredProcedure);
            return rows > 0;
        }

        public async Task<bool> DeleteAsync(int id)
        {
            using var c = _factory.Create();
            var rows = await c.ExecuteAsync("sp_RespuestasEncuesta_Delete",
                new { RespuestaId = id }, commandType: System.Data.CommandType.StoredProcedure);
            return rows > 0;
        }

        public async Task<RespuestasEncuesta?> GetByIdAsync(int id)
        {
            using var c = _factory.Create();
            return await c.QueryFirstOrDefaultAsync<RespuestasEncuesta>(
                "sp_RespuestasEncuesta_GetById", new { RespuestaId = id },
                commandType: System.Data.CommandType.StoredProcedure);
        }

        public async Task<IEnumerable<RespuestasEncuesta>> GetAllAsync()
        {
            using var c = _factory.Create();
            return await c.QueryAsync<RespuestasEncuesta>("sp_RespuestasEncuesta_GetAll",
                commandType: System.Data.CommandType.StoredProcedure);
        }
    }
}
