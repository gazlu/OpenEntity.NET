using Service.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace WebApp.Api
{
    public class TrashController : ApiController
    {
        private ITrashRepository trashRepo;

        public TrashController()
        {
            trashRepo = new TrashRepository();
        }

        // GET api/<controller>
        public IEnumerable<dynamic> Get()
        {
            return trashRepo.All();
        }

        // GET api/<controller>/5
        public dynamic Get(int id)
        {
            return trashRepo.Single(id);
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