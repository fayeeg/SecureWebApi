using Dapper;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;
using SecuredWebApi.Models;
using System;
using System.Data.SqlClient;
using System.Linq;

namespace SecuredWebApi.Repository
{
    public class APIManagerConcrete : IAPIManager
    {
        private DatabaseContext _context;
        private ConnectionStrings _connectionstrings;
        public APIManagerConcrete(DatabaseContext context, IOptions<ConnectionStrings> connectionstrings)
        {
            _context = context;
            _connectionstrings = connectionstrings.Value;
        }

        public int isApikeyAlreadyGenerated(int? ServiceID, int? UserID)
        {
            try
            {
                var keyCount = (from apimanager in _context.APIManagerTB
                                where apimanager.ServiceID == ServiceID &&
                                      apimanager.UserID == UserID
                                select apimanager).Count();

                return keyCount;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public int GenerateandSaveToken(APIManagerTB APIManagerTB)
        {
            try
            {
                _context.APIManagerTB.Add(APIManagerTB);
                return _context.SaveChanges();
            }
            catch (Exception)
            {
                throw;
            }
        }

        public APIManagerVM GetApiDetailsbyServiceIDandUserID(int? ServiceID, int? UserID)
        {
            try
            {

                using (SqlConnection con = new SqlConnection(Convert.ToString(_connectionstrings.DatabaseConnection)))
                {
                    var parameter = new DynamicParameters();
                    parameter.Add("@ServiceID", ServiceID);
                    parameter.Add("@UserID", UserID);
                    var apimanagervm = con.Query<APIManagerVM>("Usp_GetApiDetailsbyServiceIDandUserID", parameter, null, false, 0, System.Data.CommandType.StoredProcedure).SingleOrDefault();

                    if(apimanagervm ==null)
                    {
                        return new APIManagerVM();
                    }
                    else
                    {
                        return apimanagervm;
                    }
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        public int DeactivateService(int? ServiceID, int? UserID)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Convert.ToString(_connectionstrings.DatabaseConnection)))
                {
                    var parameter = new DynamicParameters();
                    parameter.Add("@ServiceID", ServiceID);
                    parameter.Add("@UserID", UserID);
                    return con.Execute("Usp_DeactivateService_update", parameter, null, 0, System.Data.CommandType.StoredProcedure);
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        public int ReactivateService(int? ServiceID, int? UserID)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Convert.ToString(_connectionstrings.DatabaseConnection)))
                {
                    var parameter = new DynamicParameters();
                    parameter.Add("@ServiceID", ServiceID);
                    parameter.Add("@UserID", UserID);
                    return con.Execute("Usp_ReactivateService_update", parameter, null, 0, System.Data.CommandType.StoredProcedure);
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

       
    }
}
