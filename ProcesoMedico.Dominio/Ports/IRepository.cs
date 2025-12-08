using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProcesoMedico.Dominio.Ports
{
    public interface IRepository<T>
    {
        Task<int> InsertAsync(T entity);
        Task<bool> UpdateAsync(T entity);
        Task<T?> GetByIdAsync(int id);
        Task<IEnumerable<T>> GetAllAsync();
        Task<bool> DeleteAsync(int id, string usuarioModificacion);
    }
}
