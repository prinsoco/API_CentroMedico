using ProcesoMedico.Dominio.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProcesoMedico.Aplicacion.Interfaces
{
    public interface IPacienteService : IGenericService<Paciente>
    {
        Task<int> InsertPacienteAsync(Paciente input);
        Task<int> UpdatePacienteAsync(Paciente input);
        Task<LoginResponse> LoginPaciente(LoginRequest Paciente);
        Task<IEnumerable<Paciente>> ReportePacienteAsync(object input);
    }
}
