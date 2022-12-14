using SecuredWebApi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SecuredWebApi.Repository
{
    public class RequestLoggerConcrete : IRequestLogger
    {
        private DatabaseContext _context;

        public RequestLoggerConcrete(DatabaseContext context)
        {
            _context = context;
        }

        public void InsertLoggingData(LoggerTB loggerTB)
        {
            try
            {
                loggerTB.LoggerID = 0;
                _context.LoggerTB.Add(loggerTB);
                _context.SaveChanges();
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
