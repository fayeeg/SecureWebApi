using SecuredWebApi.Filters;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SecuredWebApi.Models
{
    public class GenerateKeysVM
    {
        [Required(ErrorMessage ="Choose Service")]
        [ServiceValidate]
        public int? ServiceID { get; set; }
        [HitValidate]
        [Required(ErrorMessage = "Choose Max Request")]
        public int? HitsID { get; set; }

        public List<HitsTB> ListHits { get; set; }
        public List<ServicesTB> ListServices { get; set; }

        public string APIKey { get; set; }
    }
}
