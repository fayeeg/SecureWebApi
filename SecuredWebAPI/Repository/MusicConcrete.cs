using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using SecuredWebApi.Models;

namespace SecuredWebApi.Repository
{
    public class MusicConcrete : IMusic
    {
        private DatabaseContext _context;
        public MusicConcrete(DatabaseContext context)
        {
            _context = context;
        }

        // GET: api/LatestMusic
        public List<MusicTB> GetMusicStore()
        {
            try
            {
                var listofMusic = _context.MusicTB.ToList();
                return listofMusic;
            }
            catch (System.Exception)
            {
                throw;
            }
        }
    }
}
