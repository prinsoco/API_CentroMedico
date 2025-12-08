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
    public class RolService : GenericService<Rol>, IRolService
    {
        private readonly IGenericRepository<Rol> _repo;

        public RolService(IGenericRepository<Rol> repo) : base(repo)
        {
            _repo = repo;
        }

        public async Task<int> InsertRolAsync(Rol Rol)
        {
            var spParams = new
            {
                Rol.Descripcion,
                Rol.Estado,
                Rol.UsuarioCreacion
            };

            return await _repo.InsertAsync(Rol, spParams);
        }

        public async Task<int> UpdateRolAsync(Rol Rol)
        {
            var spParams = new
            {
                Rol.RolId,
                Rol.Descripcion,
                Rol.Estado,
                Rol.UsuarioModificacion
            };

            return await _repo.UpdateAsync(Rol, spParams);
        }
    }
}
