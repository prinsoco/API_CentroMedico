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
    public class CitaRepository : IRepository<Cita>
    {
        private readonly SqlConnectionFactory _factory;
        public CitaRepository(SqlConnectionFactory factory) => _factory = factory;

        public async Task<int> CreateAsync(Cita e)
        {
            using var c = _factory.Create();
            return await c.ExecuteScalarAsync<int>("sp_Cita_Create",
                new { e.PacienteId, e.MedicoId, e.FechaCita, e.Motivo, e.Estado, e.UsuarioCreacion },
                commandType: System.Data.CommandType.StoredProcedure);
        }

        public async Task<bool> UpdateAsync(Cita e)
        {
            using var c = _factory.Create();
            var rows = await c.ExecuteAsync("sp_Cita_Update",
                new { e.CitaId, e.PacienteId, e.MedicoId, e.FechaCita, e.Motivo, e.Estado, e.UsuarioModificacion },
                commandType: System.Data.CommandType.StoredProcedure);
            return rows > 0;
        }

        public async Task<bool> DeleteAsync(int id)
        {
            using var c = _factory.Create();
            var rows = await c.ExecuteAsync("sp_Cita_Delete",
                new { CitaId = id }, commandType: System.Data.CommandType.StoredProcedure);
            return rows > 0;
        }

        public async Task<Cita?> GetByIdAsync(int id)
        {
            using var c = _factory.Create();
            return await c.QueryFirstOrDefaultAsync<Cita>(
                "sp_Cita_GetById", new { CitaId = id },
                commandType: System.Data.CommandType.StoredProcedure);
        }

        public async Task<IEnumerable<Cita>> GetAllAsync()
        {
            using var c = _factory.Create();
            return await c.QueryAsync<Cita>("sp_Cita_GetAll",
                commandType: System.Data.CommandType.StoredProcedure);
        }
    }
}
