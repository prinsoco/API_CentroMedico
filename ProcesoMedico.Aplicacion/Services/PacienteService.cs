using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;
using Microsoft.AspNet.Identity;
using Microsoft.Extensions.Configuration;
using ProcesoMedico.Aplicacion.Interfaces;
using ProcesoMedico.Aplicacion.Utils;
using ProcesoMedico.Dominio.Entities;
using ProcesoMedico.Infraestructura.Interfaces;
//using Newtonsoft.Json;

namespace ProcesoMedico.Aplicacion.Services
{
    public class PacienteService : GenericService<Paciente>, IPacienteService
    {
        private readonly IGenericRepository<Paciente> _repo;
        private readonly IAutRepository _aut;
        private readonly IConfiguration _configuration;
        private readonly IPasswordHasher _passwordHasher;
        private readonly IAuthTokenService _auttoken;

        public PacienteService(IGenericRepository<Paciente> repo, IAutRepository aut, IConfiguration configuration,
            IPasswordHasher passwordHasher, IAuthTokenService auttoken) : base(repo)
        {
            _repo = repo;
            _aut = aut;
            _configuration = configuration;
            _passwordHasher = passwordHasher;
            _auttoken = auttoken;
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

        public async Task<LoginResponse> LoginPaciente(LoginRequest input)
        {
            Boolean mcaDobleFactor = false;
            var usuario = await _aut.LoginAsync(input);
            
            if (usuario != null)
            {
                var verifiedPassword = _passwordHasher.VerifyHashedPassword(usuario.LoginClave ?? "", input.Clave ?? "");
                if (verifiedPassword == PasswordVerificationResult.Failed)
                {
                    #region 401-C Password no valida
                    //401-C Password no valida
                    throw new InvalidOperationException("Credenciales no válidas");
                    #endregion
                }

                if(usuario.LoginExpToken?.ToString() == "0")
                {
                    mcaDobleFactor = true;
                }

                var tokenOutput = _auttoken.GenerateToken(usuario, true, false, mcaDobleFactor, "");

                #region 200 Respuesta OK
                //200 Respuesta OK
                usuario.Time = tokenOutput.Time;
                usuario.LastLogin = tokenOutput.LastLogin;
                usuario.Token = tokenOutput.Token;
                usuario.RefreshToken = tokenOutput.RefreshToken;

                return usuario;
                #endregion
            }

            return null;
        }
    }
}
