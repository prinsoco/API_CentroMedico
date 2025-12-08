using ProcesoMedico.Dominio.Entities;
using ProcesoMedico.Dominio.Ports;
using ProcesoMedico.Infraestructura.Persistence;
using Dapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProcesoMedico.Infraestructura.Interfaces
{
    public interface ICatalogoRepository
    {
        Task<int> InsertAsync(Catalogo entity);
        Task<int> UpdateAsync(Catalogo entity);
        Task<int> DeleteAsync(int catalogoId, string usuarioModificacion);
        Task<Catalogo?> GetByIdAsync(int catalogoId);
        Task<IEnumerable<Catalogo>> GetAllAsync(string? tipo = null, string? codigo = null, bool? estado = null);
    }
}
