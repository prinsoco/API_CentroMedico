using ProcesoMedico.Dominio.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProcesoMedico.Aplicacion.Interfaces
{
    public interface IEncuestaService : IGenericService<Encuesta>
    {
        Task<int> InsertEncuestaAsync(Encuesta input);
        Task<int> UpdateEncuestaAsync(Encuesta input);
    }
}
