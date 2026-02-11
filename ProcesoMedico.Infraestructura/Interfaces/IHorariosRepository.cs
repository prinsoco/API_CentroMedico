using ProcesoMedico.Dominio.Entities;
using ProcesoMedico.Dominio.Ports;
using ProcesoMedico.Infraestructura.Persistence;
using Dapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ProcesoMedico.Dominio.Common;
using System.Data;

namespace ProcesoMedico.Infraestructura.Interfaces
{
    public interface IHorariosRepository
    {
        ConfiguracionHorario GetHorariosMedico(object? input);
        Task<IEnumerable<Feriados>> GetFeriados(object? input);

        //WebHook
        Task<CitaPaciente> GetCita(object? input);
        Task<IEnumerable<EspecialidadWS>> GetEspecialidad();
        Task<IEnumerable<MedicosWS>> GetMedico(object? param);
    }
}