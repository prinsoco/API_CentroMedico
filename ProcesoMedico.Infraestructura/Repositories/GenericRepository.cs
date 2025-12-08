using ProcesoMedico.Dominio.Entities;
using ProcesoMedico.Dominio.Ports;
using ProcesoMedico.Infraestructura.Persistence;
using Dapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ProcesoMedico.Dominio.Common;
using ProcesoMedico.Infraestructura.Interfaces;
using System.Data;

namespace ProcesoMedico.Infraestructura.Repositories
{
    public class GenericRepository<T> : IGenericRepository<T>
    {
        private readonly DapperContext _context;
        private readonly string _table;

        public GenericRepository(DapperContext context)
        {
            _context = context;
            _table = typeof(T).Name; // matches table name by convention
        }

        private string Sp(string action) => $"sp_{_table}_{action}";

        public async Task<int> InsertAsync(T entity, object? spParams = null)
        {
            using var conn = _context.CreateConnection();
            conn.Open();
            var parameters = spParams ?? entity;

            return await conn.ExecuteScalarAsync<int>(Sp("Insert"), parameters, commandType: CommandType.StoredProcedure);
        }

        public async Task<int> UpdateAsync(T entity, object? spParams = null)
        {
            using var conn = _context.CreateConnection();
            conn.Open();
            var parameters = spParams ?? entity;
            int rsgistro = conn.ExecuteAsync(Sp("Update"), parameters, commandType: CommandType.StoredProcedure).Result;
            return rsgistro;
        }

        public async Task<int> DeleteAsync(int id, string? usuarioModificacion = null)
        {
            using var conn = _context.CreateConnection();
            var param = new DynamicParameters();
            param.Add($"{_table}Id", id); // e.g., CatalogoId, PerfilId, etc.
            if (usuarioModificacion != null) param.Add("UsuarioModificacion", usuarioModificacion);
            return await conn.ExecuteAsync(Sp("Delete"), param, commandType: CommandType.StoredProcedure);
        }

        public async Task<T?> GetByIdAsync(int id)
        {
            using var conn = _context.CreateConnection();
            conn.Open();
            var param = new DynamicParameters();
            param.Add($"{_table}Id", id);
            return await conn.QueryFirstOrDefaultAsync<T>(Sp("GetById"), param, commandType: CommandType.StoredProcedure);
        }

        public async Task<IEnumerable<T>> GetAllAsync(object? filters = null)
        {
            using var conn = _context.CreateConnection();
            return await conn.QueryAsync<T>(Sp("GetAll"), filters, commandType: CommandType.StoredProcedure);
        }

        public async Task<PagedResult<T>> GetAllPagedAsync(object? filters, int pageNumber, int pageSize)
        {
            using var conn = _context.CreateConnection();
            var dyn = filters is null ? new DynamicParameters() : new DynamicParameters(filters);
            dyn.Add("PageNumber", pageNumber);
            dyn.Add("PageSize", pageSize);

            using var multi = await conn.QueryMultipleAsync(Sp("GetAll"), dyn, commandType: CommandType.StoredProcedure);
            var items = await multi.ReadAsync<T>();
            var total = await multi.ReadFirstAsync<int>();

            return new PagedResult<T> { Items = items, TotalCount = total, PageNumber = pageNumber, PageSize = pageSize };
        }

        public async Task<T?> LoginAsync(object? filters = null)
        {
            using var conn = _context.CreateConnection();
            return await conn.QueryFirstOrDefaultAsync<T>(Sp("Login"), filters, commandType: CommandType.StoredProcedure);
        }
    }
}
