using Microsoft.IdentityModel.Tokens;
using ProcesoMedico.Aplicacion.Interfaces.Seguridad;
using ProcesoMedico.Dominio.Entities;
using ProcesoMedico.Infraestructura.Seguridad;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace ProcesoMedico.Aplicacion.Utils
{
    public interface IAuthTokenService
    {
        JwtModel.Main GenerateToken(LoginResponse usuario, bool McaFrontEnd, bool McaRefreshToken, bool McaAuthDobleFactor, string enviroment);
    }

    public class AuthTokenService : IAuthTokenService
    {
        private readonly ISettingManager _settingManager;
        private readonly IUnitOfWorkRepository _unitOfWork;

        public AuthTokenService(ISettingManager settingManager,
            IUnitOfWorkRepository unitOfWork)
        {
            _settingManager = settingManager;
            _unitOfWork = unitOfWork;
        }

        public JwtModel.Main GenerateToken(LoginResponse usuario, bool McaFrontEnd, bool McaRefreshToken, bool McaAuthDobleFactor, string enviroment)
        {
            #region Keys
            var key = _settingManager?.Authentication?.JwtBearer?.SecurityKey ?? string.Empty;
            var Issuer = _settingManager?.Authentication?.JwtBearer?.Issuer ?? string.Empty;
            var Audience = _settingManager?.Authentication?.JwtBearer?.Audience ?? string.Empty;
            var secretKey = new SymmetricSecurityKey(Encoding.ASCII.GetBytes(key));
            #endregion

            #region Token
            var duracionToken = usuario?.LoginExpToken;

            if (McaAuthDobleFactor)
                duracionToken = 5;

            var time = DateTime.Now.AddMinutes(duracionToken ?? 0);
            var signinCredentials = new SigningCredentials(secretKey, SecurityAlgorithms.HmacSha256);
            var tokeOptions = new JwtSecurityToken(
                issuer: Issuer,
                audience: Audience,
                claims: new List<Claim>()
                {
                      new Claim("loginId", usuario?.LoginId?.ToString() ?? string.Empty),
                      new Claim("loginPerfil", usuario?.LoginPerfil?.ToString() ?? string.Empty),
                      new Claim("LoginDescPerfil", usuario?.LoginDescPerfil?.ToString() ?? string.Empty),
                      new Claim("loginPerfilId", usuario?.LoginPerfilId?.ToString() ?? string.Empty),
                      new Claim("loginUsuario", usuario?.LoginUsuario?.ToString() ?? string.Empty),
                      new Claim("loginNombre", usuario?.LoginNombre?.ToString() ?? string.Empty),
                      new Claim("loginApellidos", usuario?.LoginApellidos?.ToString() ?? string.Empty),
                      new Claim("loginIdentificacion", usuario?.LoginIdentificacion?.ToString() ?? string.Empty),
                      new Claim("loginClave", usuario?.LoginClave?.ToString() ?? string.Empty),
                      new Claim("loginExpToken", usuario?.LoginExpToken?.ToString() ?? string.Empty)
                },
                expires: time,
                signingCredentials: signinCredentials
            );

            var tokenString = new JwtSecurityTokenHandler().WriteToken(tokeOptions);
            #endregion

            #region RefreshToken
            var refreshTokenOptions = new JwtSecurityToken(
                issuer: Issuer,
                audience: Audience,
                claims: new List<Claim>()
                {
                      new Claim("loginId", usuario?.LoginId?.ToString() ?? string.Empty),
                      new Claim("loginPerfil", usuario?.LoginPerfil?.ToString() ?? string.Empty),
                      new Claim("LoginDescPerfil", usuario?.LoginDescPerfil?.ToString() ?? string.Empty),
                      new Claim("loginPerfilId", usuario?.LoginPerfilId?.ToString() ?? string.Empty),
                      new Claim("loginUsuario", usuario?.LoginUsuario?.ToString() ?? string.Empty),
                      new Claim("loginNombre", usuario?.LoginNombre?.ToString() ?? string.Empty),
                      new Claim("loginApellidos", usuario?.LoginApellidos?.ToString() ?? string.Empty),
                      new Claim("loginIdentificacion", usuario?.LoginIdentificacion?.ToString() ?? string.Empty),
                      new Claim("loginClave", usuario?.LoginClave?.ToString() ?? string.Empty),
                      new Claim("loginExpToken", usuario?.LoginExpToken?.ToString() ?? string.Empty)
                },
             //expires: DateTime.Now.AddHours(1),
             expires: time.AddMinutes(5),
             signingCredentials: signinCredentials
            );
            var refreshTokenString = new JwtSecurityTokenHandler().WriteToken(refreshTokenOptions);
            #endregion

            var ultInicio = usuario?.LoginFecUltLogin?.ToString("G") ?? DateTime.Now.ToString("G");

            if (usuario != null && usuario?.LoginId != null && McaFrontEnd == true && McaRefreshToken == false)
                _unitOfWork.SetLastLogin(usuario?.LoginId ?? 0, usuario?.LoginPerfilId ?? 0, DateTime.Now, usuario.LoginUsuario);

            return new JwtModel.Main { Time = time.ToString(), LastLogin = ultInicio, Token = tokenString, RefreshToken = refreshTokenString };
        }

    }
}
