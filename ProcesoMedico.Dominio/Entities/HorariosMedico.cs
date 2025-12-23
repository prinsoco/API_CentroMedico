using ProcesoMedico.Dominio.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProcesoMedico.Dominio.Entities
{
    public class HorariosMedico
    {
        public int? MedicoId { get; set; }
        public string? Nombre { get; set; } = default!;
        public int? EspecialidadId { get; set; }
        public string? Especialidad { get; set; } = default!;
        public string? Foto { get; set; } = default!;
        public string? HorarioTexto { get; set; } = default!;
        public DateTime? FechaInicioLaboral { get; set; } = default!;
        public DateTime? FechaFinalLaboral { get; set; } = default!;
        public List<string?> DiasAtencion { get; set; }
        public List<HorasLaborales> HorarioLaboral { get; set; }

        public HorariosMedico()
        {
            DiasAtencion = new List<string?>();
            HorarioLaboral = new List<HorasLaborales>();
        }
    }

    public class HorasLaborales
    {
        public int? IdRango { get; set; }
        public int? MedicoId { get; set; }
        public string? Nombre { get; set; } = default!;
        public DateTime? Hora { get; set; } = default!;
        public DateTime? FechaInicio { get; set; } = default!;
        public DateTime? FechaFin { get; set; } = default!;
    }

    public class ConfiguracionHorario
    {
        public List<ConfigMedico> configMedico { get; set; }
        public List<ConfigSecuencia> configSecuencia { get; set; }
        public List<ConfigRango> configRango { get; set; }

        public ConfiguracionHorario()
        {
            configMedico = new List<ConfigMedico>();
            configSecuencia = new List<ConfigSecuencia>();
            configRango = new List<ConfigRango>();
        }
    }

    public class ConfigMedico
    {
        public int? MedicoId { get; set; }
        public string? Nombre { get; set; }
        public int? EspecialidadId { get; set; }
        public string? DescEspecialidad { get; set; }
        public DateTime? FechaInicioLaboral { get; set; }
        public DateTime? FechaFinLaboral { get; set; }
        public string? HorarioTexto { get; set; } = default!;
        public string? Foto { get; set; }
    }

    public class ConfigSecuencia
    {
        public int? MedicoId { get; set; }
        public string? Nombre { get; set; }
        public string? SecuenciaDia { get; set; }
        public int? HorarioId { get; set; }
        public DateTime? FechaInicioLaboral { get; set; }
        public DateTime? FechaFinLaboral { get; set; }
    }

    public class ConfigRango
    {
        public int? IdRango { get; set; }
        public int? MedicoId { get; set; }
        public string? Nombre { get; set; }
        public DateTime? Hora { get; set; }
        public DateTime? FechaInicio { get; set; }
        public DateTime? FechaFin { get; set; }
        public int? HorarioId { get; set; }
    }
}
