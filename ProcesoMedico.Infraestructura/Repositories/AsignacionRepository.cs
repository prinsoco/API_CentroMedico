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
    public class AsignacionRepository : IRepository<Asignacion>
    {
        private readonly SqlConnectionFactory _factory;
        public AsignacionRepository(SqlConnectionFactory factory) => _factory = factory;

        public async Task<int> CreateAsync(Asignacion e)
        {
            using var c = _factory.Create();
            return await c.ExecuteScalarAsync<int>("sp_Asignacion_Create",
                new { e.RolId, e.UsuarioId, e.Estado, e.UsuarioCreacion },
                commandType: System.Data.CommandType.StoredProcedure);
        }

        public async Task<bool> UpdateAsync(Asignacion e)
        {
            using var c = _factory.Create();
            var rows = await c.ExecuteAsync("sp_Asignacion_Update",
                new { e.AsignarId, e.RolId, e.UsuarioId, e.Estado, e.UsuarioModificacion },
                commandType: System.Data.CommandType.StoredProcedure);
            return rows > 0;
        }

        public async Task<bool> DeleteAsync(int id)
        {
            using var c = _factory.Create();
            var rows = await c.ExecuteAsync("sp_Asignacion_Delete",
                new { AsignarId = id }, commandType: System.Data.CommandType.StoredProcedure);
            return rows > 0;
        }

        public async Task<Asignacion?> GetByIdAsync(int id)
        {
            using var c = _factory.Create();
            return await c.QueryFirstOrDefaultAsync<Asignacion>(
                "sp_Asignacion_GetById", new { AsignarId = id },
                commandType: System.Data.CommandType.StoredProcedure);
        }

        public async Task<IEnumerable<Asignacion>> GetAllAsync()
        {
            using var c = _factory.Create();
            return await c.QueryAsync<Asignacion>("sp_Asignacion_GetAll",
                commandType: System.Data.CommandType.StoredProcedure);
        }
    }
}
