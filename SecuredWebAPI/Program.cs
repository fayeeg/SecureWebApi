using Microsoft.EntityFrameworkCore;
using SecuredWebApi.Models;
using SecuredWebApi.Repository;
using Swashbuckle.AspNetCore.Swagger;
using Microsoft.OpenApi.Models;
using SecuredWebApi.Middlewares;
using SecuredWebApi.Filters;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddTransient<IValidateRequest, ValidateRequestConcrete>();
builder.Services.AddTransient<IRegisterUser, RegisterUserConcrete>();
builder.Services.AddTransient<IServicesStore, ServicesStoreConcrete>();
builder.Services.AddTransient<IHits, HitsConcrete>();
builder.Services.AddTransient<IAPIManager, APIManagerConcrete>();
builder.Services.AddTransient<IMovies, MoviesConcrete>();
builder.Services.AddTransient<IMusic, MusicConcrete>();
builder.Services.AddTransient<IRequestLogger, RequestLoggerConcrete>();

builder.Services.AddSession();
//builder.Services.AddDistributedMemoryCache();
// Add services to the container.
//builder.Services.AddMvc();

//builder.Services.AddMvc(options => options.EnableEndpointRouting = false)
//        .AddSessionStateTempDataProvider();
builder.Services.AddControllersWithViews();
builder.Services.AddRazorPages();



ConfigurationManager configuration = builder.Configuration; // allows both to access and to set up the config
IWebHostEnvironment env = builder.Environment;


var connection = configuration.GetConnectionString("DatabaseConnection");

builder.Services.Configure<ConnectionStrings>(configuration.GetSection("ConnectionStrings"));


builder.Services.AddDbContext<DatabaseContext>(options => 
options.UseSqlServer(connection, b => b.MigrationsAssembly("SecuredWebAPI")));//, b => b.UseRowNumberForPaging()););
builder.Services.AddScoped<DatabaseContext>();
//builder.Services.AddScoped<IApplicationDbContext, DatabaseContext>();
//builder.Services.AddScoped<IApplicationDBContext>(provider => provider.GetService<ApplicationDBContext>());

//builder.Services.AddSwaggerGen(c =>
//{
//    c.SwaggerDoc("v1", new Info { Title = "My API", Version = "v1" });
//});

builder.Services.AddSwaggerGen(options =>
{
    options.SwaggerDoc("v1", new OpenApiInfo
    {
        Version = "v1",
        Title = "ToDo API",
        Description = "An ASP.NET Core Web API for managing ToDo items",
        TermsOfService = new Uri("https://example.com/terms"),
        Contact = new OpenApiContact
        {
            Name = "Example Contact",
            Url = new Uri("https://example.com/contact")
        },
        License = new OpenApiLicense
        {
            Name = "Example License",
            Url = new Uri("https://example.com/license")
        }
    });
});


// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();


var app = builder.Build();


if (env.IsDevelopment())
{
    app.UseDeveloperExceptionPage();
    //app.UseBrowserLink();
}
else
{
    app.UseExceptionHandler("/Home/Error");
}
app.UseStaticFiles();
app.UseSession();
//app.UseMvcWithDefaultRoute();
app.UseRouting();
//app.UseMiddleware<ApiKeyValidatorsMiddleware>();
app.UseMiddleware<ApiKeyHeaderMiddleware>();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
    //app.UseSwaggerUI(options =>
    //{
    //    options.SwaggerEndpoint("/swagger/v1/swagger.json", "v1");
    //    options.RoutePrefix = string.Empty;
    //});
}

//app.UseMvc(routes =>
//{
//    routes.MapRoute(
//        name: "Servicedefault",
//        template: "{controller=Login}/{action=Login}/{ServiceID}/{ServiceName}");

//    routes.MapRoute(
//        name: "default",
//        template: "{controller=Login}/{action=Login}/{id?}");

//});




app.UseHttpsRedirection();

app.UseAuthorization();
//app.UseMvc();

//app.UseEndpoints(endpoints =>
//{

//    //endpoints.MapControllers();
//    endpoints.MapRazorPages();

//});

//app.MapControllerRoute(
//    name: "Servicedefault",
//    pattern: "{controller=Login}/{action=Login}/{ServiceID}/{ServiceName}");

//app.MapControllerRoute(
//    name: "default",
//    pattern: "{controller=Login}/{action=Login}/{id?}");

app.UseEndpoints(endpoints =>
{
    endpoints.MapControllerRoute(
      name: "Servicedefault",
      pattern: "{controller=Login}/{action=Login}/{ServiceID}/{ServiceName}");


    endpoints.MapControllerRoute(
        name: "default",
        pattern: "{controller=Login}/{action=Login}/{id?}");

});        



app.MapControllers();
//app.MapRazorPages();

app.Run();
