using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;
using Microsoft.Extensions.Configuration;
using ProcesoMedico.Aplicacion.Interfaces;
using ProcesoMedico.Dominio.Entities;
using ProcesoMedico.Infraestructura.Interfaces;
//using Newtonsoft.Json;

namespace ProcesoMedico.Aplicacion.Services
{
    public class PacienteService : GenericService<Paciente>, IPacienteService
    {
        private readonly IGenericRepository<Paciente> _repo;
        private readonly IConfiguration _configuration;

        public PacienteService(IGenericRepository<Paciente> repo, IConfiguration configuration) : base(repo)
        {
            _repo = repo;
            _configuration = configuration;
        }

        public async Task<int> InsertPacienteAsync(Paciente Paciente)
        {
            var spParams = new
            {
                Paciente.PerfilId,
                Paciente.Nombres,
                Paciente.Apellidos,
                Paciente.Identificacion,
                Paciente.Edad,
                Paciente.Usuario,
                Paciente.Email,
                Paciente.Telefono,
                Paciente.Celular,
                Paciente.Direccion,
                Paciente.Estado,
                Paciente.UsuarioCreacion,
                CodPerfil = $"{_configuration["Parametros:PerfilPaciente"]}"
            };

            return await _repo.InsertAsync(Paciente, spParams);
        }

        public async Task<int> UpdatePacienteAsync(Paciente Paciente)
        {
            var spParams = new
            {
                Paciente.PacienteId,
                Paciente.PerfilId,
                Paciente.Nombres,
                Paciente.Apellidos,
                Paciente.Identificacion,
                Paciente.Edad,
                Paciente.Usuario,
                Paciente.Email,
                Paciente.Telefono,
                Paciente.Celular,
                Paciente.Direccion,
                Paciente.Estado,
                Paciente.UsuarioModificacion
            };

            return await _repo.UpdateAsync(Paciente, spParams);
        }

        public async Task<LoginPacienteResponse> LoginPaciente(LoginPacienteRequest input)
        {
            var responseLogin = new LoginPacienteResponse();
            var spParams = new
            {
                Email = input.Email,
                Clave = input.Clave
            };

            var response = await _repo.LoginAsync(spParams);
            /*if(response != null)
            {
                responseLogin = JsonConvert.DeserializeObject<LoginPacienteResponse>(JsonConvert.SerializeObject(response));
            }*/

            return null;
        }
    }
}
