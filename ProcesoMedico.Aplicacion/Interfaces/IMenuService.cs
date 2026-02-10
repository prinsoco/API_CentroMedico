using ProcesoMedico.Dominio.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProcesoMedico.Aplicacion.Interfaces
{
    public interface IMenuService : IGenericService<Menu>
    {
        Task<int> InsertMenuAsync(Menu input);
        Task<int> UpdateMenuAsync(Menu input);
        Task<IEnumerable<RouteInfo>> GetMenuFrontAsync(object param);
    }
}
