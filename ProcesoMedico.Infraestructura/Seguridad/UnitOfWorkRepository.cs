using Dapper;
using Microsoft.Data.SqlClient;
using Newtonsoft.Json;
using ProcesoMedico.Dominio.Entities;
using ProcesoMedico.Infraestructura.Persistence;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProcesoMedico.Infraestructura.Seguridad
{
    public class UnitOfWorkRepository : IUnitOfWorkRepository
    {
        private readonly DapperContext _context;

        public UnitOfWorkRepository(DapperContext context)
        {
            _context = context;
        }

        public async Task<int> SetLastLogin(int userId, int perfilId, DateTime fecUltLogin, string usuario)
        {
            var response = new ConfiguracionHorario();
            using var conn = _context.CreateConnection();
            conn.Open();

            var param = new
            {
                Id = 0,
                PerfilId = perfilId,
                UserId = userId,
                FechaUltLogin = fecUltLogin,
                UsuarioCreacion = usuario
            };

            try
            {
                return await conn.ExecuteAsync("sp_UserLogin_InsertUpdate", param, commandType: CommandType.StoredProcedure);
            }
            catch (Exception e)
            {
                throw new Exception("error-> UsuarioRepository::SetLastLogin", e);
            }
        }

        public async Task<IEnumerable<Notificacion>> Notificaciones(object param)
        {
            var response = new ConfiguracionHorario();
            using var conn = _context.CreateConnection();
            conn.Open();

            try
            {
                return await conn.QueryAsync<Notificacion>("sp_Notificacion_GetAll", param, commandType: CommandType.StoredProcedure);
            }
            catch (Exception e)
            {
                throw new Exception("error-> UsuarioRepository::SetLastLogin", e);
            }
        }
        
        public async Task<IEnumerable<Parametros>> Parametros(object param)
        {
            var response = new ConfiguracionHorario();
            using var conn = _context.CreateConnection();
            conn.Open();

            try
            {
                return await conn.QueryAsync<Parametros>("sp_Parametros_GetAll", param, commandType: CommandType.StoredProcedure);
            }
            catch (Exception e)
            {
                throw new Exception("error-> IUnitOfWorkRepository::Parametros", e);
            }
        }

        public async Task<WCApiMetodos.Response> CrearSuscriptor(WCApiMetodos.Request input)
        {
            var respApi = new WCApiMetodos.Response();
            string url = input.URL + $"?apiToken={input.APIKEY}&phoneNumberID={input.PHONENUMBERID}&name={input.NAME}&phoneNumber={input.PHONENUMBER}";
            try
            {
                var client = new HttpClient();
                var request = new HttpRequestMessage(HttpMethod.Post, url);// "https://app.whatchimp.com/api/v1/whatsapp/subscriber/create?apiToken=API-KEY&phoneNumberID=PHONE-NUMBER-ID&name=NAME&phoneNumber=MOBILE");
                request.Headers.Add("Cookie", "XSRF-TOKEN=oOuzMXNx8iRfGj47ZPuvtjbzJ8Hb3KP3SB8NoDy9; __Secure-app_session=rmJl5lXKrVTk4sWcpVdBZb0dBjAldt7jpLXjxM5Y; _btx5i0h383fscy9=_btxvp09jdshg54k1");
                var response = await client.SendAsync(request);
                response.EnsureSuccessStatusCode();
                string jsonData = response.Content.ReadAsStringAsync().Result;
                respApi = JsonConvert.DeserializeObject<WCApiMetodos.Response>(jsonData);

            }
            catch (Exception ex)
            {

                throw;
            }

            return respApi;
        }

        public async Task<WCApiMetodos.Response> UpdateSuscriptor(WCApiMetodos.Request input)
        {
            return null;
        }

        public async Task<IEnumerable<FidelizacionCita>> GetFidelizacionCitaAsync(string estadoCita)
        {
            using var conn = _context.CreateConnection();
            conn.Open();

            var param = new
            {
                EstadoCita = estadoCita
            };

            try
            {
                return await conn.QueryAsync<FidelizacionCita>("sp_Fidelizacion_Paciente", param, commandType: CommandType.StoredProcedure);
            }
            catch (Exception e)
            {
                throw new Exception("error-> IUnitOfWorkRepository::GetFidelizacionCitaAsync", e);
            }

            return null;
        }

        public async Task<RecuperarClaveResponse> RecuperarClave(string correo, string tipo)
        {
            using var conn = _context.CreateConnection();
            conn.Open();

            var param = new
            {
                Correo = correo,
                Tipo = tipo
            };

            try
            {
                return await conn.QueryFirstAsync<RecuperarClaveResponse>("sp_RecuperarClave_Paciente", param, commandType: CommandType.StoredProcedure);
            }
            catch (Exception e)
            {
                throw new Exception("error-> IUnitOfWorkRepository::RecuperarClave", e);
            }

            return null;
        }
    }
}
