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
    public class MenuService : GenericService<Menu>, IMenuService
    {
        private readonly IGenericRepository<Menu> _repo;
        private readonly IAutRepository _aut;
        private readonly IConfiguration _configuration;
        private readonly IPasswordHasher _passwordHasher;
        private readonly IAuthTokenService _auttoken;
        private readonly IFrontRepository _front;

        public MenuService(IGenericRepository<Menu> repo, IAutRepository aut, IConfiguration configuration,
            IPasswordHasher passwordHasher, IAuthTokenService auttoken, IFrontRepository front) : base(repo)
        {
            _repo = repo;
            _aut = aut;
            _configuration = configuration;
            _passwordHasher = passwordHasher;
            _auttoken = auttoken;
            _front = front;
        }

        public async Task<int> InsertMenuAsync(Menu input)
        {
            var spParams = new
            {
                input.CodMenu,
                input.CodTipo,
                input.Collapse,
                input.IconTipo,
                input.Path,
                input.Estado,
                input.UsuarioCreacion
            };

            return await _repo.InsertAsync(input, spParams);
        }

        public async Task<int> UpdateMenuAsync(Menu input)
        {
            var spParams = new
            {
                input.MenuId,
                input.CodMenu,
                input.CodTipo,
                input.Collapse,
                input.IconTipo,
                input.Path,
                input.Estado,
                input.UsuarioModificacion
            };

            return await _repo.UpdateAsync(input, spParams);
        }
        
        public async Task<IEnumerable<RouteInfo>> GetMenuFrontAsync()
        {
            return await _front.GetMenuFrontAsync();
        }
    }
}
