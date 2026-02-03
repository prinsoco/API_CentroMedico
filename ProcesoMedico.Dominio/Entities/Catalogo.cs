using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProcesoMedico.Dominio.Entities
{
    public class Catalogo
    {
        public int? CatalogoId { get; set; }
        public string? Tipo { get; set; } = default!;
        public string? Codigo { get; set; } = default!;
        public string? Descripcion { get; set; } = default!;
        public bool Estado { get; set; } = true;
        public DateTime FechaCreacion { get; set; }
        public DateTime FechaModificacion { get; set; }
        public string? UsuarioCreacion { get; set; } = default!;
        public string? UsuarioModificacion { get; set; } = default!;
    }
}
