using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using ProcesoMedico.Dominio.Entities;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProcesoMedico.Aplicacion.Utils
{
    public interface IAppSettings
    {
        AppSettingModel.Main settings { get; }
        TokenModel.Main GetToken();
    }
    public class AppSettings : IAppSettings
    {
        private readonly AppSettingModel.Main _options;

        public AppSettings(IOptions<AppSettingModel.Main> options)
        {
            _options = options.Value;
        }

        public AppSettingModel.Main settings => _options;


        public TokenModel.Main GetToken()
        {
            var secretKey = _options.jwt!.SecretKey ?? "";
            var key = Encoding.ASCII.GetBytes(secretKey);
            var time = DateTime.Now.AddMinutes(_options.jwt.Minutes);

            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Expires = time,
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature)
            };

            var tokenHandler = new JwtSecurityTokenHandler();
            var createdToken = tokenHandler.CreateToken(tokenDescriptor);

            return new TokenModel.Main()
            {
                Expires = time,
                Token = tokenHandler.WriteToken(createdToken)
            };
        }
    }
}
