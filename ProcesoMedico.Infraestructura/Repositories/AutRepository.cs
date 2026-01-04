using ProcesoMedico.Dominio.Entities;
using ProcesoMedico.Dominio.Ports;
using ProcesoMedico.Infraestructura.Persistence;
using Dapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ProcesoMedico.Dominio.Common;
using ProcesoMedico.Infraestructura.Interfaces;
using System.Data;
using Microsoft.Data.SqlClient;
using System.Reflection.PortableExecutable;
using System.Collections;
using Azure;
using System.Data.Common;

namespace ProcesoMedico.Infraestructura.Repositories
{
    public class AutRepository : IAutRepository
    {
        private readonly DapperContext _context;

        public AutRepository(DapperContext context)
        {
            _context = context;
        }

        public async Task<LoginResponse> LoginAsync(LoginRequest input)
        {
            using var conn = _context.CreateConnection();
            conn.Open();

            try
            {
                return await conn.QueryFirstAsync<LoginResponse>("sp_Login_Sistema", input, null, null, commandType: CommandType.StoredProcedure);
            }
            catch (Exception ex)
            {
                return null;
            }

            return null;
        }
    }
}