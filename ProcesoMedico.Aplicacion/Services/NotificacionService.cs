using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ProcesoMedico.Aplicacion.Interfaces;
using ProcesoMedico.Dominio.Entities;
using ProcesoMedico.Infraestructura.Interfaces;

namespace ProcesoMedico.Aplicacion.Services
{
    public class NotificacionService : GenericService<Notificacion>, INotificacionService
    {
        private readonly IGenericRepository<Notificacion> _repo;

        public NotificacionService(IGenericRepository<Notificacion> repo) : base(repo)
        {
            _repo = repo;
        }

        public async Task<int> InsertNotificacionAsync(Notificacion Notificacion)
        {
            var spParams = new
            {
                Notificacion.Codigo,
                Notificacion.Tipo,
                Notificacion.Canal,
                Notificacion.Plantilla,
                Notificacion.Estado,
                Notificacion.UsuarioCreacion
            };

            return await _repo.InsertAsync(Notificacion, spParams);
        }

        public async Task<int> UpdateNotificacionAsync(Notificacion Notificacion)
        {
            var spParams = new
            {
                Notificacion.NotificacionId,
                Notificacion.Codigo,
                Notificacion.Tipo,
                Notificacion.Canal,
                Notificacion.Plantilla,
                Notificacion.Estado,
                Notificacion.UsuarioModificacion
            };

            return await _repo.UpdateAsync(Notificacion, spParams);
        }
    }
}
