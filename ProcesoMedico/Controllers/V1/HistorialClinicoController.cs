using Microsoft.AspNetCore.Mvc;
using ProcesoMedico.Aplicacion.Interfaces;
using ProcesoMedico.Aplicacion.Services;
using ProcesoMedico.Dominio.Entities;
using ProcesoMedico.Dominio.Utils;

namespace ProcesoMedico.Api.Controllers.v1
{
    [ApiController]
    [Route("api/[controller]")]
    public class HistorialClinicoController : ControllerBase
    {
        private readonly IHistorialService _service;
        public HistorialClinicoController(IHistorialService service) => _service = service;

        [HttpPost("crear")]
        public async Task<IActionResult> Create([FromBody] HistorialClinico dto)
        {
            var id = await _service.InsertHistorialAsync(dto);
            var response = new ResponseCreate()
            {
                Id = id,
                Message = id > 0 ? "Historial registrado con exito" : "Error al insertar el historial clínico"
            };

            return Ok(response);
        }

        [HttpPut("update")]
        public async Task<IActionResult> Update([FromBody] HistorialClinico dto)
        {
            var affected = await _service.UpdateHistorialAsync(dto);
            var response = new ResponseCreate()
            {
                Id = 0,
                Message = "Cita editada con exito"
            };
            return Ok(response);
        }

        [HttpGet("getById/{id:int}")]
        public async Task<IActionResult> GetById(int id)
        {
            var item = await _service.GetAsync(id);
            return Ok(new ResponseDetails<HistorialClinico>(item));
        }

        [HttpGet("getAll")]
        public async Task<IActionResult> GetAll([FromHeader] string? pacienteId = "0", [FromHeader] string? medicoId = "0", [FromHeader] string? citaId = "0")
        {
            var items = await _service.ListAsync(new { PacienteId = int.Parse(pacienteId), MedicoId = int.Parse(medicoId), CitaId = int.Parse(citaId) });
            return Ok(new ResponseDetails<IEnumerable<HistorialClinico>>(items));
        }

    }
}
