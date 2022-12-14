using Microsoft.AspNetCore.Mvc;
using SecuredWebApi.Models;
using SecuredWebApi.Repository;
using System.Collections.Generic;

namespace SecuredWebApi.Controllers
{
    [Route("api/[controller]")]
    public class MoviesAPIController : Controller
    {
        IMovies _IMovies;
        public MoviesAPIController(IMovies IMovies)
        {
            _IMovies = IMovies;
        }

        // POST api/values
        [HttpPost]
        public List<MoviesTB> Post([FromQuery]string key)
        {
            return _IMovies.GetMoviesStore();
        }
    }
}
