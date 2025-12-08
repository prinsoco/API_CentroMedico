using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ProcesoMedico.Aplicacion.Interfaces;
using ProcesoMedico.Dominio.Entities;
using ProcesoMedico.Infraestructura.Interfaces;

namespace ProcesoMedico.Aplicacion.Services
{
    public class HistoricoService : GenericService<Historico>, IHistoricoService
    {
        private readonly IGenericRepository<Historico> _repo;
        public HistoricoService(IGenericRepository<Historico> repo) : base(repo)
        {
            _repo = repo;
        }

        public async Task<int> InsertHistoricoAsync(Historico Historico)
        {
            var spParams = new
            {
                Historico.Pantalla,
                Historico.Usuario,
                Historico.Maquina,
                Historico.DatosEntrada,
                Historico.Descripcion,
                Historico.Estado
            };

            return await _repo.InsertAsync(Historico, spParams);
        }
    }
}
