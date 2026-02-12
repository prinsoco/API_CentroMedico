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
    public class HorarioService : GenericService<Horario>, IHorarioService
    {
        private readonly IGenericRepository<Horario> _repo;

        public HorarioService(IGenericRepository<Horario> repo) : base(repo)
        {
            _repo = repo;
        }

        public async Task<int> InsertHorarioAsync(Horario Horario)
        {
            var spParams = new
            {
               Horario.HoraInicio,
               Horario.HoraFin,
               Horario.UsuarioCreacion
            };

            return await _repo.InsertAsync(Horario, spParams);
        }

        public async Task<int> UpdateHorarioAsync(Horario Horario)
        {
            var spParams = new
            {
                Horario.HoraInicio,
                Horario.HoraFin,
                Horario.UsuarioModificacion
            };

            return await _repo.UpdateAsync(Horario, spParams);
        }
    }
}
