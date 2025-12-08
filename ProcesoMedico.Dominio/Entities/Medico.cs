using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProcesoMedico.Dominio.Entities
{
    public class Medico
    {
        public int MedicoId { get; set; }
        public int EspecialidadId { get; set; }
        public int PerfilId { get; set; }
        public string Nombres { get; set; } = default!;
        public string Apellidos { get; set; } = default!;
        public string Identificacion { get; set; } = default!;
        public int Edad { get; set; }
        public string UsuarioNombre { get; set; } = default!;
        public string Email { get; set; } = default!;
        public string? Telefono { get; set; }
        public string Celular { get; set; } = default!;
        public string? Direccion { get; set; }
        public bool Estado { get; set; }
        public DateTime FechaCreacion { get; set; }
        public string UsuarioCreacion { get; set; } = default!;
        public DateTime? FechaModificacion { get; set; }
        public string? UsuarioModificacion { get; set; }
    }
}
