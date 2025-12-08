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
    public class UsuarioRepository : IRepository<Usuario>
    {
        private readonly SqlConnectionFactory _factory;
        public UsuarioRepository(SqlConnectionFactory factory) => _factory = factory;

        public async Task<int> CreateAsync(Usuario e)
        {
            using var c = _factory.Create();
            return await c.ExecuteScalarAsync<int>("sp_Usuario_Create",
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
                },
                commandType: System.Data.CommandType.StoredProcedure);
        }

        public async Task<bool> UpdateAsync(Usuario e)
        {
            using var c = _factory.Create();
            var rows = await c.ExecuteAsync("sp_Usuario_Update",
                new
                {
                    e.UsuarioId,
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
                },
                commandType: System.Data.CommandType.StoredProcedure);
            return rows > 0;
        }

        public async Task<bool> DeleteAsync(int id)
        {
            using var c = _factory.Create();
            var rows = await c.ExecuteAsync("sp_Usuario_Delete",
                new { UsuarioId = id }, commandType: System.Data.CommandType.StoredProcedure);
            return rows > 0;
        }

        public async Task<Usuario?> GetByIdAsync(int id)
        {
            using var c = _factory.Create();
            return await c.QueryFirstOrDefaultAsync<Usuario>(
                "sp_Usuario_GetById", new { UsuarioId = id },
                commandType: System.Data.CommandType.StoredProcedure);
        }

        public async Task<IEnumerable<Usuario>> GetAllAsync()
        {
            using var c = _factory.Create();
            return await c.QueryAsync<Usuario>("sp_Usuario_GetAll",
                commandType: System.Data.CommandType.StoredProcedure);
        }
    }
}
