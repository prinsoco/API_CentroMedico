using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProcesoMedico.Dominio.Entities
{
    public class LoginRequest
    {
        public string? UsuarioEmail { get; set; } = default!;
        public string? Clave { get; set; } = default!;
        public string? TipoUsuario { get; set; } = default!;
    }

    public class LoginResponse
    {
        public string? LoginNombre { get; set; } = default!;
        public string? LoginApellidos { get; set; } = default!;
        public string? LoginIdentificacion { get; set; } = default!;
        public string? LoginUsuario { get; set; }
        public int? LoginId { get; set; } = default!;
        public int? LoginPerfilId { get; set; } = default!;
        public string? LoginPerfil { get; set; } = default!;
        public string? LoginDescPerfil { get; set; }
        public string? LoginClave { get; set; }
        public int? LoginExpToken { get; set; }
        public DateTime? LoginFecUltLogin { get; set; }
        public string? Time { get; set; }
        public string? LastLogin { get; set; }
        public string? Token { get; set; }
        public string? RefreshToken { get; set; }
        public int? LoginEspecialidad { get; set; }
    }
}
