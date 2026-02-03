using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProcesoMedico.Dominio.Entities
{
    public class SubMenu
    {
        public int? SubMenuId { get; set; }
        public int? MenuId { get; set; }
        public string? DescSubMenu { get; set; }
        public string? Path { get; set; }
        public string? Abreviatura { get; set; }
        public Boolean? Estado { get; set; }
        public DateTime? FechaCreacion { get; set; }
        public string? UsuarioCreacion { get; set; }
        public DateTime? FechaModificacion { get; set; }
        public string? UsuarioModificacion { get; set; }
        public string? DescMenu { get; set; }
    }
}
