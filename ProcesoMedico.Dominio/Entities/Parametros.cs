using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProcesoMedico.Dominio.Entities
{
    public class Parametros
    {
        public int? ParamId { get; set; }
        public string? Tipo { get; set; }
        public string? Codigo { get; set; }
        public string? Valor { get; set; }
        public string? Descripcion { get; set; }
        public Boolean? Estado { get; set; }
        public DateTime? FechaCreacion { get; set; }
        public string? UsuarioCreacion { get; set; }
        public DateTime? FechaModificacion { get; set; }
        public string? UsuarioModificacion { get; set; }
    }
}
