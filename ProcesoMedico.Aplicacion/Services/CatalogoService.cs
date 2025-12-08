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
    public class CatalogoService : GenericService<Catalogo>, ICatalogoService
    {
        private readonly IGenericRepository<Catalogo> _repo;

        public CatalogoService(IGenericRepository<Catalogo> repo) : base(repo) 
        {
            _repo = repo;
        }

        public async Task<int> InsertCatalogoAsync(Catalogo catalogo)
        {
            var spParams = new
            {
                catalogo.Tipo,
                catalogo.Codigo,
                catalogo.Descripcion,
                catalogo.Estado,
                catalogo.UsuarioCreacion
            };

            return await _repo.InsertAsync(catalogo, spParams);
        }

        public async Task<int> UpdateCatalogoAsync(Catalogo catalogo)
        {
            var spParams = new
            {
                catalogo.CatalogoId,
                catalogo.Tipo,
                catalogo.Codigo,
                catalogo.Descripcion,
                catalogo.Estado,
                catalogo.UsuarioModificacion
            };

            return await _repo.UpdateAsync(catalogo, spParams);
        }
    }
}
