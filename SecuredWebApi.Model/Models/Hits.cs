using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace SecuredWebApi.Models
{
    [Table("HitsTB")]
    public class HitsTB
    {
        [Key]
        public long HitsID { get; set; }
        public long Hits { get; set; }
        public string? HitsDisplay { get; set; }
        
    }
}
