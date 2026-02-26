using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;
using ProcesoMedico.Aplicacion.Interfaces;
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

        public NotificacionService(IGenericRepository<Notificacion> repo, IUnitOfWorkRepository unitofWork, IMailService mail,
            IConfiguration configuration) : base(repo)
        {
            _repo = repo;
            _unitofWork = unitofWork;
            _mail = mail;
            _configuration = configuration;
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

        public async Task<int> RecuperarClave(string correo, string tipo)
        {
            var response = await _unitofWork.RecuperarClave(correo, tipo);
            if (response != null)
            {
                generarNotificacionRecuperar(response, correo);
                return 1;
            }

            return 0;
        }

        #region Privados
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
