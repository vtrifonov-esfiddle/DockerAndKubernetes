using System.Collections.Generic;
using System.Threading.Tasks;

namespace MongoDbWebApi.WebApi.WeatherForecastRepository
{
    public interface IWeatherForecastsRepository
    {
        Task<List<WeatherForecast>> GetForecasts();
        Task<WeatherForecast> InsertForecast(WeatherForecast forecast);
    }
}