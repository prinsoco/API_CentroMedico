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
    public class EncuestaService : GenericService<Encuesta>, IEncuestaService
    {
        private readonly IGenericRepository<Encuesta> _repo;
        public EncuestaService(IGenericRepository<Encuesta> repo) : base(repo)
        {
            _repo = repo;
        }

        public async Task<int> InsertEncuestaAsync(Encuesta Encuesta)
        {
            var spParams = new
            {
                Encuesta.PacienteId,
                Encuesta.MedicoId,
                Encuesta.CitaId,
                Encuesta.FechaEnvio,
                Encuesta.Estado,
                Encuesta.CodigoAcceso,
                Encuesta.CanalEnvio,
                Encuesta.ObservacionGeneral,
                Encuesta.CalificacionGlobal,
                Encuesta.CreadoPor,
                Encuesta.UsuarioCreacion
            };

            return await _repo.InsertAsync(Encuesta, spParams);
        }

        public async Task<int> UpdateEncuestaAsync(Encuesta Encuesta)
        {
            var spParams = new
            {
                Encuesta.EncuestaId,
                Encuesta.FechaRespuesta,
                Encuesta.Estado,
                Encuesta.ObservacionGeneral,
                Encuesta.CalificacionGlobal,
                Encuesta.UsuarioModificacion
            };

            return await _repo.UpdateAsync(Encuesta, spParams);
        }
    }
}
