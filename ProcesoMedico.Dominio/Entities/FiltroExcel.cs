using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProcesoMedico.Dominio.Entities
{
    public class FiltroExcel
    {
        public string? EspecialidadId { get; set; }
        public string? MedicoId { get; set; }
        public string? Reporte { get; set; }
        public string? DescEspecialidad { get; set; }
        public string? DescMedico { get; set; }
        public Boolean Download { get; set; } = false;
        public string? PacienteId { get; set; }
    }
}
