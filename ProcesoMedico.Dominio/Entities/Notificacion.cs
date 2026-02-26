using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProcesoMedico.Dominio.Entities
{
    public class Notificacion
    {
        public int NotificacionId { get; set; }
        public string Codigo { get; set; } = default!;
        public string Tipo { get; set; } = default!;
        public string Canal { get; set; } = default!;
        public string Plantilla { get; set; } = default!;
        public bool Estado { get; set; }
        public DateTime FechaCreacion { get; set; }
        public string UsuarioCreacion { get; set; } = default!;
        public DateTime? FechaModificacion { get; set; }
        public string? UsuarioModificacion { get; set; }
    }

    public class RecuperarClaveReq
    {
        public string? Correo { get; set; }
        public string? Tipo { get; set; }
    }
    public class RecuperarClaveResponse
    {
        public int? Id { get; set; }
        public string? Nombres { get; set; }
        public string? UrlResetPassword { get; set; }
        public string? AnioActual { get; set; }
        public string? TiempoExpiracion { get; set; }

    }
}
