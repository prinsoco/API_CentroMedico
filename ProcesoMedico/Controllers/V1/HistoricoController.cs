using Microsoft.AspNetCore.Mvc;
using ProcesoMedico.Aplicacion.Interfaces;
using ProcesoMedico.Aplicacion.Services;
using ProcesoMedico.Dominio.Entities;

namespace ProcesoMedico.Api.Controllers.v1
{
    [ApiController]
    [Route("api/historico")]
    public class HistoricoController : ControllerBase
    {
        private readonly IHistoricoService _service;
        public HistoricoController(IHistoricoService service) => _service = service;

        [HttpPost]
        public async Task<IActionResult> Create([FromBody] Historico dto)
        {
            var id = await _service.InsertHistoricoAsync(dto);
            return id > 0 ? Ok(new { Code = "00", Mensaje = "Historico registrado con exito" }) : Ok(new { Code = "99", Mensaje = "Error al registro el historico" });
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
    }
}
