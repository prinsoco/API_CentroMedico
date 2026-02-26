using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProcesoMedico.Aplicacion.Utils
{
    public class Utilitarios
    {
        public string GenerarPhone(string numero)
        {
            if (string.IsNullOrWhiteSpace(numero))
                return string.Empty;

            // Limpiar espacios
            numero = numero.Trim();

            // Caso: +593xxxxxxxxx → 593xxxxxxxxx
            if (numero.StartsWith("+593"))
            {
                return numero.Substring(1);
            }

            // Caso: 0xxxxxxxxx → 593xxxxxxxxx
            if (numero.StartsWith("0"))
            {
                return "593" + numero.Substring(1);
            }

            // Caso: ya viene correcto 593xxxxxxxxx
            if (numero.StartsWith("593"))
            {
                return numero;
            }

            // Caso fallback (si viene solo el número)
            return "593" + numero;
        }
    }
}
