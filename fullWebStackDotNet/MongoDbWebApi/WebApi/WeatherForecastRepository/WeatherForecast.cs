using System;
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;
using MongoDB.Bson.Serialization.IdGenerators;

namespace MongoDbWebApi.WebApi.WeatherForecastRepository
{
    public class WeatherForecast
    {
        [BsonId(IdGenerator = typeof(StringObjectIdGenerator))]
        [BsonRepresentation(BsonType.ObjectId)]
        public string Id { get; set;}
        public DateTime Date { get; set; }

        public int TemperatureC { get; set; }
        public string Summary { get; set; }       
        
    }
}