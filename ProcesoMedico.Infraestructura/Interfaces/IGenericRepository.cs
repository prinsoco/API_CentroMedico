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

namespace ProcesoMedico.Infraestructura.Interfaces
{
    public interface IGenericRepository<T>
    {
        Task<int> InsertAsync(T entity, object? spParams = null);
        Task<int> UpdateAsync(T entity, object? spParams = null);
        Task<int> DeleteAsync(int id, string? usuarioModificacion = null);
        Task<T?> GetByIdAsync(int id);
        Task<IEnumerable<T>> GetAllAsync(object? filters = null);
        Task<PagedResult<T>> GetAllPagedAsync(object? filters, int pageNumber, int pageSize);
        Task<T?> LoginAsync(object? filters = null);
    }
}
