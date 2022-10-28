using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Xml;

namespace SecuredWebApi.Models
{

    //public interface IDbContext : IDisposable
    //{
    //    DbContext Instance { get; }
    //}

    //public interface IApplicationDbContext : IDbContext
    //{
    //     DbSet<RegisterUser> RegisterUser { get; set; }
    //     DbSet<ServicesTB> ServicesTB { get; set; }
    //     DbSet<HitsTB> HitsTB { get; set; }
    //     DbSet<APIManagerTB> APIManagerTB { get; set; }
    //     DbSet<MoviesTB> MoviesTB { get; set; }
    //     DbSet<MusicTB> MusicTB { get; set; }
    //     DbSet<LoggerTB> LoggerTB { get; set; }
    //}

    public class DatabaseContext : DbContext  //, IApplicationDbContext
    {
        public DatabaseContext(DbContextOptions<DatabaseContext> options) : base(options)
        {

        }
        //public DbContext Instance => this;
        public DbSet<RegisterUser> RegisterUser { get; set; }
        public DbSet<ServicesTB> ServicesTB { get; set; }
        public DbSet<HitsTB> HitsTB { get; set; }
        public DbSet<APIManagerTB> APIManagerTB { get; set; }
        public DbSet<MoviesTB> MoviesTB { get; set; }
        public DbSet<MusicTB> MusicTB { get; set; }
        public DbSet<LoggerTB> LoggerTB { get; set; }

        
    }
}
