using System.Security;
using System.Data.Common;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using Dapper;
using System;

namespace SqlServerWebApi.WebApi
{
    public class CounterRepository : ICounterRepository
    {
        private readonly string _connectionString;
        public CounterRepository()
        {
            _connectionString = Environment.GetEnvironmentVariable("SQL_CONNECTION_STRING");
        }

        public int GetCounter()
        {
            using (IDbConnection dbConnection = new SqlConnection(_connectionString))
            {
                string query = "SELECT TOP 1 [Count] FROM dbo.Counts";
                dbConnection.Open();
                return dbConnection.Query<int>(query).FirstOrDefault();
            }
        }

        public void UpdateCounter(int counter)
        {
            using (IDbConnection dbConnection = new SqlConnection(_connectionString))
            {
                string query = "UPDATE dbo.Counts SET [Count] = @Counter";
                dbConnection.Open();
                dbConnection.Execute(query, new { Counter = counter });
            }
        }
    }
}