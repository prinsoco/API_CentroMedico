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
    public class ParametrosService : GenericService<Parametros>, IParametrosService
    {
        private readonly IGenericRepository<Parametros> _repo;

        public ParametrosService(IGenericRepository<Parametros> repo) : base(repo)
        {
            _repo = repo;
        }

        public async Task<int> InsertParametrosAsync(Parametros Parametros)
        {
            var spParams = new
            {
                Parametros.Tipo,
                Parametros.Codigo,
                Parametros.Valor,
                Parametros.Descripcion,
                Parametros.Estado,
                Parametros.UsuarioCreacion
            };

            return await _repo.InsertAsync(Parametros, spParams);
        }

        public async Task<int> UpdateParametrosAsync(Parametros Parametros)
        {
            var spParams = new
            {
                Parametros.ParamId,
                Parametros.Tipo,
                Parametros.Codigo,
                Parametros.Valor,
                Parametros.Descripcion,
                Parametros.UsuarioModificacion
            };

            return await _repo.UpdateAsync(Parametros, spParams);
        }
    }
}
