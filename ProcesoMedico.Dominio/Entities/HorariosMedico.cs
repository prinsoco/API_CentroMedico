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
        public List<CitasxMedico> Citas { get; set; }

        public HorariosMedico()
        {
            DiasAtencion = new List<string?>();
            HorarioLaboral = new List<HorasLaborales>();
            Citas = new List<CitasxMedico>();
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
        public List<CitasxMedico> citasMedico { get; set; }

        public ConfiguracionHorario()
        {
            configMedico = new List<ConfigMedico>();
            configSecuencia = new List<ConfigSecuencia>();
            configRango = new List<ConfigRango>();
            citasMedico = new List<CitasxMedico>();
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

    public class CitasxMedico
    {
        public int? CitaId { get; set; }
        public int? MedicoId { get; set; }
        public int? PacienteId { get; set; }
        public DateTime? FechaCita { get; set; }
        public string? Motivo { get; set; }
        public string? EstadoCita { get; set; }
        public string? DescEstadoCita { get; set; }
    }

    public class Feriados
    {
        public int? FeriadoId { get; set; }
        public int? Anio { get; set; }
        public int? Mes { get; set; }
        public int? Dia { get; set; }
        public string? Descripcion { get; set; }
        public DateTime? FechaCreacion { get; set; }
        public string? UsuarioCreacion { get; set; }
    }

    public class CitaPaciente
    {
        public string? Codigo { get; set; }
        public string? Mensaje { get; set; }
        public string? FechaCita { get; set; }
        public string? Medico { get; set; }
        public string? Especialidad { get; set; }
    }
    
    public class EspecialidadWS
    {
        public int? EspecialidadId { get; set; }
        public string? Especialidad { get; set; }
    }
    
    public class MedicosWS
    {
        public int? MedicoId { get; set; }
        public string? Medico { get; set; }
    }

    public class EspWS
    {
        public List<string>? items { get; set; }

        public EspWS ()
        {
            items = new List<string>();
        }
    }

    public class EspLWS
    {
        public string? especialidad { get; set; }
    }

    public class EspWSItems
    {
        public List<EspecialidadWS>? items { get; set; }

        public EspWSItems()
        {
            items = new List<EspecialidadWS>();
        }
    }

    public class MedWSItems
    {
        public List<MedicosWS>? items { get; set; }

        public MedWSItems()
        {
            items = new List<MedicosWS>();
        }
    }

    public class UsuarioWS
    {
        public string? Codigo { get; set; }
        public string? Mensaje { get; set; }
    }
}
