﻿using Service.Common;
using Service.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;

namespace WebApp.Api
{
    public class DemoController : ApiController
    {
        private ITasksRepository demoRepo;

        public DemoController()
        {
            demoRepo = new TasksRepository();
        }

        // GET api/<controller>
        public IEnumerable<dynamic> Get()
        {
            return demoRepo.All();
        }

        [HttpGet]
        public async Task<IEnumerable<dynamic>> AllTasks()
        {
            return await demoRepo.ReadRecordsAsync("readtasks", 0);
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