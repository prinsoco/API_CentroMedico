using Microsoft.Extensions.Caching.Memory;
using ProcesoMedico.Api.Middlewares;
using ProcesoMedico.Aplicacion.Interfaces;
using ProcesoMedico.Aplicacion.Services;
using ProcesoMedico.Infraestructura.Interfaces;
using ProcesoMedico.Infraestructura.Persistence;
using ProcesoMedico.Infraestructura.Repositories;
using Swashbuckle.AspNetCore.Filters;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen(options =>
{
    options.EnableAnnotations();
    options.ExampleFilters();
});
builder.Services.AddSwaggerExamplesFromAssemblyOf<Program>();

// Dapper context
builder.Services.AddSingleton<DapperContext>();

// Repositories (generic + specific if needed)
builder.Services.AddScoped(typeof(IGenericRepository<>), typeof(GenericRepository<>));

// Services (generic)
builder.Services.AddScoped(typeof(IGenericService<>), typeof(GenericService<>));

// Controllers will request typed services via DI factory bindings:
builder.Services.AddScoped<ICatalogoService, CatalogoService>();
builder.Services.AddScoped<IParametrosService, ParametrosService>();
builder.Services.AddScoped<IRolService, RolService>();
builder.Services.AddScoped<IPerfilService, PerfilService>();
builder.Services.AddScoped<IEspecialidadService, EspecialidadService>();
builder.Services.AddScoped<INotificacionService, NotificacionService>();
builder.Services.AddScoped<IUsuarioService, UsuarioService>();
builder.Services.AddScoped<IPacienteService, PacienteService>();
builder.Services.AddScoped<IMedicoService, MedicoService>();
builder.Services.AddScoped<IAsignacionService, AsignacionService>();
builder.Services.AddScoped<IFidelizacionService, FidelizacionService>();
builder.Services.AddScoped<IHistoricoService, HistoricoService>();
builder.Services.AddScoped<ICitaService, CitaService>();
builder.Services.AddScoped<IEncuestaService, EncuestaService>();
builder.Services.AddScoped<IPreguntaService, PreguntaService>();
builder.Services.AddScoped<IRespuestasEncuestaService, RespuestasEncuestaService>();
builder.Services.AddScoped<IDashBoardService, DashBoardService>();
builder.Services.AddScoped<IDashBoardRepository, DashBoardRepository>();
builder.Services.AddScoped<IDatosCacheService, DatosCacheService>();
builder.Services.AddScoped<IDatosCacheRepository, DatosCacheRepository>();
builder.Services.AddScoped<IMemoryCache, MemoryCache>();
builder.Services.AddScoped<IHorariosService, HorariosService>();
builder.Services.AddScoped<IHorariosRepository, HorariosRepository>();

//ADD Cors
var MyCors = "AllowAll";
builder.Services.AddCors(options =>
{
    options.AddPolicy(MyCors,
        policy =>
        {
            policy.AllowAnyOrigin()
                  .AllowAnyMethod()
                  .AllowAnyHeader()
                  .WithOrigins("http://localhost:4200");
        });
});


var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseCors(MyCors);
app.UseHttpsRedirection();
app.UseAuthorization();
app.UseMiddleware<ResponseCatcherMiddleware>();
app.MapControllers();

app.Run();
