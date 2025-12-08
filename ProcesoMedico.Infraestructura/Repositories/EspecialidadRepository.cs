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
    public class EspecialidadRepository : IRepository<Especialidad>
    {
        private readonly SqlConnectionFactory _factory;
        public EspecialidadRepository(SqlConnectionFactory factory) => _factory = factory;

        public async Task<int> CreateAsync(Especialidad e)
        {
            using var c = _factory.Create();
            return await c.ExecuteScalarAsync<int>("sp_Especialidad_Create",
                new { e.Descripcion, e.Observacion, e.Estado, e.UsuarioCreacion },
                commandType: System.Data.CommandType.StoredProcedure);
        }

        public async Task<bool> UpdateAsync(Especialidad e)
        {
            using var c = _factory.Create();
            var rows = await c.ExecuteAsync("sp_Especialidad_Update",
                new { e.EspecialidadId, e.Descripcion, e.Observacion, e.Estado, e.UsuarioModificacion },
                commandType: System.Data.CommandType.StoredProcedure);
            return rows > 0;
        }

        public async Task<bool> DeleteAsync(int id)
        {
            using var c = _factory.Create();
            var rows = await c.ExecuteAsync("sp_Especialidad_Delete",
                new { EspecialidadId = id }, commandType: System.Data.CommandType.StoredProcedure);
            return rows > 0;
        }

        public async Task<Especialidad?> GetByIdAsync(int id)
        {
            using var c = _factory.Create();
            return await c.QueryFirstOrDefaultAsync<Especialidad>(
                "sp_Especialidad_GetById", new { EspecialidadId = id },
                commandType: System.Data.CommandType.StoredProcedure);
        }

        public async Task<IEnumerable<Especialidad>> GetAllAsync()
        {
            using var c = _factory.Create();
            return await c.QueryAsync<Especialidad>("sp_Especialidad_GetAll",
                commandType: System.Data.CommandType.StoredProcedure);
        }
    }
}
