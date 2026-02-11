using Microsoft.AspNetCore.Mvc;
using ProcesoMedico.Aplicacion.Interfaces;
using ProcesoMedico.Aplicacion.Services;
using ProcesoMedico.Dominio.Entities;
using ProcesoMedico.Dominio.Utils;

namespace ProcesoMedico.Api.Controllers.v1
{
    [ApiController]
    [Route("api/[controller]")]
    public class WebHookController : ControllerBase
    {
        private readonly IHorariosService _service;
        public WebHookController(IHorariosService service) => _service = service;

        [HttpGet("cita")]
        public async Task<IActionResult> GetById([FromQuery] string? ident)
        {
            if (string.IsNullOrWhiteSpace(ident))
            {
                var repData = new CitaPaciente
                {
                    Codigo = "0000",
                    Mensaje = "API ejecutada correctamente (sin identificador)",
                    FechaCita = "2026-02-10 10:00",
                    Medico = "Dr. Juan Pérez",
                    Especialidad = "General"
                };

                return Ok(repData);
            }

            var item = await _service.GetCita(ident);
            return Ok(item);
        }

        [HttpGet("especialidades")]
        public async Task<IActionResult> Especialidades()
        {
            var respNew = new EspWS();
            var items = await _service.GetEspecialidad();
            if(items != null)
            {
                foreach (var item in items)
                {
                    respNew.items.Add(string.Format("{0} - {1}", item.EspecialidadId, item.Especialidad));
                }
            }

            return Ok(respNew);
        }

        /*[HttpGet("medicos")]
        public async Task<IActionResult> Medicos([FromQuery] string? especialidadId)
        {
            if (string.IsNullOrWhiteSpace(especialidadId))
            {
                var repData = new CitaPaciente
                {
                    Codigo = "0000",
                    Mensaje = "API ejecutada correctamente (sin identificador)",
                    FechaCita = "2026-02-10 10:00",
                    Medico = "Dr. Juan Pérez",
                    Especialidad = "General"
                };

                return Ok(repData);
            }

            var item = await _service.GetCita(ident);
            return Ok(item);
        }*/
    }
}
