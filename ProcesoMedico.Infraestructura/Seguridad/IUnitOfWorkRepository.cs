using ProcesoMedico.Dominio.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProcesoMedico.Infraestructura.Seguridad
{
    public interface IUnitOfWorkRepository
    {
        Task<int> SetLastLogin(int userId, int perfilId, DateTime fecUltLogin, string usuario);
    }
}
