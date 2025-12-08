using ProcesoMedico.Dominio.Entities;
using ProcesoMedico.Dominio.Ports;
using ProcesoMedico.Infraestructura.Persistence;
using Dapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProcesoMedico.Infraestructura.Repositories
{
    public class HistoricoRepository : IRepository<Historico>
    {
        private readonly SqlConnectionFactory _factory;
        public HistoricoRepository(SqlConnectionFactory factory) => _factory = factory;

        public async Task<int> CreateAsync(Historico e)
        {
            using var c = _factory.Create();
            return await c.ExecuteScalarAsync<int>("sp_Historico_Create",
                new { e.Pantalla, e.Usuario, e.Maquina, e.DatosEntrada, e.Descripcion, e.Estado },
                commandType: System.Data.CommandType.StoredProcedure);
        }

        public Task<bool> UpdateAsync(Historico e) => Task.FromResult(false); // No update típico

        public async Task<bool> DeleteAsync(int id)
        {
            // No delete; si quieres, agrega SP y lógica
            return await Task.FromResult(false);
        }

        public async Task<Historico?> GetByIdAsync(int id)
        {
            using var c = _factory.Create();
            return await c.QueryFirstOrDefaultAsync<Historico>(
                "sp_Historico_GetById", new { LogId = id },
                commandType: System.Data.CommandType.StoredProcedure);
        }

        public async Task<IEnumerable<Historico>> GetAllAsync()
        {
            using var c = _factory.Create();
            return await c.QueryAsync<Historico>("sp_Historico_GetAll",
                commandType: System.Data.CommandType.StoredProcedure);
        }
    }
}
