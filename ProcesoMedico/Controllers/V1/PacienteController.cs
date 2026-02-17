using Microsoft.AspNetCore.Mvc;
using ProcesoMedico.Aplicacion.Interfaces;
using ProcesoMedico.Aplicacion.Services;
using ProcesoMedico.Dominio.Entities;
using ProcesoMedico.Dominio.Utils;
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
    public class PacienteController : ControllerBase
    {
        private readonly IPacienteService _service;
        
        private readonly IMailService _mail;
        public PacienteController(IPacienteService service, IMailService mail) 
        { 
            _service = service;
            _mail = mail;
        }

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
                Message = id == -1 ? "Pacientes ya existe" : id > 0 ? "Paciente registrado con exito" : "Error al registro el paciente"
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
        public async Task<IActionResult> GetAll([FromHeader] string? input, [FromHeader] string? combo, [FromHeader] string? especialidadId, [FromHeader] string? medicoId, [FromHeader] string? reporte)
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

        [HttpGet("getByEmail")]
        public async Task<IActionResult> getByEmail([FromHeader] string? tipo, [FromHeader] string? emailuser)
        {
            var item = await _service.GetByEmailAsync(emailuser,tipo);
           
            return Ok(new ResponseDetails<Paciente>(item));
        }

        [HttpPost("getDownload")]
        public async Task<IActionResult> GetDownload([FromBody] FiltroExcel filtro)
        {
            var items = await _service.ReportePacienteAsync(new { EspecialidadId = int.Parse(string.IsNullOrEmpty(filtro.EspecialidadId) ? "0" : filtro.EspecialidadId), MedicoId = int.Parse(string.IsNullOrEmpty(filtro.MedicoId) ? "0" : filtro.MedicoId), Reporte = filtro.Reporte });
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
                document.Add(new Paragraph("REPORTE DE PACIENTES")
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
                Table table = new Table(5).UseAllAvailableWidth();

                // Encabezados
                table.AddHeaderCell(new Cell().Add(new Paragraph("Nombres").SetFont(bold)));
                table.AddHeaderCell(new Cell().Add(new Paragraph("Identificación").SetFont(bold)));
                table.AddHeaderCell(new Cell().Add(new Paragraph("Email").SetFont(bold)));
                table.AddHeaderCell(new Cell().Add(new Paragraph("Teléfono").SetFont(bold)));
                table.AddHeaderCell(new Cell().Add(new Paragraph("Celular").SetFont(bold)));

                // Datos
                foreach (var item in items)
                {
                    table.AddCell(new Paragraph(item.Nombres ?? ""));
                    table.AddCell(new Paragraph(item.Identificacion ?? ""));
                    table.AddCell(new Paragraph(item.Email ?? ""));
                    table.AddCell(new Paragraph(item.Telefono ?? ""));
                    table.AddCell(new Paragraph(item.Celular ?? ""));
                }

                document.Add(table);
                document.Close();

                return File(ms.ToArray(), "application/pdf", "Pacientes.pdf");
            }
            else
            {
                return Ok(new ResponseDetails<IEnumerable<Paciente>>(items));
            }
        }
        
        [HttpPost("email")]
        public async Task<IActionResult> Email([FromBody] string? puerto)
        {
            var response = await _mail.EnviarEmail(null);
            return Ok(response);
        }
    }
}
