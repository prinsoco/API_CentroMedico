using Microsoft.AspNetCore.Mvc;
using ProcesoMedico.Aplicacion.Interfaces;
using ProcesoMedico.Aplicacion.Services;
using ProcesoMedico.Dominio.Entities;
using ProcesoMedico.Dominio.Utils;

namespace ProcesoMedico.Api.Controllers.v1
{
    [ApiController]
    [Route("api/[controller]")]
    public class HorariosController : ControllerBase
    {
        private readonly IHorariosService _service;
        public HorariosController(IHorariosService service) => _service = service;

        /// <summary>
        /// Obtiene los horarios (dias, horas) configurados a cada médico
        /// </summary>
        /// <param name="medicoId"></param>
        /// <param name="especialidadId"></param>
        /// <returns></returns>
        [HttpGet("getAll")]
        public async Task<IActionResult> GetAll([FromHeader] int? medicoId, [FromHeader]  int? especialidadId)
        {
            var items = await _service.GetHorariosMedico(new { MedicoId = medicoId ?? 0, EspecialidadId = especialidadId ?? 0 });
            return Ok(new ResponseDetails<List<HorariosMedico>>(items));
        }
    }
}
