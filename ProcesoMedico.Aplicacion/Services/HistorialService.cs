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
    public class HistorialService : GenericService<HistorialClinico>, IHistorialService
    {
        private readonly IGenericRepository<HistorialClinico> _repo;
        public HistorialService(IGenericRepository<HistorialClinico> repo) : base(repo)
        {
            _repo = repo;
        }

        public async Task<int> InsertHistorialAsync(HistorialClinico input)
        {
            var spParams = new
            {
                input.PacienteId,
                input.MedicoId,
                input.CitaId,
                input.Diagnostico,
                input.Receta,
                input.Estado,
                input.UsuarioCreacion
            };

            return await _repo.InsertAsync(input, spParams);
        }

        public async Task<int> UpdateHistorialAsync(HistorialClinico input)
        {
            var spParams = new
            {
                input.HistorialId,
                input.UsuarioModificacion
            };

            return await _repo.UpdateAsync(input, spParams);
        }
    }
}
