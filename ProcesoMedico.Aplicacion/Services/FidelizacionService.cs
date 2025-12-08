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
    public class FidelizacionService : GenericService<Fidelizacion>, IFidelizacionService
    {
        private readonly IGenericRepository<Fidelizacion> _repo;
        public FidelizacionService(IGenericRepository<Fidelizacion> repo) : base(repo)
        {
            _repo = repo;
        }

        public async Task<int> InsertFidelizacionAsync(Fidelizacion Fidelizacion)
        {
            var spParams = new
            {
                Fidelizacion.Descripcion,
                Fidelizacion.Estado,
                Fidelizacion.UsuarioCreacion
            };

            return await _repo.InsertAsync(Fidelizacion, spParams);
        }

        public async Task<int> UpdateFidelizacionAsync(Fidelizacion Fidelizacion)
        {
            var spParams = new
            {
                Fidelizacion.FidelizacionId,
                Fidelizacion.Descripcion,
                Fidelizacion.Estado,
                Fidelizacion.UsuarioModificacion
            };

            return await _repo.UpdateAsync(Fidelizacion, spParams);
        }
    }
}
