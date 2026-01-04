using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProcesoMedico.Dominio.Entities
{
    public class AppSettingModel
    {
        public class Main
        {
            public Jwt? jwt { get; set; }
            public Security? security { get; set; }
            public List<RequestService> services { get; set; } = new List<RequestService>();
            public List<HeaderServices> headerServices { get; set; } = new List<HeaderServices>();
            public SendMailModel.Main? sendMail { get; set; }
            public CotizacionSettings? cotizacionSettings { get; set; }
        }

        public class RequestService
        {
            public string? Provider { get; set; }
            public string? Url { get; set; }
            public int Method { get; set; }
            public List<Header> Headers { get; set; } = new List<Header>();
            public object? Payload { get; set; }
            public object? Result { get; set; }
            public string? Message { get; set; }
            public bool Active { get; set; }
            public string? Tag { get; set; }
        }

        public class Header
        {
            public string? Key { get; set; }
            public string? Value { get; set; }
        }

        public class Jwt
        {
            public string? SecretKey { get; set; }
            public int Minutes { get; set; }
        }

        public class Security
        {
            public string? SecureKey { get; set; }
            public int Minutes { get; set; }
        }

        public class CotizacionSettings
        {
            public string Compania { get; set; }
            public string Key { get; set; }
            public string Value { get; set; }
        }

        public class HeaderServices
        {
            public string? provider { get; set; }
            public string? Key { get; set; }
            public string? Value { get; set; }
        }
    }
}
