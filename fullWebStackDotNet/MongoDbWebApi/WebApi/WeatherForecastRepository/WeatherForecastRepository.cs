using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using MongoDB.Driver;

namespace MongoDbWebApi.WebApi.WeatherForecastRepository
{
    public class WeatherForecastsRepository : IWeatherForecastsRepository
    {
        private readonly IMongoDatabase _weatherForecastDb;
        private const string CollectionName = "weatherForecast";
        public WeatherForecastsRepository()
        {            
            string connectionString = Environment.GetEnvironmentVariable("MONGO_DB_WEB_API_CONNECTION_STRING");
            var mongoClient = new MongoDbClient(connectionString, "weatherForecast");            
            _weatherForecastDb = mongoClient.Database;
        }

        private IMongoCollection<WeatherForecast> WeatherForecastsCollection
        {
            get 
            {
                return _weatherForecastDb.GetCollection<WeatherForecast>("weatherForecasts");
            }
        }

        public async Task<List<WeatherForecast>> GetForecasts()
        {
            return await WeatherForecastsCollection.Find(weatherForecast => true).ToListAsync();
        }

        public async Task<WeatherForecast> InsertForecast(WeatherForecast forecast)
        {
            await WeatherForecastsCollection.InsertOneAsync(forecast);
            return forecast;
        }
    }
}