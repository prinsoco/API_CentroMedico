using ProcesoMedico.Dominio.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProcesoMedico.Aplicacion.Interfaces
{
    public interface IAsignacionService : IGenericService<Asignacion>
    {
        Task<int> InsertAsignacionAsync(Asignacion input);
        Task<int> UpdateAsignacionAsync(Asignacion input);
    }
}
