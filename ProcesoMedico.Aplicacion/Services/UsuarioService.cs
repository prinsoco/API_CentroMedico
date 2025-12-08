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
    public class UsuarioService : GenericService<Usuario>, IUsuarioService
    {
        private readonly IGenericRepository<Usuario> _repo;

        public UsuarioService(IGenericRepository<Usuario> repo) : base(repo)
        {
            _repo = repo;
        }

        public async Task<int> InsertUsuarioAsync(Usuario Usuario)
        {
            var spParams = new
            {
                Usuario.PerfilId,
                Usuario.Nombres,
                Usuario.Apellidos,
                Usuario.Identificacion,
                Usuario.Edad,
                Usuario.UsuarioNombre,
                Usuario.Email,
                Usuario.Telefono,
                Usuario.Celular,
                Usuario.Direccion,
                Usuario.Estado,
                Usuario.UsuarioCreacion
            };

            return await _repo.InsertAsync(Usuario, spParams);
        }

        public async Task<int> UpdateUsuarioAsync(Usuario Usuario)
        {
            var spParams = new
            {
                Usuario.UsuarioId,
                Usuario.PerfilId,
                Usuario.Nombres,
                Usuario.Apellidos,
                Usuario.Identificacion,
                Usuario.Edad,
                Usuario.UsuarioNombre,
                Usuario.Email,
                Usuario.Telefono,
                Usuario.Celular,
                Usuario.Direccion,
                Usuario.Estado,
                Usuario.UsuarioModificacion
            };

            return await _repo.UpdateAsync(Usuario, spParams);
        }
    }
}
