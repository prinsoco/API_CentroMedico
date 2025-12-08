using ProcesoMedico.Dominio.Ports;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProcesoMedico.Infraestructura.Repositories
{
    public class ParametrosRepository : IRepository<Parametros>
    {
        private readonly SqlConnectionFactory _factory;
        public ParametrosRepository(SqlConnectionFactory factory) => _factory = factory;

        public async Task<int> CreateAsync(Parametros e)
        {
            using var c = _factory.Create();
            return await c.ExecuteScalarAsync<int>("sp_Parametros_Create",
                new { e.Tipo, e.Codigo, e.Valor, e.Descripcion, e.Estado, e.UsuarioCreacion },
                commandType: System.Data.CommandType.StoredProcedure);
        }

        public async Task<bool> UpdateAsync(Parametros e)
        {
            using var c = _factory.Create();
            var rows = await c.ExecuteAsync("sp_Parametros_Update",
                new { e.ParamId, e.Tipo, e.Codigo, e.Valor, e.Descripcion, e.Estado, e.UsuarioModificacion },
                commandType: System.Data.CommandType.StoredProcedure);
            return rows > 0;
        }

        public async Task<bool> DeleteAsync(int id)
        {
            using var c = _factory.Create();
            var rows = await c.ExecuteAsync("sp_Parametros_Delete",
                new { ParamId = id }, commandType: System.Data.CommandType.StoredProcedure);
            return rows > 0;
        }

        public async Task<Parametros?> GetByIdAsync(int id)
        {
            using var c = _factory.Create();
            return await c.QueryFirstOrDefaultAsync<Parametros>(
                "sp_Parametros_GetById", new { ParamId = id },
                commandType: System.Data.CommandType.StoredProcedure);
        }

        public async Task<IEnumerable<Parametros>> GetAllAsync()
        {
            using var c = _factory.Create();
            return await c.QueryAsync<Parametros>("sp_Parametros_GetAll",
                commandType: System.Data.CommandType.StoredProcedure);
        }
    }
}
