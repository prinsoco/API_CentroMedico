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
    public class PerfilRepository : IRepository<Perfil>
    {
        private readonly SqlConnectionFactory _factory;
        public PerfilRepository(SqlConnectionFactory factory) => _factory = factory;

        public async Task<int> CreateAsync(Perfil e)
        {
            using var c = _factory.Create();
            return await c.ExecuteScalarAsync<int>("sp_Perfil_Create",
                new { e.Descripcion, e.Estado, e.UsuarioCreacion },
                commandType: System.Data.CommandType.StoredProcedure);
        }

        public async Task<bool> UpdateAsync(Perfil e)
        {
            using var c = _factory.Create();
            var rows = await c.ExecuteAsync("sp_Perfil_Update",
                new { e.PerfilId, e.Descripcion, e.Estado, e.UsuarioModificacion },
                commandType: System.Data.CommandType.StoredProcedure);
            return rows > 0;
        }

        public async Task<bool> DeleteAsync(int id)
        {
            using var c = _factory.Create();
            var rows = await c.ExecuteAsync("sp_Perfil_Delete",
                new { PerfilId = id }, commandType: System.Data.CommandType.StoredProcedure);
            return rows > 0;
        }

        public async Task<Perfil?> GetByIdAsync(int id)
        {
            using var c = _factory.Create();
            return await c.QueryFirstOrDefaultAsync<Perfil>(
                "sp_Perfil_GetById", new { PerfilId = id },
                commandType: System.Data.CommandType.StoredProcedure);
        }

        public async Task<IEnumerable<Perfil>> GetAllAsync()
        {
            using var c = _factory.Create();
            return await c.QueryAsync<Perfil>("sp_Perfil_GetAll",
                commandType: System.Data.CommandType.StoredProcedure);
        }
    }
}
