using SecuredWebApi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SecuredWebApi.Repository
{
    public interface IRegisterUser
    {
        void Add(RegisterUser registeruser);
        bool ValidateRegisteredUser(RegisterUser registeruser);
        bool ValidateUsername(RegisterUser registeruser);
        long GetLoggedUserID(RegisterUser registeruser);
    }
}
