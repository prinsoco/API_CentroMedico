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
    public class EncuestaRepository : IRepository<Encuesta>
    {
        private readonly SqlConnectionFactory _factory;
        public EncuestaRepository(SqlConnectionFactory factory) => _factory = factory;

        public async Task<int> CreateAsync(Encuesta e)
        {
            using var c = _factory.Create();
            return await c.ExecuteScalarAsync<int>("sp_Encuesta_Create",
                new
                {
                    e.PacienteId,
                    e.MedicoId,
                    e.CitaId,
                    e.FechaEnvio,
                    e.FechaRespuesta,
                    e.Estado,
                    e.CodigoAcceso,
                    e.CanalEnvio,
                    e.ObservacionGeneral,
                    e.CalificacionGlobal,
                    e.CreadoPor,
                    e.UsuarioCreacion
                }, commandType: System.Data.CommandType.StoredProcedure);
        }

        public async Task<bool> UpdateAsync(Encuesta e)
        {
            using var c = _factory.Create();
            var rows = await c.ExecuteAsync("sp_Encuesta_Update",
                new
                {
                    e.EncuestaId,
                    e.PacienteId,
                    e.MedicoId,
                    e.CitaId,
                    e.FechaEnvio,
                    e.FechaRespuesta,
                    e.Estado,
                    e.CodigoAcceso,
                    e.CanalEnvio,
                    e.ObservacionGeneral,
                    e.CalificacionGlobal,
                    e.CreadoPor,
                    e.UsuarioModificacion
                }, commandType: System.Data.CommandType.StoredProcedure);
            return rows > 0;
        }

        public async Task<bool> DeleteAsync(int id)
        {
            using var c = _factory.Create();
            var rows = await c.ExecuteAsync("sp_Encuesta_Delete",
                new { EncuestaId = id }, commandType: System.Data.CommandType.StoredProcedure);
            return rows > 0;
        }

        public async Task<Encuesta?> GetByIdAsync(int id)
        {
            using var c = _factory.Create();
            return await c.QueryFirstOrDefaultAsync<Encuesta>(
                "sp_Encuesta_GetById", new { EncuestaId = id },
                commandType: System.Data.CommandType.StoredProcedure);
        }

        public async Task<IEnumerable<Encuesta>> GetAllAsync()
        {
            using var c = _factory.Create();
            return await c.QueryAsync<Encuesta>("sp_Encuesta_GetAll",
                commandType: System.Data.CommandType.StoredProcedure);
        }
    }
}
