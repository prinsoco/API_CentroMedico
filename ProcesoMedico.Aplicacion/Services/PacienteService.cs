using Microsoft.AspNet.Identity;
using Microsoft.Extensions.Configuration;
using ProcesoMedico.Aplicacion.Interfaces;
using ProcesoMedico.Aplicacion.Utils;
using ProcesoMedico.Dominio.Entities;
using ProcesoMedico.Infraestructura.Interfaces;
using ProcesoMedico.Infraestructura.Seguridad;
using Newtonsoft.Json;
using System;

namespace ProcesoMedico.Aplicacion.Services
{
    public class PacienteService : GenericService<Paciente>, IPacienteService
    {
        private readonly IGenericRepository<Paciente> _repo;
        private readonly IAutRepository _aut;
        private readonly IConfiguration _configuration;
        private readonly IPasswordHasher _passwordHasher;
        private readonly IAuthTokenService _auttoken;
        private readonly IFrontRepository _frontReport;
        private readonly IUnitOfWorkRepository _unitofWork;
        private readonly IMailService _mail;

        public PacienteService(IGenericRepository<Paciente> repo, IAutRepository aut, IConfiguration configuration,
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

        public async Task<int> InsertPacienteAsync(Paciente Paciente)
        {
            string claveHash = _passwordHasher.HashPassword(Paciente.Clave);
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
                Clave = claveHash,
                CodPerfil = $"{_configuration["Parametros:PerfilPaciente"]}"
            };

            int result = 1;// _repo.InsertAsync(Paciente, spParams).GetAwaiter().GetResult();

            if(result > 0)
            {
                generarSuscriptor(Paciente);
                generarNotificacion(Paciente, $"{_configuration["Notificacion:Insertar"]}", $"{_configuration["Notificacion:Codigo"]}", $"{_configuration["Parametros:CodLogin"]}");
            }

            return result;
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
                Paciente.UsuarioModificacion,
                Paciente.Notificacion
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
        
        public async Task<IEnumerable<Paciente>> ReportePacienteAsync(object input)
        {
            return await _frontReport.ReportePacienteAsync(input);
        }

        public async Task<int> RecuperarClave(string correo, string tipo)
        {
            var response = await _unitofWork.RecuperarClave(correo, tipo);
            if(response != null)
            {
                generarNotificacionRecuperar(response, correo);
                return 1;
            }

            return 0;
        }

        #region Privados
        private void generarNotificacion(Paciente Paciente, string tipo, string codigo, string url)
        {
            //Notificaciones
            var notificacion = _unitofWork.Notificaciones(new { Combo = "S" }).GetAwaiter().GetResult();

            //Parametros email
            var param = _unitofWork.Parametros(new { Combo = "S", Tipo = "EmailSettings"  }).GetAwaiter().GetResult();

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
            request.Json = JsonConvert.SerializeObject(new { NombreCliente = string.Format("{0} {1}", Paciente.Nombres, Paciente.Apellidos), UrlLogin = paramLogin?.FirstOrDefault()?.Valor,
                AnioActual = DateTime.Now.Year});
            _mail.EnviarEmail(request);

        }

        private void generarSuscriptor(Paciente input)
        {
            //Parametros WC Api
            var param = _unitofWork.Parametros(new { Combo = "S", Tipo = "WhatChimpApi" }).GetAwaiter().GetResult();

            string numSuscriptor = new Utilitarios().GenerarPhone(input.Celular);
            if (string.IsNullOrEmpty(numSuscriptor) && param != null && param.Any())
            {
                _unitofWork.CrearSuscriptor(new WCApiMetodos.Request()
                {
                    APIKEY = param.Where(x => x.Codigo == $"{_configuration["WCApi:ValApiKey"]}").FirstOrDefault()?.Valor ?? "",
                    PHONENUMBERID = param.Where(x => x.Codigo == $"{_configuration["WCApi:ValPhoneId"]}").FirstOrDefault()?.Valor ?? "",
                    URL = param.Where(x => x.Codigo == $"{_configuration["WCApi:ValUrlCrearSub"]}").FirstOrDefault()?.Valor ?? "",
                    NAME = string.Format("{0} {1}", input.Nombres, input.Apellidos),
                    PHONENUMBER = numSuscriptor
                });
            }
        }

        private void generarNotificacionRecuperar(RecuperarClaveResponse input, string correo)
        {
            //Notificaciones
            var notificacion = _unitofWork.Notificaciones(new { Combo = "S" }).GetAwaiter().GetResult();

            //Parametros email
            var param = _unitofWork.Parametros(new { Combo = "S", Tipo = "EmailSettings" }).GetAwaiter().GetResult();

            var request = new MailRequest();

            //plantilla
            request.Body = notificacion.Where(x => x.Codigo == $"{_configuration["Notificacion:Codigo"]}" && x.Tipo == $"{_configuration["Notificacion:Clave"]}")?.FirstOrDefault()?.Plantilla;
            request.Parametros = param.Select(x => new ParametrosEmail
            {
                Nombre = x.Codigo,
                Valor = x.Valor
            }).ToList();
            request.Recipients = new List<Recipient>()
            {
                new Recipient()
                {
                    To = correo,
                    ToName = input.Nombres
                }
            };
            request.Subject = "Notificación Recuperación de Contraseña";
            request.Json = JsonConvert.SerializeObject(new
            {
                NombreCliente = input.Nombres,
                UrlResetPassword = input.UrlResetPassword,
                TiempoExpiracion = input.TiempoExpiracion,
                AnioActual = DateTime.Now.Year
            });

            _mail.EnviarEmail(request);
        }
        #endregion
    }
}
