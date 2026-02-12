using Microsoft.AspNet.Identity;
using Microsoft.Extensions.Caching.Memory;
using Microsoft.Extensions.Configuration;
using ProcesoMedico.Api.Middlewares;
using ProcesoMedico.Aplicacion.Interfaces;
using ProcesoMedico.Aplicacion.Interfaces.Seguridad;
using ProcesoMedico.Aplicacion.Services;
using ProcesoMedico.Aplicacion.Services.Seguridad;
using ProcesoMedico.Aplicacion.Services.Seguridad.Settings;
using ProcesoMedico.Aplicacion.Utils;
using ProcesoMedico.Dominio.Entities;
using ProcesoMedico.Infraestructura.Interfaces;
using ProcesoMedico.Infraestructura.Persistence;
using ProcesoMedico.Infraestructura.Repositories;
using ProcesoMedico.Infraestructura.Seguridad;
using Swashbuckle.AspNetCore.Filters;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddControllers();

builder.Services.Configure<AuthenticationSettings>(
    builder.Configuration.GetSection("AuthenticationSettings"));

builder.Services.Configure<SecuritySettings>(
    builder.Configuration.GetSection("SecuritySettings"));

builder.Services.Configure<AppSettingModel.Main>(
    builder.Configuration.GetSection("Settings"));

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

builder.Services.AddSingleton<IAppSettings, AppSettings>();

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
builder.Services.AddScoped<IHorariosService, HorariosService>();
builder.Services.AddScoped<IUnitOfWorkRepository, UnitOfWorkRepository>();
builder.Services.AddScoped<IAuthTokenService, AuthTokenService>();
builder.Services.AddScoped<ISettingManager, SettingManager>();
builder.Services.AddScoped<IAutRepository, AutRepository>();
builder.Services.AddScoped<IPasswordHasher, PasswordHasher>();
builder.Services.AddScoped<IHistorialService, HistorialService>();
builder.Services.AddScoped<IMenuService, MenuService>();
builder.Services.AddScoped<ISubMenuService, SubMenuService>();
builder.Services.AddScoped<IFrontRepository, FrontRepository>();
builder.Services.AddScoped<IMailService, MailService>();
builder.Services.AddScoped<IHorarioService, HorarioService>();


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
//if (app.Environment.IsDevelopment())
//{
    app.UseSwagger();
    app.UseSwaggerUI();
//}

app.UseCors(MyCors);
app.UseHttpsRedirection();
app.UseAuthorization();
app.UseMiddleware<ResponseCatcherMiddleware>();
app.MapControllers();

app.Run();
