using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using SecuredWebApi.Models;
using Dapper;
using System.Data.SqlClient;
using Microsoft.Extensions.Options;

namespace SecuredWebApi.Repository
{
    public class HitsConcrete : IHits
    {
        private DatabaseContext _context;
        private ConnectionStrings _connectionstrings;

        public HitsConcrete(DatabaseContext context, IOptions<ConnectionStrings> connectionstrings)
        {
            _context = context;
            _connectionstrings = connectionstrings.Value;
        }

        public List<HitsTB> GetHitsList()
        {
            try
            {
                var hitsList = (from services in _context.HitsTB select services).ToList();
                hitsList.Insert(0, new HitsTB { HitsDisplay = "---Choose Max Request---", HitsID = -1 });
                return hitsList;
            }
            catch (Exception)
            {

                throw;
            }
        }

        public List<string> GetChartsMoviesreport()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Convert.ToString(_connectionstrings.DatabaseConnection)))
                {
                    var parameter = new DynamicParameters();
                    return con.Query<string>("Usp_GetChartsMoviesreport", null, null, false,0, System.Data.CommandType.StoredProcedure).ToList();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        public List<string> GetChartsMusicreport()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Convert.ToString(_connectionstrings.DatabaseConnection)))
                {
                    var parameter = new DynamicParameters();
                    return con.Query<string>("Usp_GetChartsMusicreport", null, null, false, 0, System.Data.CommandType.StoredProcedure).ToList();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

    }
}
