using ProcesoMedico.Dominio.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProcesoMedico.Aplicacion.Interfaces
{
    public interface IHistorialService : IGenericService<HistorialClinico>
    {
        Task<int> InsertHistorialAsync(HistorialClinico input);
        Task<int> UpdateHistorialAsync(HistorialClinico input);
    }
}
