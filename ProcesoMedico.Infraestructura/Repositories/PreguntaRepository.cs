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
    public class PreguntaRepository : IRepository<Pregunta>
    {
        private readonly SqlConnectionFactory _factory;
        public PreguntaRepository(SqlConnectionFactory factory) => _factory = factory;

        public async Task<int> CreateAsync(Pregunta e)
        {
            using var c = _factory.Create();
            return await c.ExecuteScalarAsync<int>("sp_Pregunta_Create",
                new { e.TextoPregunta, e.Categoria, e.TipoRespuesta, e.Orden, e.Activa },
                commandType: System.Data.CommandType.StoredProcedure);
        }

        public async Task<bool> UpdateAsync(Pregunta e)
        {
            using var c = _factory.Create();
            var rows = await c.ExecuteAsync("sp_Pregunta_Update",
                new { e.PreguntaId, e.TextoPregunta, e.Categoria, e.TipoRespuesta, e.Orden, e.Activa },
                commandType: System.Data.CommandType.StoredProcedure);
            return rows > 0;
        }

        public async Task<bool> DeleteAsync(int id)
        {
            using var c = _factory.Create();
            var rows = await c.ExecuteAsync("sp_Pregunta_Delete",
                new { PreguntaId = id }, commandType: System.Data.CommandType.StoredProcedure);
            return rows > 0;
        }

        public async Task<Pregunta?> GetByIdAsync(int id)
        {
            using var c = _factory.Create();
            return await c.QueryFirstOrDefaultAsync<Pregunta>(
                "sp_Pregunta_GetById", new { PreguntaId = id },
                commandType: System.Data.CommandType.StoredProcedure);
        }

        public async Task<IEnumerable<Pregunta>> GetAllAsync()
        {
            using var c = _factory.Create();
            return await c.QueryAsync<Pregunta>("sp_Pregunta_GetAll",
                commandType: System.Data.CommandType.StoredProcedure);
        }
    }
}
