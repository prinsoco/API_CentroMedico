using ProcesoMedico.Dominio.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProcesoMedico.Aplicacion.Interfaces
{
    public interface IPreguntaService : IGenericService<Pregunta>
    {
        Task<int> InsertPreguntaAsync(Pregunta input);
        Task<int> UpdatePreguntaAsync(Pregunta input);
    }
}
