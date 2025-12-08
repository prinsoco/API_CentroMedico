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
    public class RolRepository : IRepository<Rol>
    {
        private readonly SqlConnectionFactory _factory;
        public RolRepository(SqlConnectionFactory factory) => _factory = factory;

        public async Task<int> CreateAsync(Rol e)
        {
            using var c = _factory.Create();
            return await c.ExecuteScalarAsync<int>("sp_Rol_Create",
                new { e.Descripcion, e.Estado, e.UsuarioCreacion },
                commandType: System.Data.CommandType.StoredProcedure);
        }

        public async Task<bool> UpdateAsync(Rol e)
        {
            using var c = _factory.Create();
            var rows = await c.ExecuteAsync("sp_Rol_Update",
                new { e.RolId, e.Descripcion, e.Estado, e.UsuarioModificacion },
                commandType: System.Data.CommandType.StoredProcedure);
            return rows > 0;
        }

        public async Task<bool> DeleteAsync(int id)
        {
            using var c = _factory.Create();
            var rows = await c.ExecuteAsync("sp_Rol_Delete",
                new { RolId = id }, commandType: System.Data.CommandType.StoredProcedure);
            return rows > 0;
        }

        public async Task<Rol?> GetByIdAsync(int id)
        {
            using var c = _factory.Create();
            return await c.QueryFirstOrDefaultAsync<Rol>(
                "sp_Rol_GetById", new { RolId = id },
                commandType: System.Data.CommandType.StoredProcedure);
        }

        public async Task<IEnumerable<Rol>> GetAllAsync()
        {
            using var c = _factory.Create();
            return await c.QueryAsync<Rol>("sp_Rol_GetAll",
                commandType: System.Data.CommandType.StoredProcedure);
        }
    }
}
