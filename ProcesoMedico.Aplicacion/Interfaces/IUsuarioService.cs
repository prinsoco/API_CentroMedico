using ProcesoMedico.Dominio.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProcesoMedico.Aplicacion.Interfaces
{
    public interface IUsuarioService : IGenericService<Usuario> 
    {
        Task<int> InsertUsuarioAsync(Usuario input);
        Task<int> UpdateUsuarioAsync(Usuario input);
    }
}
