using ProcesoMedico.Dominio.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProcesoMedico.Aplicacion.Interfaces
{
   public interface IMedicoService : IGenericService<Medico>
    {
        Task<int> InsertMedicoAsync(Medico input);
        Task<int> UpdateMedicoAsync(Medico input);
        Task<LoginResponse> LoginPaciente(LoginRequest login);
    }
}
