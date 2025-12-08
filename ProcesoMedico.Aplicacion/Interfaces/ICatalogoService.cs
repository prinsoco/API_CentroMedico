using ProcesoMedico.Dominio.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProcesoMedico.Aplicacion.Interfaces
{
    public interface ICatalogoService : IGenericService<Catalogo> 
    {
        Task<int> InsertCatalogoAsync(Catalogo catalogo);
        Task<int> UpdateCatalogoAsync(Catalogo catalogo);
    }
}
