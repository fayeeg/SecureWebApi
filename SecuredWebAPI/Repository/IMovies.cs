using SecuredWebApi.Models;
using System.Collections.Generic;

namespace SecuredWebApi.Repository
{
    public interface IMovies
    {
        List<MoviesTB> GetMoviesStore();
    }
}
