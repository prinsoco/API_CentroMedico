using ProcesoMedico.Aplicacion.Interfaces.Seguridad;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Dapper.SqlMapper;
using Microsoft.Extensions.Options;

namespace ProcesoMedico.Aplicacion.Services.Seguridad
{
    public class SettingManager : ISettingManager
    {
        private readonly Settings.AuthenticationSettings _authSettings;
        private readonly Settings.SecuritySettings _securitySettings;
        public SettingManager(IOptions<Settings.AuthenticationSettings> authOtions, IOptions<Settings.SecuritySettings> securityOptions)
        {
            _authSettings = authOtions.Value;
            _securitySettings = securityOptions.Value;
        }

        Settings.AuthenticationSettings ISettingManager.Authentication => _authSettings;
        Settings.SecuritySettings ISettingManager.Security => _securitySettings;
    }
}
