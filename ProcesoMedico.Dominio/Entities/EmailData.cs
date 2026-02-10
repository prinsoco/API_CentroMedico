using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProcesoMedico.Dominio.Entities
{
    public class MailRequest
    {
        public string? From { get; set; }
        public List<Recipient>? Recipients { get; set; }
        public List<Recipient>? Cc { get; set; }
        public List<Recipient>? Cco { get; set; }
        public string? Subject { get; set; }
        public string? Body { get; set; }
        public List<DocumentAdd>? Attachments { get; set; }
        public List<string>? ReplayTo { get; set; }
        public List<ParametrosEmail>? Parametros { get; set; }
        public string? Plantilla { get; set; }
        public int PlantillaId { get; set; }
        public string? Remitente { get; set; }
        public string? Json { get; set; }

        public MailRequest()
        {
            Attachments = new List<DocumentAdd>();
            Parametros = new List<ParametrosEmail>();
        }
    }

    public class Recipient
    {
        public string? To { get; set; }
        public string? ToName { get; set; }
    };

    public class DocumentAdd
    {
        public string? Nombre { get; set; }
        public string? Adjunto { get; set; }

    }

    public class Header
    {
        public string? Key { get; set; }
        public string? Value { get; set; }
    }

    public class ParametrosEmail
    {
        public string? Nombre { get; set; }
        public string? Valor { get; set; }
    }
}
