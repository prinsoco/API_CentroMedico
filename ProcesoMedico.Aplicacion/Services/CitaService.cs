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
    public class CitaService : GenericService<Cita>, ICitaService
    {
        private readonly IGenericRepository<Cita> _repo;
        public CitaService(IGenericRepository<Cita> repo) : base(repo)
        {
            _repo = repo;
        }

        public async Task<int> InsertCitaAsync(Cita Cita)
        {
            var spParams = new
            {
                Cita.PacienteId,
                Cita.MedicoId,
                Cita.FechaCita,
                Cita.Motivo,
                Cita.Estado,
                Cita.UsuarioCreacion
            };

            return await _repo.InsertAsync(Cita, spParams);
        }

        public async Task<int> UpdateCitaAsync(Cita Cita)
        {
            var spParams = new
            {
                Cita.CitaId,
                Cita.PacienteId,
                Cita.MedicoId,
                Cita.FechaCita,
                Cita.Motivo,
                Cita.EstadoCita,
                Cita.UsuarioModificacion
            };

            return await _repo.UpdateAsync(Cita, spParams);
        }
    }
}
