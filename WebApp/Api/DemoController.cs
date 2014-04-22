using Service.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace WebApp.Api
{
    public class DemoController : ApiController
    {
        private IRepository demoRepo;

        public DemoController()
        {
            demoRepo = new Repository("Tasks");
        }

        // GET api/<controller>
        public IEnumerable<dynamic> Get()
        {
            return demoRepo.All();
        }

        [HttpGet]
        public IEnumerable<dynamic> AllTasks()
        {
            return demoRepo.ReadRecords("readtasks", 0);
        }

        // GET api/<controller>/5
        public dynamic Get(int id)
        {
            return demoRepo.Single(id);
        }

        // POST api/<controller>
        public void Post([FromBody]string value)
        {
        }

        // PUT api/<controller>/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/<controller>/5
        public void Delete(int id)
        {
        }
    }
}