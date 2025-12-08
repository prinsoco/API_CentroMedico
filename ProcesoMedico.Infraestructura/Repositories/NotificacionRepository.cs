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
    public class NotificacionRepository : IRepository<Notificacion>
    {
        private readonly SqlConnectionFactory _factory;
        public NotificacionRepository(SqlConnectionFactory factory) => _factory = factory;

        public async Task<int> CreateAsync(Notificacion e)
        {
            using var c = _factory.Create();
            return await c.ExecuteScalarAsync<int>("sp_Notificacion_Create",
                new { e.Codigo, e.Tipo, e.Canal, e.Plantilla, e.Estado, e.UsuarioCreacion },
                commandType: System.Data.CommandType.StoredProcedure);
        }

        public async Task<bool> UpdateAsync(Notificacion e)
        {
            using var c = _factory.Create();
            var rows = await c.ExecuteAsync("sp_Notificacion_Update",
                new { e.NotificacionId, e.Codigo, e.Tipo, e.Canal, e.Plantilla, e.Estado, e.UsuarioModificacion },
                commandType: System.Data.CommandType.StoredProcedure);
            return rows > 0;
        }

        public async Task<bool> DeleteAsync(int id)
        {
            using var c = _factory.Create();
            var rows = await c.ExecuteAsync("sp_Notificacion_Delete",
                new { NotificacionId = id }, commandType: System.Data.CommandType.StoredProcedure);
            return rows > 0;
        }

        public async Task<Notificacion?> GetByIdAsync(int id)
        {
            using var c = _factory.Create();
            return await c.QueryFirstOrDefaultAsync<Notificacion>(
                "sp_Notificacion_GetById", new { NotificacionId = id },
                commandType: System.Data.CommandType.StoredProcedure);
        }

        public async Task<IEnumerable<Notificacion>> GetAllAsync()
        {
            using var c = _factory.Create();
            return await c.QueryAsync<Notificacion>("sp_Notificacion_GetAll",
                commandType: System.Data.CommandType.StoredProcedure);
        }
    }
}
