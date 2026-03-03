using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProcesoMedico.Dominio.Entities
{
    public class Feriado
    {
        public int? FeriadoId { get; set; }
        public int? Anio { get; set; } = default!;
        public int? Mes { get; set; } = default!;
        public int? Dia { get; set; } = default!;
        public string? Descripcion { get; set; } = default!;
        public bool? Estado { get; set; }
        public DateTime? FechaCreacion { get; set; }
        public string? UsuarioCreacion { get; set; } = default!;
        public DateTime? FechaModificacion { get; set; }
        public string? UsuarioModificacion { get; set; }
        public string? Fecha { get; set; }
    }
}
