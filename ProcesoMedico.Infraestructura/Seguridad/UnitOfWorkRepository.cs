using Dapper;
using Microsoft.Data.SqlClient;
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
    }
}
