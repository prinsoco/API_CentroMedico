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
    public class PerfilService : GenericService<Perfil>, IPerfilService
    {
        private readonly IGenericRepository<Perfil> _repo;

        public PerfilService(IGenericRepository<Perfil> repo) : base(repo)
        {
            _repo = repo;
        }

        public async Task<int> InsertPerfilAsync(Perfil Perfil)
        {
            var spParams = new
            {
                Perfil.Descripcion,
                Perfil.Estado,
                Perfil.UsuarioCreacion,
                Perfil.Codigo
            };

            return await _repo.InsertAsync(Perfil, spParams);
        }

        public async Task<int> UpdatePerfilAsync(Perfil Perfil)
        {
            var spParams = new
            {
                Perfil.PerfilId,
                Perfil.Descripcion,
                Perfil.UsuarioModificacion,
                Perfil.Codigo
            };

            return await _repo.UpdateAsync(Perfil, spParams);
        }
    }
}
