
namespace ProcesoMedico.Aplicacion.Interfaces.Seguridad
{
    public interface ISettingManager
    {
        Services.Seguridad.Settings.AuthenticationSettings Authentication { get; }
        Services.Seguridad.Settings.SecuritySettings Security { get; }
    }
}
