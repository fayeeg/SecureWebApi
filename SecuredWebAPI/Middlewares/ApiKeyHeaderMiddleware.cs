﻿using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Primitives;
using SecuredWebApi.Models;
using SecuredWebApi.Repository;
using System;
using System.Threading.Tasks;

namespace SecuredWebApi.Middlewares
{
    // You may need to install the Microsoft.AspNetCore.Http.Abstractions package into your project
    public class ApiKeyHeaderMiddleware
    {

        private const string APIKEYNAME = "ApiKey";
        private readonly RequestDelegate _next;
        //IValidateRequest _IValidateRequest { get; set; }
        IRequestLogger? _IRequestLogger { get; set; }
        public ApiKeyHeaderMiddleware(RequestDelegate next)
        {
            _next = next;
            //_IValidateRequest = ivalidaterequest;
            //_IRequestLogger = irequestlogger;
        }

        public async Task Invoke(HttpContext httpContext, IValidateRequest _IValidateRequest, IRequestLogger _IRequestLogger)
        {
            try
            {
                var remoteIpAddress = httpContext.Connection.RemoteIpAddress;

              

                

                if (httpContext.Request.Path.StartsWithSegments("/api"))
                {
                    var queryString = httpContext.Request.Query;
                    //StringValues keyvalue;
                    //queryString.TryGetValue("key", out keyvalue);
                   

                    if (httpContext.Request.Method != "POST")
                    {
                        httpContext.Response.StatusCode = 405; //Method Not Allowed               
                        await httpContext.Response.WriteAsync("Method Not Allowed");
                        return;
                    }

                    if (!httpContext.Request.Headers.TryGetValue(APIKEYNAME, out var extractedApiKey))
                    {
                        httpContext.Response.StatusCode = 401;
                        await httpContext.Response.WriteAsync("Api Key was not provided");
                        return;
                    }
                    else
                    {
                        string[] serviceName = httpContext.Request.Path.Value!.Split('/');

                        if (!_IValidateRequest.IsValidServiceRequest(extractedApiKey, serviceName[2]))
                        {
                            httpContext.Response.StatusCode = 401; //UnAuthorized
                            await httpContext.Response.WriteAsync("Invalid User Key or Request");
                            return;
                        }
                        else if (!_IValidateRequest.ValidateKeys(extractedApiKey))
                        {
                            httpContext.Response.StatusCode = 401; //UnAuthorized
                            await httpContext.Response.WriteAsync("Invalid User Key");
                            return;
                        }
                        else if (!_IValidateRequest.ValidateIsServiceActive(extractedApiKey))
                        {
                            httpContext.Response.StatusCode = 406; //NotAcceptable
                            await httpContext.Response.WriteAsync("Service is Deactived");
                            return;
                        }
                        else if (!_IValidateRequest.CalculateCountofRequest(extractedApiKey))
                        {
                            httpContext.Response.StatusCode = 406; //NotAcceptable
                            await httpContext.Response.WriteAsync("Request Limit Exceeded");
                            return;
                        }
                        else
                        {
                            string[] apiName = httpContext.Request.Path.Value.Split('/');

                            var loggertb = new LoggerTB()
                            {
                                LoggerID = 0,
                                ContentType = Convert.ToString(httpContext.Request.ContentType)!,
                                APIKey = extractedApiKey,
                                CreatedDate = DateTime.Now,
                                Host = httpContext.Request.Host.Value,
                                IsHttps = httpContext.Request.IsHttps ? "Yes" : "No",
                                Path = httpContext.Request.Path,
                                Method = httpContext.Request.Method,
                                Protocol = httpContext.Request.Protocol,
                                QueryString = httpContext.Request.QueryString.Value!,
                                Scheme = httpContext.Request.Scheme,
                                RemoteIpAddress = Convert.ToString(httpContext.Connection.RemoteIpAddress)!,
                                LoggerAPI = apiName[2],

                            };

                            _IRequestLogger.InsertLoggingData(loggertb);

                        }
                    }


                }
                await _next.Invoke(httpContext);
            }
            catch (Exception)
            {
                throw;
            }
        }
    }

    // Extension method used to add the middleware to the HTTP request pipeline.
    public static class APIMiddlewareExtensions
    {
        public static IApplicationBuilder UseMiddleware(this IApplicationBuilder builder)
        {
            return builder.UseMiddleware<ApiKeyHeaderMiddleware>();
        }
    }
}


//using Microsoft.AspNetCore.Builder;
//using Microsoft.AspNetCore.Http;
//using Microsoft.Extensions.Primitives;
//using SecuredWebApi.Models;
//using SecuredWebApi.Repository;
//using System;
//using System.Threading.Tasks;

//namespace SecuredWebApi.Middlewares
//{
//    // You may need to install the Microsoft.AspNetCore.Http.Abstractions package into your project
//    public class ApiKeyHeaderMiddleware
//    {
//        private readonly RequestDelegate _next;
//        IValidateRequest _IValidateRequest { get; set; }
//        IRequestLogger _IRequestLogger { get; set; }
//        public ApiKeyHeaderMiddleware(RequestDelegate next, IValidateRequest ivalidaterequest, IRequestLogger irequestlogger)
//        {
//            _next = next;
//            _IValidateRequest = ivalidaterequest;
//            _IRequestLogger = irequestlogger;
//        }

//        public async Task Invoke(HttpContext httpContext)
//        {
//            try
//            {
//                var remoteIpAddress = httpContext.Connection.RemoteIpAddress;

//                if (httpContext.Request.Path.StartsWithSegments("/api"))
//                {
//                    var queryString = httpContext.Request.Query;
//                    StringValues keyvalue;
//                    queryString.TryGetValue("key", out keyvalue);

//                    if (httpContext.Request.Method != "POST")
//                    {
//                        httpContext.Response.StatusCode = 405; //Method Not Allowed               
//                        await httpContext.Response.WriteAsync("Method Not Allowed");
//                        return;
//                    }

//                    if (keyvalue.Count == 0)
//                    {
//                        httpContext.Response.StatusCode = 400; //Bad Request                
//                        await httpContext.Response.WriteAsync("API Key is missing");
//                        return;
//                    }
//                    else
//                    {
//                        string[] serviceName = httpContext.Request.Path.Value!.Split('/');

//                        if(!_IValidateRequest.IsValidServiceRequest(keyvalue, serviceName[2]))
//                        {
//                            httpContext.Response.StatusCode = 401; //UnAuthorized
//                            await httpContext.Response.WriteAsync("Invalid User Key or Request");
//                            return;
//                        }
//                        else if (!_IValidateRequest.ValidateKeys(keyvalue))
//                        {
//                            httpContext.Response.StatusCode = 401; //UnAuthorized
//                            await httpContext.Response.WriteAsync("Invalid User Key");
//                            return;
//                        }
//                        else if (!_IValidateRequest.ValidateIsServiceActive(keyvalue))
//                        {
//                            httpContext.Response.StatusCode = 406; //NotAcceptable
//                            await httpContext.Response.WriteAsync("Service is Deactived");
//                            return;
//                        }
//                        else if (!_IValidateRequest.CalculateCountofRequest(keyvalue))
//                        {
//                            httpContext.Response.StatusCode = 406; //NotAcceptable
//                            await httpContext.Response.WriteAsync("Request Limit Exceeded");
//                            return;
//                        }
//                        else
//                        {
//                            string[] apiName = httpContext.Request.Path.Value.Split('/');

//                            var loggertb = new LoggerTB()
//                            {
//                                LoggerID = 0,
//                                ContentType = Convert.ToString(httpContext.Request.ContentType)!,
//                                APIKey = keyvalue,
//                                CreatedDate = DateTime.Now,
//                                Host = httpContext.Request.Host.Value,
//                                IsHttps = httpContext.Request.IsHttps ? "Yes" : "No",
//                                Path = httpContext.Request.Path,
//                                Method = httpContext.Request.Method,
//                                Protocol = httpContext.Request.Protocol,
//                                QueryString = httpContext.Request.QueryString.Value!,
//                                Scheme = httpContext.Request.Scheme,
//                                RemoteIpAddress = Convert.ToString(httpContext.Connection.RemoteIpAddress)!,
//                                LoggerAPI = apiName[2],

//                            };

//                            _IRequestLogger.InsertLoggingData(loggertb);

//                        }
//                    }


//                }
//                await _next.Invoke(httpContext);
//            }
//            catch (Exception)
//            {
//                throw;
//            }
//        }
//    }

//    // Extension method used to add the middleware to the HTTP request pipeline.
//    public static class MiddlewareExtensions
//    {
//        public static IApplicationBuilder UseMiddleware(this IApplicationBuilder builder)
//        {
//            return builder.UseMiddleware<ApiKeyHeaderMiddleware>();
//        }
//    }
//}
