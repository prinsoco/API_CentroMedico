using Microsoft.AspNetCore.Mvc;
using ProcesoMedico.Api.Documentacion;
using ProcesoMedico.Aplicacion.Interfaces;
using ProcesoMedico.Aplicacion.Services;
using ProcesoMedico.Dominio.Entities;
using ProcesoMedico.Dominio.Utils;
using Swashbuckle.AspNetCore.Filters;

namespace ProcesoMedico.Api.Controllers.v1
{
    [ApiController]
    [Route("api/[controller]")]
    public class DashBoardController : ControllerBase
    {
        private readonly IDashBoardService _service;
        public DashBoardController(IDashBoardService service) => _service = service;

        [HttpGet("seccion-one")]
        [Consumes("application/json")]
        public async Task<IActionResult> SeccionOne()
        {
            var items = await _service.SeccionOne();
            return Ok(new ResponseDetails<SecionOne>(items));
        }
    }
}
