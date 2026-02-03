using ProcesoMedico.Dominio.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProcesoMedico.Aplicacion.Interfaces
{
    public interface ISubMenuService : IGenericService<SubMenu>
    {
        Task<int> InsertSubMenuAsync(SubMenu input);
        Task<int> UpdateSubMenuAsync(SubMenu input);
    }
}
