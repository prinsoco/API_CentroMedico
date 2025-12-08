using ProcesoMedico.Dominio.Entities;
using Swashbuckle.AspNetCore.Filters;

namespace ProcesoMedico.Api.Documentacion
{
    public class CrearCatalogoExample : IExamplesProvider<object>
    {
        public object GetExamples()
        {
            return new
            {
                tipo = "EST_CITA",
                codigo = "TER",
                descripcion = "Teminadas",
                estado = true,
                usuarioCreacion = "admin"
            };
        }
    }

    public class UpdateCatalogoExample : IExamplesProvider<object>
    {
        public object GetExamples()
        {
            return new
            {
                catalogoId = 1,
                tipo = "EST_CITA",
                codigo = "TER",
                descripcion = "Teminada",
                estado = true,
                usuarioModificacion = "admin"
            };
        }
    }
}
