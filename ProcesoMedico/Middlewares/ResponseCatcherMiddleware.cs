using Microsoft.Extensions.Caching.Memory;
using ProcesoMedico.Aplicacion.Interfaces;
using ProcesoMedico.Dominio.Entities;
using System.Collections.Generic;

namespace ProcesoMedico.Api.Middlewares
{
    public class ResponseCatcherMiddleware
    {
        private readonly RequestDelegate _next;
        private readonly IDatosCacheService cache;

        public ResponseCatcherMiddleware(RequestDelegate next)
        {
            _next = next;
        }

        public async Task Invoke(HttpContext httpContext, IDatosCacheService cache, IMemoryCache _memoryCache)
        {
            var sessionParamRequest = _memoryCache.Get<List<DatosCahe.CacheParametros>>("Parametros");
            List<DatosCahe.CacheParametros> responseParam = new List<DatosCahe.CacheParametros>();

            if (sessionParamRequest is null || sessionParamRequest.Any())
            {
                TimeSpan intervalo = AsignarTiempo();
                responseParam = cache.GetParametros().GetAwaiter().GetResult().ToList();

                if(responseParam?.Any() == true)
                {
                    var cacheEntryOptions = new MemoryCacheEntryOptions().SetAbsoluteExpiration(intervalo);
                    _memoryCache.Set("Parametros", responseParam, cacheEntryOptions);
                }
            }

            await _next(httpContext);
        }

        private TimeSpan AsignarTiempo()
        {
            TimeSpan intervalo = new TimeSpan();

            //Fecha de inicio
            DateTime fecActual = DateTime.Now;
            Console.WriteLine("FecActual: " + fecActual);

            //Fecha de final
            DateTime fecActualizar = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, 6, 0, 0);
            Console.WriteLine("fecActualizar: " + fecActualizar);

            if(fecActual >= fecActualizar)
            {
                fecActualizar.AddDays(1);
                //calcular el intervalo de tiempo entre las 2 fechas
                intervalo = fecActual.Subtract(fecActualizar);
            }
            else if (fecActualizar > fecActual)
            {
                //calcular el intervalo de tiempo entre las 2 fechas
                intervalo = fecActualizar.Subtract(fecActual);
            }

            return intervalo;
        }
    }
}
