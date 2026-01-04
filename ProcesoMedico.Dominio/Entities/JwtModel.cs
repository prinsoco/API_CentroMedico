using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProcesoMedico.Dominio.Entities
{
    public class JwtModel
    {
        public class Main
        {
            public string Time { get; set; }
            public string Token { get; set; }
            public string RefreshToken { get; set; }
            public string? LastLogin { get; set; }
            public string? Redirect { get; set; }
            public string? Tipo { get; set; }
        }
    }
}
