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
        Task<IEnumerable<Notificacion>> Notificaciones(object param);
        Task<IEnumerable<Parametros>> Parametros(object param);

        #region Llamar al API
        Task<WCApiMetodos.Response> CrearSuscriptor(WCApiMetodos.Request input);
        #endregion

        #region Fidelizacion
        Task<IEnumerable<FidelizacionCita>> GetFidelizacionCitaAsync(string estadoCita);
        #endregion

        #region Notificaciones
        Task<RecuperarClaveResponse> RecuperarClave(string correo, string tipo, string id);
        Task<int> UpdateClave(string id, string clave, string tipo);
        #endregion
    }
}
