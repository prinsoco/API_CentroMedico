using Microsoft.AspNetCore.Mvc;
using ProcesoMedico.Aplicacion.Interfaces;
using ProcesoMedico.Aplicacion.Services;
using ProcesoMedico.Dominio.Entities;
using ProcesoMedico.Dominio.Utils;
using static iText.StyledXmlParser.Jsoup.Select.Evaluator;
using Newtonsoft.Json;

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
            var items = await _service.GetEspecialidad();

            return Ok(items);
        }

        [HttpGet("especialidadLine")]
        public async Task<IActionResult> EspecialidadesLine()
        {
            var respNew = new EspLWS();
            var items = (await _service.GetEspecialidad()).ToList();
            if (items != null)
            {
                for(int i = 0; i < items.Count(); i++)
                {
                    respNew.especialidad += (string.Format("{0} - {1}\n", items[i].Id, items[i].Especialidad));
                }
            }

            return Ok(respNew);
        }

        [HttpGet("especialidadItems")]
        public async Task<IActionResult> especialidadItems()
        {
            var itemsEspe = new List<string>();
            var respNew = new EspWSItems();
            var items = (await _service.GetEspecialidad()).ToList();
            if (items != null)
            {
                string jsonData = JsonConvert.SerializeObject(items);
                string[] arrayData = jsonData.Replace("[","").Replace("]","").Split("},");
                for(int i = 0; i < arrayData.Length; i++)
                {
                    if(i == arrayData.Length - 1) {
                        itemsEspe.Add(arrayData[i]+"");
                    }
                    else
                    {
                        itemsEspe.Add(string.Format("{0}{1}", arrayData[i], "}"));
                    }
                }
            }

            return Ok(itemsEspe);
        }

        [HttpGet("medicosItems")]
        public async Task<IActionResult> MedicosItems([FromQuery] string? id)
        {
            var itemsEspe = new List<string>();
            var respNew = new MedWSItems();
            var items = (await _service.GetMedico(id)).ToList();
            if (items != null)
            {
                string jsonData = JsonConvert.SerializeObject(items);
                string[] arrayData = jsonData.Replace("[", "").Replace("]", "").Split("},");
                for (int i = 0; i < arrayData.Length; i++)
                {
                    if (i == arrayData.Length - 1)
                    {
                        itemsEspe.Add(arrayData[i] + "");
                    }
                    else
                    {
                        itemsEspe.Add(string.Format("{0}{1}", arrayData[i], "}"));
                    }
                }
            }

            return Ok(itemsEspe);
        }

        [HttpGet("usuario")]
        public async Task<IActionResult> GetUsuario([FromQuery] string? ident)
        {
            if (string.IsNullOrWhiteSpace(ident))
            {
                var repData = new UsuarioWS
                {
                    Codigo = "9999",
                    Mensaje = "API ejecutada correctamente (sin identificador)",
                    UrlLogin = "Url no valida"
                };

                return Ok(repData);
            }

            var item = await _service.GetUsuario(ident);
            return Ok(item);
        }

        [HttpGet("horariosWS")]
        public async Task<IActionResult> Horarios([FromHeader] string? ident, [FromHeader] string? especialidad, [FromHeader] string? medico)
        {
            var itemsEspe = new List<string>();
            var respNew = new MedWSItems();
            var items = (await _service.GetHorarioWS(ident, especialidad, medico)).ToList();
            if (items != null)
            {
                string jsonData = JsonConvert.SerializeObject(items);
                string[] arrayData = jsonData.Replace("[", "").Replace("]", "").Split("},");
                for (int i = 0; i < arrayData.Length; i++)
                {
                    if (i == arrayData.Length - 1)
                    {
                        itemsEspe.Add(arrayData[i] + "");
                    }
                    else
                    {
                        itemsEspe.Add(string.Format("{0}{1}", arrayData[i], "}"));
                    }
                }
            }

            return Ok(itemsEspe);
        }

        [HttpGet("horariosWSFQ")]
        public async Task<IActionResult> HorariosWSQuery([FromQuery] string? ident, [FromQuery] string? especialidad, [FromQuery] string? medico)
        {
            var itemsEspe = new List<string>();
            var respNew = new MedWSItems();
            var items = (await _service.GetHorarioWS(ident, especialidad, medico)).ToList();
            if (items != null)
            {
                string jsonData = JsonConvert.SerializeObject(items);
                string[] arrayData = jsonData.Replace("[", "").Replace("]", "").Split("},");
                for (int i = 0; i < arrayData.Length; i++)
                {
                    if (i == arrayData.Length - 1)
                    {
                        itemsEspe.Add(arrayData[i] + "");
                    }
                    else
                    {
                        itemsEspe.Add(string.Format("{0}{1}", arrayData[i], "}"));
                    }
                }
            }

            return Ok(itemsEspe);
        }

        [HttpPost("horariosWSPOST")]
        public async Task<IActionResult> HorariosPOST([FromBody] ParamCita? input)
        {
            var itemsEspe = new List<string>();
            var respNew = new MedWSItems();
            var items = (await _service.GetHorarioWS(input.Ident, input.Especialidad, input.Medico)).ToList();
            if (items != null)
            {
                string jsonData = JsonConvert.SerializeObject(items);
                string[] arrayData = jsonData.Replace("[", "").Replace("]", "").Split("},");
                for (int i = 0; i < arrayData.Length; i++)
                {
                    if (i == arrayData.Length - 1)
                    {
                        itemsEspe.Add(arrayData[i] + "");
                    }
                    else
                    {
                        itemsEspe.Add(string.Format("{0}{1}", arrayData[i], "}"));
                    }
                }
            }

            return Ok(itemsEspe);
        }

        [HttpPost("agendarcita")]
        public async Task<IActionResult> AgendamientoCitas([FromBody] GenerarCitaWS input)
        {
            if (input == null)
            {
                var repData = new CitaWSAgendada
                {
                    Codigo = "9999",
                    Mensaje = "Tenemos algunos inconvenientes para realizar el agendamiento, tu Asesor Virtual de Citas se comunicará contigo para una ayuda personalizada"
                };

                return Ok(repData);
            }

            var item = await _service.AgendarCita(input.ident, input.fechacita, input.medico);
            return Ok(item);
        }

        [HttpGet("agendarcitaWS")]
        public async Task<IActionResult> AgendamientoCitasWS([FromQuery] string? ident, [FromQuery] string? fechacita, [FromQuery] string? medico)
        {
            if (string.IsNullOrWhiteSpace(ident) || string.IsNullOrWhiteSpace(fechacita) || string.IsNullOrWhiteSpace(medico))
            {
                var repData = new CitaWSAgendada
                {
                    Codigo = "9999",
                    Mensaje = "Tenemos algunos inconvenientes para realizar el agendamiento, tu Asesor Virtual de Citas se comunicará contigo para una ayuda personalizada"
                };

                return Ok(repData);
            }

            var item = await _service.AgendarCita(ident, fechacita, medico);
            return Ok(item);
        }

    }
}
