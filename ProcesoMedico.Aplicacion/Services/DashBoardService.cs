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
    public class DashBoardService : IDashBoardService
    {
        private readonly IDashBoardRepository _repo;

        public DashBoardService(IDashBoardRepository repo)
        {
            _repo = repo;
        }

        public async Task<SecionOne> SeccionOne()
        {
            return await _repo.SeccionOne();
        }
    }
}
