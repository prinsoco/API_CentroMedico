using Microsoft.AspNetCore.Mvc;
using ProcesoMedico.Aplicacion.Interfaces;
using ProcesoMedico.Aplicacion.Services;
using ProcesoMedico.Dominio.Entities;
using ProcesoMedico.Dominio.Utils;

namespace ProcesoMedico.Api.Controllers.v1
{
    [ApiController]
    [Route("api/[controller]")]
    public class AsignacionController : ControllerBase
    {
        private readonly IAsignacionService _service;
        public AsignacionController(IAsignacionService service) => _service = service;

        [HttpPost("crear")]
        public async Task<IActionResult> Create([FromBody] Asignacion dto)
        {
            var id = await _service.InsertAsignacionAsync(dto);
            var response = new ResponseCreate()
            {
                Id = id,
                Message = id == 999 ? "La asignación ya existe configurada" : id > 0 ? "Asignación registrada con exito" : "Error al registrar la asignación"
            };

            return Ok(response);
        }

        [HttpPut("update")]
        public async Task<IActionResult> Update([FromBody] Asignacion dto)
        {
            var affected = await _service.UpdateAsignacionAsync(dto);
            var response = new ResponseCreate()
            {
                Id = affected,
                Message = affected > 0 ? "Asignación editado con exito" : "Error al editar la asignación"
            };
            return Ok(response);
        }

        [HttpGet("getById/{id:int}")]
        public async Task<IActionResult> GetById(int id)
        {
            var item = await _service.GetAsync(id);
            return Ok(new ResponseDetails<Asignacion>(item));
        }

        [HttpGet("getAll")]
        public async Task<IActionResult> GetAll([FromHeader] string? perfilId, [FromHeader] string? menuId, [FromHeader] string? subMenuId, [FromHeader] string? estado,
                                                [FromHeader] string? combo)
        {
            var items = await _service.ListAsync(new { Combo = string.IsNullOrEmpty(combo) ? "N" : combo, PerfilId = string.IsNullOrEmpty(perfilId) ? 0 : int.Parse(perfilId), MenuId = string.IsNullOrEmpty(menuId) ? 0 : int.Parse(menuId), SubMenuId = string.IsNullOrEmpty(subMenuId) ? 0 : int.Parse(subMenuId), Estado = estado == "1" ? true : false });
            return Ok(new ResponseDetails<IEnumerable<Asignacion>>(items));
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
    }
}
