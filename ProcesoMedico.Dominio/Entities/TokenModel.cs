using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProcesoMedico.Dominio.Entities
{
    public class TokenModel
    {
        public class TocAuth
        {
            public string? Authorization { get; set; }
        }

        public class Main
        {
            public DateTime Expires { get; set; }
            public string? Token { get; set; }
            public string? Type { get; set; } = "Bearer";
        }
    }
}
