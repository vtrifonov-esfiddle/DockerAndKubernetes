using MongoDB.Driver;

namespace MongoDbWebApi.WebApi.WeatherForecastRepository
{
    public class MongoDbClient
    {
        protected readonly IMongoDatabase _database;

        public MongoDbClient(string connectionString, string dbName)
        {
            var mongoUrl = new MongoUrl(connectionString);
            var mongoClient = new MongoClient(mongoUrl);
            _database = mongoClient.GetDatabase(dbName);
        }

        public IMongoDatabase Database
        {
            get
            {
                return _database;
            }
        }
    }
}