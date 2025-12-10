using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProcesoMedico.Dominio.Entities
{
    public class DatosCahe
    {
        public class CacheParametros
        {
            public string? Tipo { get; set; }
            public string? Codigo { get; set; }
            public string? Valor { get; set; }
            public string? Descripcion { get; set; }
        }
    }
}
