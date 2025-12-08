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
    public class MedicoService : GenericService<Medico>, IMedicoService
    {
        private readonly IGenericRepository<Medico> _repo;

        public MedicoService(IGenericRepository<Medico> repo) : base(repo)
        {
            _repo = repo;
        }

        public async Task<int> InsertMedicoAsync(Medico Medico)
        {
            var spParams = new
            {
                Medico.PerfilId,
                Medico.EspecialidadId,
                Medico.Nombres,
                Medico.Apellidos,
                Medico.Identificacion,
                Medico.Edad,
                Medico.UsuarioNombre,
                Medico.Email,
                Medico.Telefono,
                Medico.Celular,
                Medico.Direccion,
                Medico.Estado,
                Medico.UsuarioCreacion
            };

            return await _repo.InsertAsync(Medico, spParams);
        }

        public async Task<int> UpdateMedicoAsync(Medico Medico)
        {
            var spParams = new
            {
                Medico.MedicoId,
                Medico.EspecialidadId,
                Medico.PerfilId,
                Medico.Nombres,
                Medico.Apellidos,
                Medico.Identificacion,
                Medico.Edad,
                Medico.UsuarioNombre,
                Medico.Email,
                Medico.Telefono,
                Medico.Celular,
                Medico.Direccion,
                Medico.Estado,
                Medico.UsuarioModificacion
            };

            return await _repo.UpdateAsync(Medico, spParams);
        }
    }
}
