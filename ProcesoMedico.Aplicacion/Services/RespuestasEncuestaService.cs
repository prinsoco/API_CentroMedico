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
    public class RespuestasEncuestaService : GenericService<RespuestasEncuesta>, IRespuestasEncuestaService
    {
        private readonly IGenericRepository<RespuestasEncuesta> _repo;

        public RespuestasEncuestaService(IGenericRepository<RespuestasEncuesta> repo) : base(repo)
        {
            _repo = repo;
        }

        public async Task<int> InsertRespuestaAsync(RespuestasEncuesta RespuestasEncuesta)
        {
            var spParams = new
            {
                RespuestasEncuesta.EncuestaId,
                RespuestasEncuesta.PreguntaId,
                RespuestasEncuesta.RespuestaTexto,
                RespuestasEncuesta.ValorNumerico
            };

            return await _repo.InsertAsync(RespuestasEncuesta, spParams);
        }

        public async Task<int> UpdateRespuestaAsync(RespuestasEncuesta RespuestasEncuesta)
        {
            var spParams = new
            {
                RespuestasEncuesta.RespuestaId,
                RespuestasEncuesta.RespuestaTexto,
                RespuestasEncuesta.ValorNumerico
            };

            return await _repo.UpdateAsync(RespuestasEncuesta, spParams);
        }
    }
}
