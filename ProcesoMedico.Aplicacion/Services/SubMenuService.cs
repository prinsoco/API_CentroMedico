using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;
using Microsoft.AspNet.Identity;
using Microsoft.Extensions.Configuration;
using ProcesoMedico.Aplicacion.Interfaces;
using ProcesoMedico.Aplicacion.Utils;
using ProcesoMedico.Dominio.Entities;
using ProcesoMedico.Infraestructura.Interfaces;
//using Newtonsoft.Json;

namespace ProcesoMedico.Aplicacion.Services
{
    public class SubMenuService : GenericService<SubMenu>, ISubMenuService
    {
        private readonly IGenericRepository<SubMenu> _repo;
        private readonly IAutRepository _aut;
        private readonly IConfiguration _configuration;
        private readonly IPasswordHasher _passwordHasher;
        private readonly IAuthTokenService _auttoken;

        public SubMenuService(IGenericRepository<SubMenu> repo, IAutRepository aut, IConfiguration configuration,
            IPasswordHasher passwordHasher, IAuthTokenService auttoken) : base(repo)
        {
            _repo = repo;
            _aut = aut;
            _configuration = configuration;
            _passwordHasher = passwordHasher;
            _auttoken = auttoken;
        }

        public async Task<int> InsertSubMenuAsync(SubMenu input)
        {
            var spParams = new
            {
                input.DescSubMenu,
                input.Abreviatura,
                input.MenuId,
                input.Path,
                input.Estado,
                input.UsuarioCreacion
            };

            return await _repo.InsertAsync(input, spParams);
        }

        public async Task<int> UpdateSubMenuAsync(SubMenu input)
        {
            var spParams = new
            {
                input.SubMenuId,
                input.DescSubMenu,
                input.Abreviatura,
                input.MenuId,
                input.Path,
                input.Estado,
                input.UsuarioModificacion
            };

            return await _repo.UpdateAsync(input, spParams);
        }
    }
}
