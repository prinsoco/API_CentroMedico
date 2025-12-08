using ProcesoMedico.Dominio.Entities;
using ProcesoMedico.Dominio.Ports;
using ProcesoMedico.Infraestructura.Persistence;
using Dapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ProcesoMedico.Infraestructura.Interfaces;

namespace ProcesoMedico.Infraestructura.Repositories
{
    public class MedicoRepository : IMedicoRepository
    {
        private readonly DapperContext _context;
        public MedicoRepository(DapperContext context) => _context = context;

        public async Task<int> InsertAsync(Medico e)
        {
            using var c = _context.CreateConnection();
            return await c.ExecuteScalarAsync<int>("sp_Medico_Insert", new
            {
                e.EspecialidadId,
                e.PerfilId,
                e.Nombres,
                e.Apellidos,
                e.Identificacion,
                e.Edad,
                e.Usuario,
                e.Email,
                e.Telefono,
                e.Celular,
                e.Direccion,
                e.Estado,
                e.UsuarioCreacion
            }, commandType: System.Data.CommandType.StoredProcedure);
        }

        public async Task<int> UpdateAsync(Medico e)
        {
            using var c = _context.CreateConnection();
            return await c.ExecuteAsync("sp_Medico_Update", new
            {
                e.MedicoId,
                e.EspecialidadId,
                e.PerfilId,
                e.Nombres,
                e.Apellidos,
                e.Identificacion,
                e.Edad,
                e.Usuario,
                e.Email,
                e.Telefono,
                e.Celular,
                e.Direccion,
                e.Estado,
                e.UsuarioModificacion
            }, commandType: System.Data.CommandType.StoredProcedure);
        }

        public async Task<int> DeleteAsync(int id, string usuarioModificacion)
        {
            using var c = _context.CreateConnection();
            return await c.ExecuteAsync("sp_Medico_Delete",
                new { MedicoId = id, UsuarioModificacion = usuarioModificacion },
                commandType: System.Data.CommandType.StoredProcedure);
        }

        public async Task<Medico?> GetByIdAsync(int id)
        {
            using var c = _context.CreateConnection();
            return await c.QueryFirstOrDefaultAsync<Medico>("sp_Medico_GetById", new { MedicoId = id },
                commandType: System.Data.CommandType.StoredProcedure);
        }

        public async Task<IEnumerable<Medico>> GetAllAsync(int? especialidadId = null, string? identificacion = null, bool? estado = null)
        {
            using var c = _context.CreateConnection();
            return await c.QueryAsync<Medico>("sp_Medico_GetAll",
                new { EspecialidadId = especialidadId, Identificacion = identificacion, Estado = estado },
                commandType: System.Data.CommandType.StoredProcedure);
        }
    }
}
