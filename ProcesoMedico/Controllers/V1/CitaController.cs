using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.WebUtilities;
using ProcesoMedico.Aplicacion.Interfaces;
using ProcesoMedico.Aplicacion.Services;
using ProcesoMedico.Dominio.Entities;
using ProcesoMedico.Dominio.Utils;

namespace ProcesoMedico.Api.Controllers.v1
{
    [ApiController]
    [Route("api/[controller]")]
    public class CitaController : ControllerBase
    {
        private readonly ICitaService _service;
        public CitaController(ICitaService service) => _service = service;

        [HttpPost("crear")]
        public async Task<IActionResult> Create([FromBody] Cita dto)
        {
            var id = await _service.InsertCitaAsync(dto);
            var response = new ResponseCreate()
            {
                Id = id,
                Message = id > 0 ? "Cita registrada con exito" :  id == -9999 ? "El horario seleccionado no se encuentra disponible" : id == -1111 ? "Ya tiene una cita agendada para este día" : id == -2222 ? "Ya tiene una cita agendada para el horario seleccionado, con otro médico" : "Error al registro la cita"
            };

            return Ok(response);
        }

        [HttpPut("update")]
        public async Task<IActionResult> Update([FromBody] Cita dto)
        {
            var affected = await _service.UpdateCitaAsync(dto);
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
            return Ok(new ResponseDetails<Cita>(item));
        }

        [HttpGet("getAll")]
        public async Task<IActionResult> GetAll([FromHeader] string? input, [FromHeader] string? estadoCita, [FromHeader] string? combo = "N", [FromHeader] int? medicoId = 0, [FromHeader] int? pacienteId = 0, [FromHeader] string? fechaInicio = "", [FromHeader] string? fechaFin = "")
        {
            var items = await _service.ListAsync(new { Input = input, Combo = combo, EstadoCita = estadoCita, MedicoId = medicoId, PacienteId = pacienteId, FechaInicio = string.IsNullOrEmpty(fechaInicio) ? null : fechaInicio, FechaFin = string.IsNullOrEmpty(fechaFin) ? null : fechaFin });
            return Ok(new ResponseDetails<IEnumerable<Cita>>(items));
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
