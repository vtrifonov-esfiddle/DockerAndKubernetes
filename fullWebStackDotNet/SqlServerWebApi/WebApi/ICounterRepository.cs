namespace SqlServerWebApi.WebApi
{
    public interface ICounterRepository
    {
        int GetCounter();
        void UpdateCounter(int counter);
    }
}