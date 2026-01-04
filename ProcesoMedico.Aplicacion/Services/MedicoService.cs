using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNet.Identity;
using Microsoft.Extensions.Configuration;
using ProcesoMedico.Aplicacion.Interfaces;
using ProcesoMedico.Aplicacion.Utils;
using ProcesoMedico.Dominio.Entities;
using ProcesoMedico.Infraestructura.Interfaces;

namespace ProcesoMedico.Aplicacion.Services
{
    public class MedicoService : GenericService<Medico>, IMedicoService
    {
        private readonly IGenericRepository<Medico> _repo;
        private readonly IConfiguration _configuration;
        private readonly IAutRepository _aut;
        private readonly IPasswordHasher _passwordHasher;
        private readonly IAuthTokenService _auttoken;

        public MedicoService(IGenericRepository<Medico> repo, IAutRepository aut, IConfiguration configuration,
            IPasswordHasher passwordHasher, IAuthTokenService auttoken) : base(repo)
        {
            _repo = repo;
            _aut = aut;
            _configuration = configuration;
            _passwordHasher = passwordHasher;
            _auttoken = auttoken;
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

                if (usuario.LoginExpToken?.ToString() == "0")
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
