using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProcesoMedico.Dominio.Entities
{
    public class Encuesta
    {
        public int EncuestaId { get; set; }
        public int? PacienteId { get; set; }
        public int? MedicoId { get; set; }
        public int? CitaId { get; set; }
        public DateTime FechaEnvio { get; set; }
        public DateTime? FechaRespuesta { get; set; }
        public string Estado { get; set; } = default!;
        public string CodigoAcceso { get; set; } = default!;
        public string? CanalEnvio { get; set; }
        public string? ObservacionGeneral { get; set; }
        public decimal? CalificacionGlobal { get; set; }
        public string? CreadoPor { get; set; }
        public DateTime FechaCreacion { get; set; }
        public string UsuarioCreacion { get; set; } = default!;
        public DateTime? FechaModificacion { get; set; }
        public string? UsuarioModificacion { get; set; }
    }
}
