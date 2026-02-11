using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.WebUtilities;
using Microsoft.IdentityModel.Tokens;
using ProcesoMedico.Aplicacion.Interfaces;
using ProcesoMedico.Aplicacion.Services;
using ProcesoMedico.Dominio.Entities;
using ProcesoMedico.Dominio.Utils;
using System.Globalization;
using iText.Kernel.Pdf;
using iText.Layout;
using iText.Layout.Element;
using iText.Layout.Properties;
using iText.Kernel.Font;
using iText.IO.Font.Constants;

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
        public async Task<IActionResult> GetAll([FromHeader] string? input, [FromHeader] string? estadoCita, [FromHeader] string? especialidadId, [FromHeader] string? reporte, [FromHeader] string? combo = "N", [FromHeader] int? medicoId = 0, [FromHeader] int? pacienteId = 0,
            [FromHeader] string? fechaInicio = "", [FromHeader] string? fechaFin = "")
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

        [HttpPost("getDownload")]
        public async Task<IActionResult> GetDownload([FromBody] FiltroExcel filtro)
        {
            var items = await _service.ReporteCitaAsync(new { EspecialidadId = int.Parse(string.IsNullOrEmpty(filtro.EspecialidadId) ? "0" : filtro.EspecialidadId), MedicoId = int.Parse(string.IsNullOrEmpty(filtro.MedicoId) ? "0" : filtro.MedicoId), Reporte = filtro.Reporte, PacienteId= int.Parse(string.IsNullOrEmpty(filtro.pacienteid) ? "0" : filtro.pacienteid) });
            if (filtro.Download)
            {
                // 🔹 Textos dinámicos
                string especialidadTexto = string.IsNullOrEmpty(filtro.DescEspecialidad)
                ? "-- Todos --"
                : filtro.DescEspecialidad;

                string medicoTexto = string.IsNullOrEmpty(filtro.DescMedico)
                    ? "-- Todos --"
                    : filtro.DescMedico;

                using var ms = new MemoryStream();

                var writer = new PdfWriter(ms);
                var pdf = new PdfDocument(writer);
                var document = new Document(pdf);

                // Fuente
                PdfFont font = PdfFontFactory.CreateFont(StandardFonts.HELVETICA);
                PdfFont bold = PdfFontFactory.CreateFont(StandardFonts.HELVETICA_BOLD);

                // 📌 TÍTULO
                document.Add(new Paragraph("REPORTE DE CITAS")
                    .SetFont(bold)
                    .SetFontSize(16)
                    .SetTextAlignment(TextAlignment.CENTER)
                    .SetMarginBottom(20));

                // 📍 FILTROS
                document.Add(new Paragraph()
                    .Add(new Text("Especialidad: ").SetFont(bold))
                    .Add(new Text(especialidadTexto).SetFont(font))
                    .SetMarginBottom(3));

                document.Add(new Paragraph()
                    .Add(new Text("Médico: ").SetFont(bold))
                    .Add(new Text(medicoTexto).SetFont(font))
                    .SetMarginBottom(15));

                // 📊 TABLA (3 columnas)
                Table table = new Table(4).UseAllAvailableWidth();

                // Encabezados
                table.AddHeaderCell(new Cell().Add(new Paragraph("Paciente").SetFont(bold)));
                table.AddHeaderCell(new Cell().Add(new Paragraph("Medico").SetFont(bold)));
                table.AddHeaderCell(new Cell().Add(new Paragraph("FechaCita").SetFont(bold)));
                table.AddHeaderCell(new Cell().Add(new Paragraph("EstadoCita").SetFont(bold)));

                // Datos
                foreach (var item in items)
                {
                    table.AddCell(new Paragraph(item.Paciente ?? ""));
                    table.AddCell(new Paragraph(item.Medico ?? ""));
                    table.AddCell(new Paragraph(item.FechaCita?.ToString("yyyy-MM-dd HH:mm:ss",
                                                                        CultureInfo.InvariantCulture) ?? ""));
                    table.AddCell(new Paragraph(item.DescEstadoCita ?? ""));
                }

                document.Add(table);
                document.Close();

                return File(ms.ToArray(), "application/pdf", "Citas.pdf");
            }
            else
            {
                return Ok(new ResponseDetails<IEnumerable<Cita>>(items));
            }
        }
    }
}
