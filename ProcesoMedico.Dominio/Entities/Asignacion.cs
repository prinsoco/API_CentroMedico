using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProcesoMedico.Dominio.Entities
{
    public class Asignacion
    {
        public int AsignarId { get; set; }
        public int PerfilId { get; set; }
        public int MenuId { get; set; }
        public int SubMenuId { get; set; }
        public bool Estado { get; set; }
        public DateTime FechaCreacion { get; set; }
        public string UsuarioCreacion { get; set; } = default!;
        public DateTime? FechaModificacion { get; set; }
        public string? UsuarioModificacion { get; set; }
        public string? DescPerfil { get; set; }
        public string? DescMenu { get; set; }
        public string? DescSubMenu { get; set; }
    }
}
