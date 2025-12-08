using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProcesoMedico.Dominio.Entities
{
    public class Historico
    {
        public int LogId { get; set; }
        public string Pantalla { get; set; } = default!;
        public string Usuario { get; set; } = default!;
        public string Maquina { get; set; } = default!;
        public string? DatosEntrada { get; set; }
        public string Descripcion { get; set; } = default!;
        public bool Estado { get; set; }
        public DateTime FechaCreacion { get; set; }
    }
}
