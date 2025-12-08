using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProcesoMedico.Dominio.Entities
{
    public class RespuestasEncuesta
    {
        public int RespuestaId { get; set; }
        public int EncuestaId { get; set; }
        public int PreguntaId { get; set; }
        public string? RespuestaTexto { get; set; }
        public int? ValorNumerico { get; set; }
        public DateTime FechaRegistro { get; set; }
    }
}
