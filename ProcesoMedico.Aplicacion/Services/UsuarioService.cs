using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Extensions.Configuration;
using ProcesoMedico.Aplicacion.Interfaces;
using ProcesoMedico.Dominio.Entities;
using ProcesoMedico.Infraestructura.Interfaces;

namespace ProcesoMedico.Aplicacion.Services
{
    public class UsuarioService : GenericService<Usuario>, IUsuarioService
    {
        private readonly IGenericRepository<Usuario> _repo;
        private readonly IConfiguration _configuration;

        public UsuarioService(IGenericRepository<Usuario> repo, IConfiguration configuration) : base(repo)
        {
            _repo = repo;
            _configuration = configuration;
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
                Usuario.UsuarioLogin,
                Usuario.Email,
                Usuario.Telefono,
                Usuario.Celular,
                Usuario.Direccion,
                Usuario.Estado,
                Usuario.UsuarioCreacion,
                CodPerfil = $"{_configuration["Parametros:PerfilUsuarios"]}"
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
                Usuario.UsuarioLogin,
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
