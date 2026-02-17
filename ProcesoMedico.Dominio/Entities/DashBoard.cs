using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProcesoMedico.Dominio.Entities
{
    public class SecionOne
    {
        public int? Medicos { get; set; }
        public int? Especialidades { get; set; }
        public int? CitasAsistidas { get; set; }
        public int? Pacientes { get; set; }
        public decimal? TasaAsistencia { get; set; }
        public decimal? TasaInasistencia { get; set; }
        public int? Suscriptores { get; set; }
        public string? EspecialidadAsis { get; set; }

    }
}
