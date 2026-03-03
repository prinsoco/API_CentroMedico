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
    public class FeriadoService : GenericService<Feriado>, IFeriadoService
    {
        private readonly IGenericRepository<Feriado> _repo;

        public FeriadoService(IGenericRepository<Feriado> repo) : base(repo)
        {
            _repo = repo;
        }

        public async Task<int> InsertFeriadoAsync(Feriado input)
        {
            var spParams = new
            {
                input.Anio,
                input.Mes,
                input.Dia,
                input.Descripcion,
                input.UsuarioCreacion
            };

            return await _repo.InsertAsync(input, spParams);
        }

        public async Task<int> UpdateFeriadoAsync(Feriado input)
        {
            var spParams = new
            {
                input.Anio,
                input.Mes,
                input.Dia,
                input.Descripcion,
                input.UsuarioModificacion
            };

            return await _repo.UpdateAsync(input, spParams);
        }
    }
}
