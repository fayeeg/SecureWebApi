using SecuredWebApi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SecuredWebApi.Repository
{
    public interface IRequestLogger
    {
        void InsertLoggingData(LoggerTB loggerTB);
    }
}
