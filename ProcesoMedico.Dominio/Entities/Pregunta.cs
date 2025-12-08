using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProcesoMedico.Dominio.Entities
{
    public class Pregunta
    {
        public int PreguntaId { get; set; }
        public string TextoPregunta { get; set; } = default!;
        public string? Categoria { get; set; }
        public string TipoRespuesta { get; set; } = default!;
        public int Orden { get; set; }
        public bool Activa { get; set; }
    }
}
