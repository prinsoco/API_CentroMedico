using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProcesoMedico.Dominio.Entities
{
    public class WCApiMetodos
    {
        public class Request
        {
            public string? APIKEY { get; set; }
            public string? PHONENUMBERID { get; set; }
            public string? NAME { get; set; }
            public string? PHONENUMBER { get; set; }
            public string? FIRSTNAME { get; set; }
            public string? LASTNAME { get; set; }
            public string? GENDER { get; set; }
            public string? LABELIDS { get; set; }
            public string? URL { get; set; }
        }

        public class Response
        {
            public string? status { get; set; }
            public string? message { get; set; }
        }
    }
}
