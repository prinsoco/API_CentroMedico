using ProcesoMedico.Dominio.Common;
using ProcesoMedico.Dominio.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProcesoMedico.Aplicacion.Interfaces
{
    public interface IGenericService<T>
    {
        Task<int> CreateAsync(T entity);
        Task<int> UpdateAsync(T entity);
        Task<int> DeleteAsync(int id, string? usuarioModificacion = null); // soft/hard depending SP
        Task<T?> GetAsync(int id);
        Task<IEnumerable<T>> ListAsync(object? filters = null);
        Task<PagedResult<T>> ListPagedAsync(object? filters, int pageNumber, int pageSize);
        Task<T?> LoginAsync(object? filters = null);
        Task<T?> GetUserAsync(string? user);
    }
}
