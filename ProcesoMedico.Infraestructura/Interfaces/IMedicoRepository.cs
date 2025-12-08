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
    public interface IMedicoRepository
    {
        Task<int> InsertAsync(Medico entity);
        Task<int> UpdateAsync(Medico entity);
        Task<int> DeleteAsync(int id, string usuarioModificacion);
        Task<Medico?> GetByIdAsync(int id);
        Task<IEnumerable<Medico>> GetAllAsync(int? especialidadId = null, string? identificacion = null, bool? estado = null);
    }
}
