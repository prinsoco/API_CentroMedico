using ProcesoMedico.Dominio.Entities;
using ProcesoMedico.Dominio.Ports;
using ProcesoMedico.Infraestructura.Persistence;
using Dapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProcesoMedico.Infraestructura.Interfaces
{
    public interface IFrontRepository
    {
        Task<IEnumerable<RouteInfo>> GetMenuFrontAsync(object param);
        Task<IEnumerable<Paciente>> ReportePacienteAsync(object param);
        Task<IEnumerable<Medico>> ReporteMedicoAsync(object param);
        Task<IEnumerable<Cita>> ReporteCitaAsync(object param);
    }
}
