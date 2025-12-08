using ProcesoMedico.Dominio.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProcesoMedico.Aplicacion.Interfaces
{
    public interface ICitaService : IGenericService<Cita>
    {
        Task<int> InsertCitaAsync(Cita input);
        Task<int> UpdateCitaAsync(Cita input);
    }
}
