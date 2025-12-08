using ProcesoMedico.Dominio.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProcesoMedico.Aplicacion.Interfaces
{
    public interface IRespuestasEncuestaService : IGenericService<RespuestasEncuesta>
    {
        Task<int> InsertRespuestaAsync(RespuestasEncuesta input);
        Task<int> UpdateRespuestaAsync(RespuestasEncuesta input);
    }
}
