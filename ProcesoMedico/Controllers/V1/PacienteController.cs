using Microsoft.AspNetCore.Mvc;
using ProcesoMedico.Aplicacion.Interfaces;
using ProcesoMedico.Aplicacion.Services;
using ProcesoMedico.Dominio.Entities;
using ProcesoMedico.Dominio.Utils;

namespace ProcesoMedico.Api.Controllers.v1
{
    [ApiController]
    [Route("api/[controller]")]
    public class PacienteController : ControllerBase
    {
        private readonly IPacienteService _service;
        public PacienteController(IPacienteService service) => _service = service;

        [HttpPost("login")]
        public async Task<IActionResult> Login([FromBody] LoginRequest input)
        {
            var response = await _service.LoginPaciente(input);
            return Ok(response == null ? new { Codigo = 9999, Mensaje = "Usuario o clave incorrectos" } : response);
        }

        [HttpPost("crear")]
        public async Task<IActionResult> Create([FromBody] Paciente dto)
        {
            var id = await _service.InsertPacienteAsync(dto);
            var response = new ResponseCreate()
            {
                Id = id,
                Message = id > 0 ? "Paciente registrado con exito" : "Error al registro el paciente"
            };
                
            return Ok(response);
        }

        [HttpPut("update")]
        public async Task<IActionResult> Update([FromBody] Paciente dto)
        {
            var affected = await _service.UpdatePacienteAsync(dto);
            var response = new ResponseCreate()
            {
                Id = affected,
                Message = affected > 0 ? "Paciente editado con exito" : "Error al editar el paciente"
            };
            return Ok(response);
        }

        [HttpGet("getById/{id:int}")]
        public async Task<IActionResult> GetById(int id)
        {
            var item = await _service.GetAsync(id);
            return Ok(new ResponseDetails<Paciente>(item));
        }

        [HttpGet("getAll")]
        public async Task<IActionResult> GetAll([FromHeader] string? input, [FromHeader] string? combo)
        {
            var items = await _service.ListAsync(new { Input = input, Combo = combo });
            return Ok(new ResponseDetails<IEnumerable<Paciente>>(items));
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

        //validar usuario
        [HttpGet("getByUser")]
        public async Task<IActionResult> GetByUser([FromHeader] string? user)
        {
            var item = await _service.GetUserAsync(user);
            return Ok(new ResponseDetails<Paciente>(item));
        }
    }
}
