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
    public class FidelizacionRepository : IRepository<Fidelizacion>
    {
        private readonly SqlConnectionFactory _factory;
        public FidelizacionRepository(SqlConnectionFactory factory) => _factory = factory;

        public async Task<int> CreateAsync(Fidelizacion e)
        {
            using var c = _factory.Create();
            return await c.ExecuteScalarAsync<int>("sp_Fidelizacion_Create",
                new { e.Descripcion, e.Estado, e.UsuarioCreacion },
                commandType: System.Data.CommandType.StoredProcedure);
        }

        public async Task<bool> UpdateAsync(Fidelizacion e)
        {
            using var c = _factory.Create();
            var rows = await c.ExecuteAsync("sp_Fidelizacion_Update",
                new { e.FidelizacionId, e.Descripcion, e.Estado, e.UsuarioModificacion },
                commandType: System.Data.CommandType.StoredProcedure);
            return rows > 0;
        }

        public async Task<bool> DeleteAsync(int id)
        {
            using var c = _factory.Create();
            var rows = await c.ExecuteAsync("sp_Fidelizacion_Delete",
                new { FidelizacionId = id }, commandType: System.Data.CommandType.StoredProcedure);
            return rows > 0;
        }

        public async Task<Fidelizacion?> GetByIdAsync(int id)
        {
            using var c = _factory.Create();
            return await c.QueryFirstOrDefaultAsync<Fidelizacion>(
                "sp_Fidelizacion_GetById", new { FidelizacionId = id },
                commandType: System.Data.CommandType.StoredProcedure);
        }

        public async Task<IEnumerable<Fidelizacion>> GetAllAsync()
        {
            using var c = _factory.Create();
            return await c.QueryAsync<Fidelizacion>("sp_Fidelizacion_GetAll",
                commandType: System.Data.CommandType.StoredProcedure);
        }
    }
}
