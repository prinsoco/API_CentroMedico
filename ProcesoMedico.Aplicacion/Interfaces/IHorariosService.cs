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
    }
}
