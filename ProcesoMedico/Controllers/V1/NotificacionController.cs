using Microsoft.AspNetCore.Mvc;
using ProcesoMedico.Aplicacion.Interfaces;
using ProcesoMedico.Aplicacion.Services;
using ProcesoMedico.Dominio.Entities;

namespace ProcesoMedico.Api.Controllers.v1
{
    [ApiController]
    [Route("api/notificacion")]
    public class NotificacionController : ControllerBase
    {
        private readonly INotificacionService _service;
        public NotificacionController(INotificacionService service) => _service = service;

        [HttpPost]
        public async Task<IActionResult> Create([FromBody] Notificacion dto)
        {
            var id = await _service.InsertNotificacionAsync(dto);
            return id > 0 ? Ok(new { Code = "00", Mensaje = "Notificación registrada con exito" }) : Ok(new { Code = "99", Mensaje = "Error al registro la notificación" });
        }

        [HttpPut("{id:int}")]
        public async Task<IActionResult> Update(int id, [FromBody] Notificacion dto)
        {
            var affected = await _service.UpdateNotificacionAsync(dto);
            return Ok(new { Code = "00", Mensaje = "Registro actualizado" });
        }

        [HttpGet("{id:int}")]
        public async Task<IActionResult> GetById(int id)
        {
            var item = await _service.GetAsync(id);
            return item is null ? NotFound() : Ok(item);
        }

        [HttpGet]
        public async Task<IActionResult> GetAll([FromQuery] string? tipo, [FromQuery] string? codigo, [FromQuery] bool? estado)
        {
            var items = await _service.ListAsync(new { Tipo = tipo, Codigo = codigo, Estado = estado });
            return Ok(items);
        }

        [HttpGet("paged")]
        public async Task<IActionResult> GetPaged([FromQuery] string? tipo, [FromQuery] string? codigo, [FromQuery] bool? estado,
                                                  [FromQuery] int pageNumber = 1, [FromQuery] int pageSize = 10)
        {
            var result = await _service.ListPagedAsync(new { Tipo = tipo, Codigo = codigo, Estado = estado }, pageNumber, pageSize);
            return Ok(result);
        }

        [HttpDelete("{id:int}")]
        public async Task<IActionResult> Delete(int id, [FromQuery] string usuarioModificacion)
        {
            var affected = await _service.DeleteAsync(id, usuarioModificacion);
            return affected > 0 ? Ok(affected) : NotFound();
        }
    }
}
