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
    public class NotificacionService : GenericService<Notificacion>, INotificacionService
    {
        private readonly IGenericRepository<Notificacion> _repo;
        private readonly IUnitOfWorkRepository _unitofWork;
        private readonly IMailService _mail;
        private readonly IConfiguration _configuration;
        private readonly IPasswordHasher _passwordHasher;

        public NotificacionService(IGenericRepository<Notificacion> repo, IUnitOfWorkRepository unitofWork, IMailService mail,
            IConfiguration configuration, IPasswordHasher passwordHasher) : base(repo)
        {
            _repo = repo;
            _unitofWork = unitofWork;
            _mail = mail;
            _configuration = configuration;
            _passwordHasher = passwordHasher;
        }

        public async Task<int> InsertNotificacionAsync(Notificacion Notificacion)
        {
            var spParams = new
            {
                Notificacion.Codigo,
                Notificacion.Tipo,
                Notificacion.Canal,
                Notificacion.Plantilla,
                Notificacion.Estado,
                Notificacion.UsuarioCreacion
            };

            return await _repo.InsertAsync(Notificacion, spParams);
        }

        public async Task<int> UpdateNotificacionAsync(Notificacion Notificacion)
        {
            var spParams = new
            {
                Notificacion.NotificacionId,
                Notificacion.Codigo,
                Notificacion.Tipo,
                Notificacion.Canal,
                Notificacion.Plantilla,
                Notificacion.Estado,
                Notificacion.UsuarioModificacion
            };

            return await _repo.UpdateAsync(Notificacion, spParams);
        }

        public async Task<int> RecuperarClave(string correo, string tipo, string token, string clave)
        {
            string id = string.Empty;
            var response = new RecuperarClaveResponse();

            if (!string.IsNullOrEmpty(token))
            {
                //string descrypto = descrypToken(token);
                //string[] itemsdescrypto = descrypto.Split(":");
                response = await _unitofWork.RecuperarClave(correo, tipo, token);
                correo = response.Correo;
                string claveHash = _passwordHasher.HashPassword(clave);
                int respUpdate = await _unitofWork.UpdateClave(response.Id+"", claveHash, tipo);
                
                
            }
            else
            {
                response = await _unitofWork.RecuperarClave(correo, tipo, "");
            }

            if (response != null)
            {
                if (string.IsNullOrEmpty(token))
                {
                    generarNotificacionRecuperar(response, correo, $"{_configuration["Notificacion:Clave"]}", "Notificación Recuperación de Contraseña");
                    return 1;
                }
                else
                {
                    generarNotificacionRecuperar(response, correo, $"{_configuration["Notificacion:ClaveOk"]}", "Notificación Contraseña Restablecida");
                    return 1;
                }
            }

            return 0;
        }

        #region Privados
        private void generarNotificacionRecuperar(RecuperarClaveResponse input, string correo, string tipo, string asunto)
        {
            //Notificaciones
            var notificacion = _unitofWork.Notificaciones(new { Combo = "S" }).GetAwaiter().GetResult();

            //Parametros email
            var param = _unitofWork.Parametros(new { Combo = "S", Tipo = "EmailSettings" }).GetAwaiter().GetResult();

            var request = new MailRequest();

            //plantilla
            request.Body = notificacion.Where(x => x.Codigo == $"{_configuration["Notificacion:Codigo"]}" && x.Tipo == tipo)?.FirstOrDefault()?.Plantilla;
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
            request.Subject = asunto;
            request.Json = JsonConvert.SerializeObject(new
            {
                NombreCliente = input.Nombres,
                UrlResetPassword = string.Format("{0}?token={1}", input.UrlResetPassword, input.Id),
                TiempoExpiracion = input.TiempoExpiracion,
                AnioActual = DateTime.Now.Year,
                UrlLogin = input.UrlLogin
            });

            _mail.EnviarEmail(request);
        }

        private string generarToken(string correo, int id)
        {
            var crypto = new CryptoHelper();
            return crypto.Encriptar(string.Format("{0}:{1}", id, correo));
        }

        private string descrypToken(string token)
        {
            var crypto = new CryptoHelper();
            return crypto.Desencriptar(token);
        }
        #endregion
    }
}
