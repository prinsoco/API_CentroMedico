using Microsoft.AspNetCore.Mvc;
using ProcesoMedico.Aplicacion.Interfaces;
using ProcesoMedico.Aplicacion.Services;
using ProcesoMedico.Dominio.Entities;

namespace ProcesoMedico.Api.Controllers.v1
{
    [ApiController]
    [Route("api/[controller]")]
    public class PerfilController : ControllerBase
    {
        private readonly IPerfilService _service;
        public PerfilController(IPerfilService service) => _service = service;

        [HttpPost("crear")]
        public async Task<IActionResult> Create([FromBody] Perfil dto)
        {
            var id = await _service.InsertPerfilAsync(dto);
            return id > 0 ? Ok(new { Code = "00", Mensaje = "Perfil registrado con exito" }) : Ok(new { Code = "99", Mensaje = "Error al registro el perfil" });
        }

        [HttpPut("update")]
        public async Task<IActionResult> Update([FromBody] Perfil dto)
        {
            var affected = await _service.UpdatePerfilAsync(dto);
            return Ok(new { Code = "00", Mensaje = "Registro actualizado" });
        }

        [HttpGet("getById/{id:int}")]
        public async Task<IActionResult> GetById(int id)
        {
            var item = await _service.GetAsync(id);
            return item is null ? NotFound() : Ok(item);
        }

        [HttpGet("getAll")]
        public async Task<IActionResult> GetAll([FromQuery] string? tipo, [FromQuery] string? codigo, [FromQuery] bool? estado)
        {
            var items = await _service.ListAsync(new { Tipo = tipo, Codigo = codigo, Estado = estado });
            return Ok(items);
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
