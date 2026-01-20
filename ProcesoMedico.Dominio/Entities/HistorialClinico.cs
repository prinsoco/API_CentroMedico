using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProcesoMedico.Dominio.Entities
{
    public class HistorialClinico
    {
        public int? HistorialId { get; set; }
        public int? PacienteId { get; set; }
        public int? MedicoId { get; set; }
        public int? CitaId { get; set; }
        public string? Diagnostico { get; set; }
        public string? Receta { get; set; }
        public Boolean? Estado { get; set; } = default!;
        public DateTime? FechaCreacion { get; set; }
        public string? UsuarioCreacion { get; set; } = default!;
        public DateTime? FechaModificacion { get; set; }
        public string? UsuarioModificacion { get; set; }
        public string? EstadoCita { get; set; }
        public string? Paciente { get; set; }
        public string? Medico { get; set; }
        public string? Especialidad { get; set; }
        public string? DescEstadoCita { get; set; }
        public string? DescHistorial { get; set; }
    }
}
