using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dapper;
using ProcesoMedico.Dominio.Ports;

namespace ProcesoMedico.Infraestructura.Persistence
{
    public abstract class BaseRepository<T> : IRepository<T>
    {
        protected readonly DapperContext _context;
        protected BaseRepository(DapperContext context) { _context = context; }

        protected abstract string SpInsert { get; }
        protected abstract string SpUpdate { get; }
        protected abstract string SpGetById { get; }
        protected abstract string SpGetAll { get; }
        protected abstract string SpDelete { get; }

        protected abstract DynamicParameters MapInsertParams(T entity);
        protected abstract DynamicParameters MapUpdateParams(T entity);

        public async Task<int> InsertAsync(T entity)
        {
            using var conn = _context.CreateConnection();
            var p = MapInsertParams(entity);
            var id = await conn.ExecuteScalarAsync<int>(SpInsert, p, commandType: CommandType.StoredProcedure);
            return id;
        }

        public async Task<bool> UpdateAsync(T entity)
        {
            using var conn = _context.CreateConnection();
            var p = MapUpdateParams(entity);
            var rows = await conn.ExecuteAsync(SpUpdate, p, commandType: CommandType.StoredProcedure);
            return rows > 0;
        }

        public async Task<T?> GetByIdAsync(int id)
        {
            using var conn = _context.CreateConnection();
            var p = new DynamicParameters(new { Id = id });
            return await conn.QueryFirstOrDefaultAsync<T>(SpGetById, new { CatalogoId = id, ParamId = id, UsuarioId = id, /* se usa el nombre de PK correcto en cada repo */ }, commandType: CommandType.StoredProcedure);
        }

        public async Task<IEnumerable<T>> GetAllAsync()
        {
            using var conn = _context.CreateConnection();
            return await conn.QueryAsync<T>(SpGetAll, commandType: CommandType.StoredProcedure);
        }

        public async Task<bool> DeleteAsync(int id, string usuarioModificacion)
        {
            using var conn = _context.CreateConnection();
            var rows = await conn.ExecuteAsync(SpDelete, new { CatalogoId = id, ParamId = id, UsuarioId = id, /* PK correcto */, UsuarioModificacion = usuarioModificacion }, commandType: CommandType.StoredProcedure);
            return rows > 0;
        }
    }
}
