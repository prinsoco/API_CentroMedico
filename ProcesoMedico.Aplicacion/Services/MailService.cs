using System;
using System.Collections.Generic;
using System.Linq;
using MailKit.Net.Smtp;
using MimeKit;
using System.Net.Mime;
using System.Text;
using System.Threading.Tasks;
using ProcesoMedico.Aplicacion.Interfaces;
using ProcesoMedico.Dominio.Entities;
using ProcesoMedico.Infraestructura.Interfaces;
using static System.Runtime.InteropServices.JavaScript.JSType;
using Microsoft.Extensions.Configuration;
using ProcesoMedico.Aplicacion.Interfaces.Seguridad;
using Newtonsoft.Json;
using HandlebarsDotNet;
using ProcesoMedico.Dominio.Constants;

namespace ProcesoMedico.Aplicacion.Services
{
    public class MailService : IMailService
    {
        private readonly IConfiguration _configuration;
        private readonly ISettingManager _settingManager;
        public MailService(IConfiguration configuration, ISettingManager settingManager)
        {
            _configuration = configuration;
            _settingManager = settingManager;
        }

        public async Task<bool> EnviarEmail(MailRequest email)
        {
            MimeMessage message = new MimeMessage();

            #region Parametros
            string remitente = email?.Parametros?.Find(x => x.Nombre == ConstEmailSettings.remitente).Valor ?? "";
            string userName = email?.Parametros?.Find(x => x.Nombre == ConstEmailSettings.userName).Valor ?? "";
            string appPassword = email?.Parametros?.Find(x => x.Nombre == ConstEmailSettings.password).Valor ?? "";
            string host = email?.Parametros?.Find(x => x.Nombre == ConstEmailSettings.host).Valor ?? "";
            string port = email?.Parametros?.Find(x => x.Nombre == ConstEmailSettings.port).Valor ?? "";
            string ssl = email?.Parametros?.Find(x => x.Nombre == ConstEmailSettings.ssl).Valor ?? "";
            #endregion
            try
            {

                MailboxAddress from = new MailboxAddress(userName, remitente);

                MailboxAddress toAdd = new MailboxAddress(email.Recipients[0].ToName, email.Recipients[0].To);
                List<MailboxAddress> to = new List<MailboxAddress>();
                to.Add(toAdd);

                BodyBuilder bodyBuilder = new BodyBuilder();
                bodyBuilder.HtmlBody = ReemplazoHandlebars(email.Body, email.Json);

                message.From.Add(from);
                message.To.AddRange(to);

                message.Subject = email.Subject;
                message.Body = bodyBuilder.ToMessageBody();

                var smtp = new SmtpClient();
                smtp.Connect(host, int.Parse(port), MailKit.Security.SecureSocketOptions.StartTls);
                smtp.Authenticate(remitente, appPassword);
                /*
                if (puerto == "1")
                {
                    smtp.Connect("mail.medicare-soft.com", int.Parse("587"), MailKit.Security.SecureSocketOptions.StartTls);
                    smtp.Authenticate("info_notification_web@medicare-soft.com", "w9iB9#6y4");
                }
                else if (puerto == "2")
                {
                    smtp.Connect("mail.medicare-soft.com", int.Parse("465"), MailKit.Security.SecureSocketOptions.SslOnConnect);
                    smtp.Authenticate("info_notification_web@medicare-soft.com", "w9iB9#6y4");
                }
                else if (puerto == "3")
                {
                    smtp.Connect("mail.api.medicare-soft.com", int.Parse("587"), MailKit.Security.SecureSocketOptions.StartTls);
                    smtp.Authenticate("info_notification_api@api.medicare-soft.com", "o906b7&Cm");
                }
                else
                {
                    smtp.Connect("mail.api.medicare-soft.com", int.Parse("465"), MailKit.Security.SecureSocketOptions.SslOnConnect);
                    smtp.Authenticate("info_notification_api@api.medicare-soft.com", "o906b7&Cm");
                }
                */


                smtp.Send(message);
                smtp.Disconnect(true);
                smtp.Dispose();

            }
            catch (Exception ex)
            {
                message = new MimeMessage();

                #region Parametros
                remitente = email?.Parametros?.Find(x => x.Nombre == ConstEmailSettings.remitenteIS).Valor ?? "";
                userName = email?.Parametros?.Find(x => x.Nombre == ConstEmailSettings.userNameIS).Valor ?? "";
                appPassword = email?.Parametros?.Find(x => x.Nombre == ConstEmailSettings.passwordIS).Valor ?? "";
                host = email?.Parametros?.Find(x => x.Nombre == ConstEmailSettings.hostIS).Valor ?? "";
                port = email?.Parametros?.Find(x => x.Nombre == ConstEmailSettings.portIS).Valor ?? "";
                ssl = email?.Parametros?.Find(x => x.Nombre == ConstEmailSettings.sslIS).Valor ?? "";
                #endregion

                MailboxAddress from = new MailboxAddress(userName, remitente);

                MailboxAddress toAdd = new MailboxAddress(email.Recipients[0].ToName, email.Recipients[0].To);
                List<MailboxAddress> to = new List<MailboxAddress>();
                to.Add(toAdd);

                BodyBuilder bodyBuilder = new BodyBuilder();
                bodyBuilder.HtmlBody = ReemplazoHandlebars(email.Body, email.Json);

                message.From.Add(from);
                message.To.AddRange(to);

                message.Subject = email.Subject;
                message.Body = bodyBuilder.ToMessageBody();

                var smtp = new SmtpClient();
                smtp.Connect(host, int.Parse(port), MailKit.Security.SecureSocketOptions.SslOnConnect);
                smtp.Authenticate(remitente, appPassword);
                /*
                if (puerto == "1")
                {
                    smtp.Connect("mail.medicare-soft.com", int.Parse("587"), MailKit.Security.SecureSocketOptions.StartTls);
                    smtp.Authenticate("info_notification_web@medicare-soft.com", "w9iB9#6y4");
                }
                else if (puerto == "2")
                {
                    smtp.Connect("mail.medicare-soft.com", int.Parse("465"), MailKit.Security.SecureSocketOptions.SslOnConnect);
                    smtp.Authenticate("info_notification_web@medicare-soft.com", "w9iB9#6y4");
                }
                else if (puerto == "3")
                {
                    smtp.Connect("mail.api.medicare-soft.com", int.Parse("587"), MailKit.Security.SecureSocketOptions.StartTls);
                    smtp.Authenticate("info_notification_api@api.medicare-soft.com", "o906b7&Cm");
                }
                else
                {
                    smtp.Connect("mail.api.medicare-soft.com", int.Parse("465"), MailKit.Security.SecureSocketOptions.SslOnConnect);
                    smtp.Authenticate("info_notification_api@api.medicare-soft.com", "o906b7&Cm");
                }
                */

                smtp.Send(message);
                smtp.Disconnect(true);
                smtp.Dispose();

                Log(string.Format("{0} ::: {1} ::: {2} ::: {3}", ex.Message, ex.InnerException?.Message, ex.StackTrace, ex.InnerException?.StackTrace));
            }

            return true;
        }

        private string ReemplazoHandlebars(string plantilla, string param)
        {
            string htmlBody = string.Empty;
            var datos = JsonConvert.DeserializeObject(param);
            //BODY
            if (!string.IsNullOrEmpty(plantilla))
            {
                var tmpBody = Handlebars.Compile(plantilla);
                htmlBody = tmpBody(datos);
            }

            return htmlBody;
        }

        private void Log(string message)
        {
            string logDirectory = @"C:\Inetpub\vhosts\medicare-soft.com\api-medicare\logs";
            try
            {
                if (!Directory.Exists(logDirectory))
                {
                    Directory.CreateDirectory(logDirectory);
                }

                string filePath = Path.Combine(
                    logDirectory,
                    $"log_{DateTime.Now:yyyyMMdd}.txt"
                );

                string logMessage =
                    $"{DateTime.Now:yyyy-MM-dd HH:mm:ss} | {message}{Environment.NewLine}";

                File.AppendAllText(filePath, logMessage, Encoding.UTF8);
            }
            catch
            {
                // ⚠️ Evita lanzar excepciones desde el logger
            }
        }

    }
}
