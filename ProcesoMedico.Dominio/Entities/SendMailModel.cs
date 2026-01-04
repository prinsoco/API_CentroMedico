using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProcesoMedico.Dominio.Entities
{
    public class SendMailModel
    {
        public class Main
        {
            public string? template { get; set; }
            public List<string> to { get; set; } = new List<string>();
            public List<string> cc { get; set; } = new List<string>();
            public List<string> bcc { get; set; } = new List<string>();
            public string? subject { get; set; }
            public List<Property> properties { get; set; } = new List<Property>();
            public bool IsBodyHtml { get; set; } = true;
            public Smtp smtp { get; set; } = new Smtp();
        }

        public class Property
        {
            public string? key { get; set; }
            public string? value { get; set; }
        }

        public class Smtp
        {
            public string? from { get; set; }
            public string? displayName { get; set; }
            public string? domain { get; set; }
            public string? host { get; set; }
            public string? user { get; set; }
            public string? password { get; set; }
            public int port { get; set; }
        }
    }
}
