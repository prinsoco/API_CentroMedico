using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProcesoMedico.Aplicacion.Services.Seguridad.Settings
{
    public class SecuritySettings
    {
        public Encryption? Encryption;
    }

    public class Encryption
    {
        public bool IsEnabled { get; set; }
        public string? SecretKey { get; set; }
    }
}
