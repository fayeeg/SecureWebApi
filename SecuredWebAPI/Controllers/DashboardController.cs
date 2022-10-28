using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using SecuredWebApi.Filters;
using SecuredWebApi.Repository;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace SecuredWebApi.Controllers
{

    
    [ValidateUserSession]
    public class DashboardController : Controller
    {
        IHits _IHits;
        public DashboardController(IHits IHits)
        {
            _IHits = IHits;
        }

        // GET: /<controller>/
        public IActionResult Dashboard()
        {
            try
            {
                var movieCountList = string.Join(",", _IHits.GetChartsMoviesreport());
                var musicCountList = string.Join(",", _IHits.GetChartsMusicreport());
                ViewBag.MovieCountList = movieCountList;
                ViewBag.MusicCountList = musicCountList;
                return View();
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
