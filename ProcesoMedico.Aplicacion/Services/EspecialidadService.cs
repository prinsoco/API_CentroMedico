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
    public class EspecialidadService : GenericService<Especialidad>, IEspecialidadService
    {
        private readonly IGenericRepository<Especialidad> _repo;
        public EspecialidadService(IGenericRepository<Especialidad> repo) : base(repo)
        {
            _repo = repo;
        }

        public async Task<int> InsertEspecialidadAsync(Especialidad Especialidad)
        {
            var spParams = new
            {
                Especialidad.Descripcion,
                Especialidad.Observacion,
                Especialidad.Estado,
                Especialidad.UsuarioCreacion,
                Especialidad.Whatsapp
            };

            return await _repo.InsertAsync(Especialidad, spParams);
        }

        public async Task<int> UpdateEspecialidadAsync(Especialidad Especialidad)
        {
            var spParams = new
            {
                Especialidad.EspecialidadId,
                Especialidad.Descripcion,
                Especialidad.Observacion,
                Especialidad.Estado,
                Especialidad.UsuarioModificacion,
                Especialidad.Whatsapp
            };

            return await _repo.UpdateAsync(Especialidad, spParams);
        }
    }
}
