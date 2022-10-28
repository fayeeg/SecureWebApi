using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SecuredWebApi.Models
{
    public class APIManagerVM
    {
        public int? RowNo { get; set; }
        public int? TokenID { get; set; }
        public string APIKey { get; set; }
        public string ServiceName { get; set; }
        public string CreatedOn { get; set; }
        public string Hits { get; set; }
        public int? ServiceID { get; set; }
        public string Status { get; set; }
        
    }
}
