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
    public class PreguntaService : GenericService<Pregunta>, IPreguntaService
    {
        private readonly IGenericRepository<Pregunta> _repo;

        public PreguntaService(IGenericRepository<Pregunta> repo) : base(repo)
        {
            _repo = repo;
        }

        public async Task<int> InsertPreguntaAsync(Pregunta Pregunta)
        {
            var spParams = new
            {
                Pregunta.TextoPregunta,
                Pregunta.Categoria,
                Pregunta.TipoRespuesta,
                Pregunta.Orden,
                Pregunta.Activa
            };

            return await _repo.InsertAsync(Pregunta, spParams);
        }

        public async Task<int> UpdatePreguntaAsync(Pregunta Pregunta)
        {
            var spParams = new
            {
                Pregunta.PreguntaId,
                Pregunta.TextoPregunta,
                Pregunta.Categoria,
                Pregunta.TipoRespuesta,
                Pregunta.Orden,
                Pregunta.Activa
            };

            return await _repo.UpdateAsync(Pregunta, spParams);
        }
    }
}
