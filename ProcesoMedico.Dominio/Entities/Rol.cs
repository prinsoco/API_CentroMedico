using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProcesoMedico.Dominio.Entities
{
    public class Rol
    {
        public int? RolId { get; set; }
        public string? Descripcion { get; set; } = default!;
        public string? Codigo { get; set; } = default!;
        public bool? Estado { get; set; }
        public DateTime? FechaCreacion { get; set; }
        public string? UsuarioCreacion { get; set; } = default!;
        public DateTime? FechaModificacion { get; set; }
        public string? UsuarioModificacion { get; set; }
    }
}
