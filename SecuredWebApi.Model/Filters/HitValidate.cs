using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SecuredWebApi.Filters
{
    public class HitValidate : ValidationAttribute
    {
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            try
            {
                string Message = string.Empty;
                if (string.Equals("-1", Convert.ToString(value)))
                {
                    Message = "Choose Max Request";
                    return new ValidationResult(Message);
                }
                return ValidationResult.Success;
            }
            catch (Exception)
            {
                throw;
            }
        }
    }

}
