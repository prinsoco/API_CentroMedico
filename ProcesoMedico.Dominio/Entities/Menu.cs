using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProcesoMedico.Dominio.Entities
{
    public class Menu
    {
        public int? MenuId { get; set; }
        public string? CodMenu { get; set; }
        public string? Path { get; set; }
        public string? Collapse { get; set; }
        public string? CodTipo { get; set; }
        public string? IconTipo { get; set; }
        public Boolean? Estado { get; set; }
        public DateTime? FechaCreacion { get; set; }
        public string? UsuarioCreacion { get; set; }
        public DateTime? FechaModificacion { get; set; }
        public string? UsuarioModificacion { get; set; }
        public string? DescMenu { get; set; }
        public string? Tipo { get; set; }
        public string? DescTipo { get; set; }
    }
}
