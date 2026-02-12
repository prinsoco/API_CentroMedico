using ProcesoMedico.Dominio.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProcesoMedico.Aplicacion.Interfaces
{
    public interface IHorarioService : IGenericService<Horario>
    {
        Task<int> InsertHorarioAsync(Horario input);
        Task<int> UpdateHorarioAsync(Horario input);
    }
}
