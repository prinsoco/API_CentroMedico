using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Extensions.Configuration;
using ProcesoMedico.Aplicacion.Interfaces;
using ProcesoMedico.Dominio.Entities;
using ProcesoMedico.Infraestructura.Interfaces;

namespace ProcesoMedico.Aplicacion.Services
{
    public class MedicoService : GenericService<Medico>, IMedicoService
    {
        private readonly IGenericRepository<Medico> _repo;
        private readonly IConfiguration _configuration;

        public MedicoService(IGenericRepository<Medico> repo, IConfiguration configuration) : base(repo)
        {
            _repo = repo;
            _configuration = configuration;
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
                Medico.Usuario,
                Medico.Email,
                Medico.Telefono,
                Medico.Celular,
                Medico.Direccion,
                Medico.Estado,
                Medico.UsuarioCreacion,
                CodPerfil = $"{_configuration["Parametros:PerfilMedico"]}",
                CodEspecialidad = "11"
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
                Medico.Usuario,
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
