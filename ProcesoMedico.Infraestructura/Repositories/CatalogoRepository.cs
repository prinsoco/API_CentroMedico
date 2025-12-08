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
    public class CatalogoRepository : ICatalogoRepository
    {
        private readonly DapperContext _context;
        public CatalogoRepository(DapperContext context) => _context = context;

        public async Task<int> InsertAsync(Catalogo e)
        {
            using var conn = _context.CreateConnection();
            return await conn.ExecuteScalarAsync<int>(
                "sp_Catalogo_Insert",
                new
                {
                    e.Tipo,
                    e.Codigo,
                    e.Descripcion,
                    e.Estado,
                    e.UsuarioCreacion
                },
                commandType: System.Data.CommandType.StoredProcedure
            );
        }

        public async Task<int> UpdateAsync(Catalogo e)
        {
            using var conn = _context.CreateConnection();
            return await conn.ExecuteAsync(
                "sp_Catalogo_Update",
                new
                {
                    e.CatalogoId,
                    e.Tipo,
                    e.Codigo,
                    e.Descripcion,
                    e.Estado,
                    e.UsuarioModificacion
                },
                commandType: System.Data.CommandType.StoredProcedure
            );
        }

        public async Task<int> DeleteAsync(int catalogoId, string usuarioModificacion)
        {
            using var conn = _context.CreateConnection();
            return await conn.ExecuteAsync(
                "sp_Catalogo_Delete",
                new { CatalogoId = catalogoId, UsuarioModificacion = usuarioModificacion },
                commandType: System.Data.CommandType.StoredProcedure
            );
        }

        public async Task<Catalogo?> GetByIdAsync(int catalogoId)
        {
            using var conn = _context.CreateConnection();
            return await conn.QueryFirstOrDefaultAsync<Catalogo>(
                "sp_Catalogo_GetById",
                new { CatalogoId = catalogoId },
                commandType: System.Data.CommandType.StoredProcedure
            );
        }

        public async Task<IEnumerable<Catalogo>> GetAllAsync(string? tipo = null, string? codigo = null, bool? estado = null)
        {
            using var conn = _context.CreateConnection();
            return await conn.QueryAsync<Catalogo>(
                "sp_Catalogo_GetAll",
                new { Tipo = tipo, Codigo = codigo, Estado = estado },
                commandType: System.Data.CommandType.StoredProcedure
            );
        }
    }
}
