using ProcesoMedico.Dominio.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProcesoMedico.Aplicacion.Interfaces
{
    public interface IRolService : IGenericService<Rol> 
    {
        Task<int> InsertRolAsync(Rol input);
        Task<int> UpdateRolAsync(Rol input);
    }
}
