using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using MongoDB.Driver;
using MongoDB.Bson;
using MongoDB.Bson.Serialization;
using MongoDB.Bson.IO;
using MongoDbWebApi.WebApi.WeatherForecastRepository;

namespace MongoDbWebApi.WebApi.WeatherForecastsApi
{
    [Route("")]
    [Route("[controller]")]
    public class WeatherForecastsController : Controller
    {
        private readonly IWeatherForecastsRepository _weatherForecastRepository;
        public WeatherForecastsController(IWeatherForecastsRepository weatherForecastRepository)
        {
            _weatherForecastRepository = weatherForecastRepository;
        }



        [HttpGet]
        [Route("")]
        public async Task<IEnumerable<WeatherForecastDto>> Get()
        {   
            var forecasts = await _weatherForecastRepository.GetForecasts();
            var result = forecasts.Select(f => new WeatherForecastDto(f));
            return result;
        }        

        [HttpPost]
        [Route("")]
        public async Task<WeatherForecastDto> Post()
        {            
            var newForecast = new GeneratedForecast();         
            WeatherForecast insertedForcast = await _weatherForecastRepository.InsertForecast(newForecast.Forecast);
            return new WeatherForecastDto(insertedForcast);
        }

        private class GeneratedForecast
        {
            private static string[] Summaries = new[]
            {
                "Freezing", "Bracing", "Chilly", "Cool", "Mild", "Warm", "Balmy", "Hot", "Sweltering", "Scorching"
            };

            public WeatherForecast Forecast { get; private set; }
            public GeneratedForecast()
            {
                var random = new Random(DateTime.Now.Second.GetHashCode());
                Forecast = new WeatherForecast()
                {
                    Summary = Summaries[random.Next(Summaries.Length)],
                    TemperatureC = random.Next(-20, 55),
                    Date = DateTime.Now.AddDays(random.Next(8))
                };
            }
        }
    }
}
