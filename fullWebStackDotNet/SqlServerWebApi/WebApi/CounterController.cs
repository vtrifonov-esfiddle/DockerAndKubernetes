using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

namespace SqlServerWebApi.WebApi
{
    [Route("")]
    [Route("[controller]")]
    [ApiController]
    public class CounterController : ControllerBase
    {
        private readonly ICounterRepository _counterRepository;
        public CounterController(ICounterRepository counterController)
        {
            _counterRepository = counterController;
        }
        [HttpGet]
        public ActionResult<int> Get()
        {
            return _counterRepository.GetCounter();
        }

        [HttpPost("{count}")]
        public void Post(int count)
        {
            _counterRepository.UpdateCounter(count);            
        }
    }
}
