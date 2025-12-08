using ProcesoMedico.Dominio.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProcesoMedico.Aplicacion.Interfaces
{
    public interface INotificacionService : IGenericService<Notificacion>
    {
        Task<int> InsertNotificacionAsync(Notificacion input);
        Task<int> UpdateNotificacionAsync(Notificacion input);
    }
}
