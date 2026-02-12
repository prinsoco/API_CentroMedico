using ProcesoMedico.Dominio.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProcesoMedico.Aplicacion.Interfaces
{
    public interface IHorariosService : IGenericService<HorariosMedico>
    {
        Task<List<HorariosMedico>> GetHorariosMedico(object? input);
        //Task<List<Feriados>> GetFeriados(object? input);
        Task<IEnumerable<Feriados>> GetFeriados(object? input);

        //webhook
        Task<CitaPaciente> GetCita(string input);
        Task<IEnumerable<EspecialidadWS>> GetEspecialidad();
        Task<IEnumerable<MedicosWS>> GetMedico(string id);
        Task<UsuarioWS> GetUsuario(string input);
        Task<IEnumerable<HorarioWS>> GetHorarioWS(string ident, string especialidad, string medico);

        Task<CitaWSAgendada> AgendarCita(string ident, string fechacita, string medico);
    }
}
