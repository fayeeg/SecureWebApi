using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using SecuredWebApi.Repository;
using SecuredWebApi.Filters;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Options;
using SecuredWebApi.Models;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace SecuredWebApi.Controllers
{
    [ValidateUserSession]
    public class ServicesStoreController : Controller
    {
        IServicesStore _IServicesStore;
        IAPIManager _iAPIManager;

        public ServicesStoreController(IServicesStore IServicesStore, IAPIManager iAPIManager)
        {
            _IServicesStore = IServicesStore;
            _iAPIManager = iAPIManager;
        }

        // GET: /<controller>/
        public IActionResult Service()
        {
            return View(_IServicesStore.GetServiceListforDashboard());
        }

        public IActionResult Details(string ServiceID, string ServiceName)
        {
            try
            {
                var userID = Convert.ToInt32(HttpContext.Session.GetString("UserID"));
                var apiDetails = _iAPIManager.GetApiDetailsbyServiceIDandUserID(Convert.ToInt32(ServiceID), userID);
                return View(apiDetails);
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
