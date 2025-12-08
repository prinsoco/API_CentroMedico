using ProcesoMedico.Dominio.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProcesoMedico.Aplicacion.Interfaces
{
    public interface IEspecialidadService : IGenericService<Especialidad>
    {
        Task<int> InsertEspecialidadAsync(Especialidad input);
        Task<int> UpdateEspecialidadAsync(Especialidad input);
    }
}
