using Microsoft.AspNetCore.Mvc;
using ProcesoMedico.Aplicacion.Interfaces;
using ProcesoMedico.Aplicacion.Services;
using ProcesoMedico.Dominio.Entities;
using ProcesoMedico.Dominio.Utils;

namespace ProcesoMedico.Api.Controllers.v1
{
    [ApiController]
    [Route("api/[controller]")]
    public class MenuController : ControllerBase
    {
        private readonly IMenuService _service;
        private readonly ISubMenuService _servSubmenu;
        public MenuController(IMenuService service, ISubMenuService servSubmenu)
        {
            _service = service;
            _servSubmenu = servSubmenu;
        }

        [HttpPost("crear")]
        public async Task<IActionResult> Create([FromBody] Menu dto)
        {
            var id = await _service.InsertMenuAsync(dto);
            var response = new ResponseCreate()
            {
                Id = id,
                Message = id > 0 ? "Menu registrado con exito" : "Error al registrar el menu"
            };

            return Ok(response);
        }

        [HttpPut("update")]
        public async Task<IActionResult> Update([FromBody] Menu dto)
        {
            var affected = await _service.UpdateMenuAsync(dto);
            var response = new ResponseCreate()
            {
                Id = affected,
                Message = affected > 0 ? "Paciente editado con exito" : "Error al editar el paciente"
            };
            return Ok(response);
        }

        [HttpGet("getById/{id:int}")]
        public async Task<IActionResult> GetById(int id)
        {
            var item = await _service.GetAsync(id);
            return Ok(new ResponseDetails<Menu>(item));
        }

        [HttpGet("getAll")]
        public async Task<IActionResult> GetAll([FromHeader] string? input, [FromHeader] string? combo, [FromHeader] string? tipo)
        {
            var items = await _service.ListAsync(new { Input = input, Combo = combo, Tipo = string.IsNullOrEmpty(tipo) ? null : tipo });
            return Ok(new ResponseDetails<IEnumerable<Menu>>(items));
        }

        [HttpGet("getPaged")]
        public async Task<IActionResult> GetPaged([FromQuery] string? tipo, [FromQuery] string? codigo, [FromQuery] bool? estado,
                                                  [FromQuery] int pageNumber = 1, [FromQuery] int pageSize = 10)
        {
            var result = await _service.ListPagedAsync(new { Tipo = tipo, Codigo = codigo, Estado = estado }, pageNumber, pageSize);
            return Ok(result);
        }

        [HttpDelete("delete/{id:int}")]
        public async Task<IActionResult> Delete(int id, [FromQuery] string usuarioModificacion)
        {
            var affected = await _service.DeleteAsync(id, usuarioModificacion);
            return affected > 0 ? Ok(affected) : NotFound();
        }

        #region SubMenu
        [HttpPost("crear/submenu")]
        public async Task<IActionResult> CreateSubMenu([FromBody] SubMenu dto)
        {
            var id = await _servSubmenu.InsertSubMenuAsync(dto);
            var response = new ResponseCreate()
            {
                Id = id,
                Message = id > 0 ? "Sub-Menu registrado con exito" : "Error al registrar el sub-menu"
            };

            return Ok(response);
        }

        [HttpPut("update/submenu")]
        public async Task<IActionResult> UpdateSubMenu([FromBody] SubMenu dto)
        {
            var affected = await _servSubmenu.UpdateSubMenuAsync(dto);
            var response = new ResponseCreate()
            {
                Id = affected,
                Message = affected > 0 ? "Sub-Menu editado con exito" : "Error al editar el sub-menu"
            };
            return Ok(response);
        }

        [HttpGet("getById/submenu/{id:int}")]
        public async Task<IActionResult> GetByIdSub(int id)
        {
            var item = await _servSubmenu.GetAsync(id);
            return Ok(new ResponseDetails<SubMenu>(item));
        }

        [HttpGet("getAll/submenu")]
        public async Task<IActionResult> GetAllSub([FromHeader] string? input, [FromHeader] string? combo)
        {
            var items = await _servSubmenu.ListAsync(new { Input = input, Combo = combo });
            return Ok(new ResponseDetails<IEnumerable<SubMenu>>(items));
        }

        [HttpGet("getPaged/submenu")]
        public async Task<IActionResult> GetPagedSub([FromQuery] string? tipo, [FromQuery] string? codigo, [FromQuery] bool? estado,
                                                  [FromQuery] int pageNumber = 1, [FromQuery] int pageSize = 10)
        {
            var result = await _servSubmenu.ListPagedAsync(new { Tipo = tipo, Codigo = codigo, Estado = estado }, pageNumber, pageSize);
            return Ok(result);
        }

        [HttpDelete("delete/submenu/{id:int}")]
        public async Task<IActionResult> DeleteSub(int id, [FromQuery] string usuarioModificacion)
        {
            var affected = await _servSubmenu.DeleteAsync(id, usuarioModificacion);
            return affected > 0 ? Ok(affected) : NotFound();
        }
        #endregion

        [HttpGet("getMenuFront")]
        public async Task<IActionResult> GetMenuFront()
        {
            var items = await _service.GetMenuFrontAsync();
            return Ok(new ResponseDetails<IEnumerable<RouteInfo>>(items));
        }
    }
}
