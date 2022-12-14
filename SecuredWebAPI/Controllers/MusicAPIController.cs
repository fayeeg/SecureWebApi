using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using SecuredWebApi.Repository;
using SecuredWebApi.Models;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace SecuredWebApi.Controllers
{
    [Route("api/[controller]")]
    public class MusicAPIController : Controller
    {

        IMusic _IMusic;
        public MusicAPIController(IMusic IMusic)
        {
            _IMusic = IMusic;
        }

        // GET: api/values
        [HttpGet]
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET api/values/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "value";
        }

        // POST api/values
        [HttpPost]
        public List<MusicTB> Post([FromQuery]string key)
        {
            try
            {
                return _IMusic.GetMusicStore();
            }
            catch (Exception)
            {
                throw;
            }
        }

        // PUT api/values/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/values/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
