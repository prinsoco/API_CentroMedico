using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProcesoMedico.Aplicacion.Services.Seguridad.Settings
{
    public class AuthenticationSettings
    {
        public JwtBearer? JwtBearer { get; set; }
    }

    public class JwtBearer
    {
        public bool IsEnabled { get; set; }
        public string? SecurityKey { get; set; }

        public string? Issuer { get; set; }
        public string? Audience { get; set; }
        public int Minutes { get; set; }
    }
}
