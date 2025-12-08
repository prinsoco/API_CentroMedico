using ProcesoMedico.Dominio.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProcesoMedico.Aplicacion.Interfaces
{
    public interface IFidelizacionService : IGenericService<Fidelizacion>
    {
        Task<int> InsertFidelizacionAsync(Fidelizacion input);
        Task<int> UpdateFidelizacionAsync(Fidelizacion input);
    }
}
