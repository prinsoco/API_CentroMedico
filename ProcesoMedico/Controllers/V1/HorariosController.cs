using Microsoft.AspNetCore.Mvc;
using ProcesoMedico.Aplicacion.Interfaces;
using ProcesoMedico.Aplicacion.Services;
using ProcesoMedico.Dominio.Entities;
using ProcesoMedico.Dominio.Utils;
using Swashbuckle.AspNetCore.Annotations;

namespace ProcesoMedico.Api.Controllers.v1
{
    [ApiController]
    [Route("api/[controller]")]
    public class HorariosController : ControllerBase
    {
        private readonly IHorariosService _service;
        public HorariosController(IHorariosService service) => _service = service;

        /// <summary>Obtiene los horarios (dias, horas) configurados a cada médico</summary>
        /// <remarks>Obtiene los horarios de cada médico</remarks>
        /// <param name="medicoId"></param>
        /// <param name="especialidadId"></param>
        /// <returns></returns>
        [HttpGet("Horarios")]
        [SwaggerOperation(
            Summary = "Obtiene los horarios de trabajo por médico"
        )]
        public async Task<IActionResult> GetAllHorarios([FromHeader] int? medicoId, [FromHeader]  int? especialidadId, [FromHeader] int? pacienteId, [FromHeader] string? fechaDia)
        {
            var items = await _service.GetHorariosMedico(new { MedicoId = medicoId ?? 0, EspecialidadId = especialidadId ?? 0, PacienteId = pacienteId ?? 0, FechaDia = string.IsNullOrEmpty(fechaDia) ? "" : fechaDia });
            return Ok(new ResponseDetails<List<HorariosMedico>>(items));
        }

        /// <summary></summary>
        /// <param name="medicoId"></param>
        /// <param name="especialidadId"></param>
        /// <returns></returns>
        [HttpGet("Feriados")]
        [SwaggerOperation(
            Summary = "Obtiene todos los feriados configurados por año"
        )]
        public async Task<IActionResult> GetAllFeriado([FromHeader] string? anios)
        {
            var items = await _service.GetFeriados(string.IsNullOrEmpty(anios) ? null : new { Anios = anios });
            //return Ok(new ResponseDetails<List<Feriados>>(items));
            return Ok(new ResponseDetails<IEnumerable<Feriados>>(items));
        }
    }
}
