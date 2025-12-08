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
    public class PacienteRepository : IRepository<Paciente>
    {
        private readonly SqlConnectionFactory _factory;
        public PacienteRepository(SqlConnectionFactory factory) => _factory = factory;

        public async Task<int> CreateAsync(Paciente e)
        {
            using var c = _factory.Create();
            return await c.ExecuteScalarAsync<int>("sp_Paciente_Create",
                new
                {
                    e.PerfilId,
                    e.Nombres,
                    e.Apellidos,
                    e.Identificacion,
                    e.Edad,
                    Usuario = e.UsuarioLogin,
                    e.Email,
                    e.Telefono,
                    e.Celular,
                    e.Direccion,
                    e.Estado,
                    e.UsuarioCreacion
                }, commandType: System.Data.CommandType.StoredProcedure);
        }

        public async Task<bool> UpdateAsync(Paciente e)
        {
            using var c = _factory.Create();
            var rows = await c.ExecuteAsync("sp_Paciente_Update",
                new
                {
                    e.PacienteId,
                    e.PerfilId,
                    e.Nombres,
                    e.Apellidos,
                    e.Identificacion,
                    e.Edad,
                    Usuario = e.UsuarioLogin,
                    e.Email,
                    e.Telefono,
                    e.Celular,
                    e.Direccion,
                    e.Estado,
                    e.UsuarioModificacion
                }, commandType: System.Data.CommandType.StoredProcedure);
            return rows > 0;
        }

        public async Task<bool> DeleteAsync(int id)
        {
            using var c = _factory.Create();
            var rows = await c.ExecuteAsync("sp_Paciente_Delete",
                new { PacienteId = id }, commandType: System.Data.CommandType.StoredProcedure);
            return rows > 0;
        }

        public async Task<Paciente?> GetByIdAsync(int id)
        {
            using var c = _factory.Create();
            return await c.QueryFirstOrDefaultAsync<Paciente>(
                "sp_Paciente_GetById", new { PacienteId = id },
                commandType: System.Data.CommandType.StoredProcedure);
        }

        public async Task<IEnumerable<Paciente>> GetAllAsync()
        {
            using var c = _factory.Create();
            return await c.QueryAsync<Paciente>("sp_Paciente_GetAll",
                commandType: System.Data.CommandType.StoredProcedure);
        }
    }
}
