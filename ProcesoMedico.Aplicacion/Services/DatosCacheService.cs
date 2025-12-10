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
    public class DatosCacheService : IDatosCacheService
    {
        private readonly IDatosCacheRepository _repo;

        public DatosCacheService(IDatosCacheRepository repo)
        {
            _repo = repo;
        }

        public async Task<IEnumerable<DatosCahe.CacheParametros>> GetParametros()
        {
            return await _repo.GetParametros();
        }
    }
}
