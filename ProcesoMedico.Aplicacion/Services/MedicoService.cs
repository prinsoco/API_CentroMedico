using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNet.Identity;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;
using ProcesoMedico.Aplicacion.Interfaces;
using ProcesoMedico.Aplicacion.Utils;
using ProcesoMedico.Dominio.Entities;
using ProcesoMedico.Infraestructura.Interfaces;
using ProcesoMedico.Infraestructura.Seguridad;

namespace ProcesoMedico.Aplicacion.Services
{
    public class MedicoService : GenericService<Medico>, IMedicoService
    {
        private readonly IGenericRepository<Medico> _repo;
        private readonly IConfiguration _configuration;
        private readonly IAutRepository _aut;
        private readonly IPasswordHasher _passwordHasher;
        private readonly IAuthTokenService _auttoken;
        private readonly IFrontRepository _frontReport;
        private readonly IUnitOfWorkRepository _unitofWork;
        private readonly IMailService _mail;

        public MedicoService(IGenericRepository<Medico> repo, IAutRepository aut, IConfiguration configuration,
            IPasswordHasher passwordHasher, IAuthTokenService auttoken, IFrontRepository frontReport,
            IUnitOfWorkRepository unitofWork, IMailService mail) : base(repo)
        {
            _repo = repo;
            _aut = aut;
            _configuration = configuration;
            _passwordHasher = passwordHasher;
            _auttoken = auttoken;
            _frontReport = frontReport;
            _unitofWork = unitofWork;
            _mail = mail;
        }

        public async Task<int> InsertMedicoAsync(Medico Medico)
        {
            string claveHash = _passwordHasher.HashPassword(string.IsNullOrEmpty(Medico.Clave) ? Medico.Identificacion : Medico.Clave);
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
                CodEspecialidad = "11",
                Clave = claveHash
            };

            int result = _repo.InsertAsync(Medico, spParams).GetAwaiter().GetResult();

            if (result > 0)
            {
                generarNotificacion(Medico, $"{_configuration["Notificacion:Insertar"]}", $"{_configuration["Notificacion:Codigo"]}", $"{_configuration["Parametros:CodLoginAdmin"]}");
            }

            return result;
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

        public async Task<IEnumerable<Medico>> ReporteMedicoAsync(object input)
        {
            return await _frontReport.ReporteMedicoAsync(input);
        }

        #region Privados
        private void generarNotificacion(Medico Paciente, string tipo, string codigo, string url)
        {
            //Notificaciones
            var notificacion = _unitofWork.Notificaciones(new { Combo = "S" }).GetAwaiter().GetResult();

            //Parametros email
            var param = _unitofWork.Parametros(new { Combo = "S", Tipo = "EmailSettings" }).GetAwaiter().GetResult();

            //parametro login
            var paramLogin = _unitofWork.Parametros(new { Combo = "S", Tipo = "NewUser", Codigo = url }).GetAwaiter().GetResult();

            var request = new MailRequest();

            //plantilla
            request.Body = notificacion.Where(x => x.Codigo == codigo && x.Tipo == tipo)?.FirstOrDefault()?.Plantilla;
            request.Parametros = param.Select(x => new ParametrosEmail
            {
                Nombre = x.Codigo,
                Valor = x.Valor
            }).ToList();
            request.Recipients = new List<Recipient>()
            {
                new Recipient()
                {
                    To = Paciente.Email,
                    ToName = string.Format("{0} {1}", Paciente.Nombres, Paciente.Apellidos)
                }
            };
            request.Subject = "Notificación de registro";
            request.Json = JsonConvert.SerializeObject(new
            {
                NombreCliente = string.Format("{0} {1}", Paciente.Nombres, Paciente.Apellidos),
                UrlLogin = paramLogin?.FirstOrDefault()?.Valor,
                AnioActual = DateTime.Now.Year
            });
            _mail.EnviarEmail(request);

        }
        #endregion
    }
}
