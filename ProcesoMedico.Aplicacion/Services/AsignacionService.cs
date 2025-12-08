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
    public class AsignacionService : GenericService<Asignacion>, IAsignacionService
    {
        private readonly IGenericRepository<Asignacion> _repo;
        public AsignacionService(IGenericRepository<Asignacion> repo) : base(repo)
        {
            _repo = repo;
        }

        public async Task<int> InsertAsignacionAsync(Asignacion Asignacion)
        {
            var spParams = new
            {
                Asignacion.RolId,
                Asignacion.UsuarioId,
                Asignacion.Estado,
                Asignacion.UsuarioCreacion
            };

            return await _repo.InsertAsync(Asignacion, spParams);
        }

        public async Task<int> UpdateAsignacionAsync(Asignacion Asignacion)
        {
            var spParams = new
            {
                Asignacion.AsignarId,
                Asignacion.RolId,
                Asignacion.UsuarioId,
                Asignacion.Estado,
                Asignacion.UsuarioModificacion
            };

            return await _repo.UpdateAsync(Asignacion, spParams);
        }
    }
}
