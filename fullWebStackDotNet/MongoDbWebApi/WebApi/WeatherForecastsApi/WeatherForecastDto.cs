using MongoDbWebApi.WebApi.WeatherForecastRepository;

namespace MongoDbWebApi.WebApi.WeatherForecastsApi
{
    public class WeatherForecastDto : WeatherForecast
    {
        public WeatherForecastDto(WeatherForecast forecast)
        {
            Id = forecast.Id;
            Date = forecast.Date;
            Summary = forecast.Summary;
            TemperatureC = forecast.TemperatureC;   
        }

        public string DateFormatted
        {
            get
            {
                return Date.ToLongDateString();
            }
        }
        public int TemperatureF
        {
            get
            {
                return 32 + (int)(TemperatureC / 0.5556);
            }
        }
    }
}