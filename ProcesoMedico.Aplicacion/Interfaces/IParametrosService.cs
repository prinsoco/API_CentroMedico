using ProcesoMedico.Dominio.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProcesoMedico.Aplicacion.Interfaces
{
    public interface IParametrosService : IGenericService<Parametros>
    {
        Task<int> InsertParametrosAsync(Parametros input);
        Task<int> UpdateParametrosAsync(Parametros input);
    }
}
