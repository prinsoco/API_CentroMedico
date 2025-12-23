using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ProcesoMedico.Aplicacion.Interfaces;
using ProcesoMedico.Dominio.Common;
using ProcesoMedico.Dominio.Entities;
using ProcesoMedico.Infraestructura.Interfaces;

namespace ProcesoMedico.Aplicacion.Services
{
    public class GenericService<T> : IGenericService<T>
    {
        private readonly IGenericRepository<T> _repo;
        public GenericService(IGenericRepository<T> repo) => _repo = repo;

        public Task<int> CreateAsync(T entity) => _repo.InsertAsync(entity);
        public Task<int> UpdateAsync(T entity) => _repo.UpdateAsync(entity);
        public Task<int> DeleteAsync(int id, string? usuarioModificacion = null) => _repo.DeleteAsync(id, usuarioModificacion);
        public Task<T?> GetAsync(int id) => _repo.GetByIdAsync(id);
        public Task<IEnumerable<T>> ListAsync(object? filters = null) => _repo.GetAllAsync(filters);
        public Task<PagedResult<T>> ListPagedAsync(object? filters, int pageNumber, int pageSize) => _repo.GetAllPagedAsync(filters, pageNumber, pageSize);
        public Task<T?> LoginAsync(object? filters = null) => _repo.LoginAsync(filters);
        public Task<T?> GetUserAsync(string? user) => _repo.GetByUserAsync(user);
    }
}
