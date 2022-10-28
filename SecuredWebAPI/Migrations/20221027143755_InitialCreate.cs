using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace SecuredWebAPI.Migrations
{
    public partial class InitialCreate : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "APIManagerTB",
                columns: table => new
                {
                    TokenID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    APIKey = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    CreatedOn = table.Column<DateTime>(type: "datetime2", nullable: true),
                    UserID = table.Column<long>(type: "bigint", nullable: false),
                    HitsID = table.Column<long>(type: "bigint", nullable: true),
                    ServiceID = table.Column<int>(type: "int", nullable: true),
                    Status = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_APIManagerTB", x => x.TokenID);
                });

            migrationBuilder.CreateTable(
                name: "HitsTB",
                columns: table => new
                {
                    HitsID = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Hits = table.Column<long>(type: "bigint", nullable: false),
                    HitsDisplay = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_HitsTB", x => x.HitsID);
                });

            migrationBuilder.CreateTable(
                name: "LoggerTB",
                columns: table => new
                {
                    LoggerID = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    LoggerAPI = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    APIKey = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    CreatedDate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    Host = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Protocol = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Method = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Path = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    ContentType = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Scheme = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    QueryString = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    IsHttps = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    RemoteIpAddress = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_LoggerTB", x => x.LoggerID);
                });

            migrationBuilder.CreateTable(
                name: "MoviesTB",
                columns: table => new
                {
                    MovieID = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Title = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Year = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Rated = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Released = table.Column<DateTime>(type: "datetime2", nullable: true),
                    Runtime = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Genre = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Director = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Writer = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Language = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Country = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Awards = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    BoxOffice = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Production = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Website = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_MoviesTB", x => x.MovieID);
                });

            migrationBuilder.CreateTable(
                name: "MusicTB",
                columns: table => new
                {
                    MusicID = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    MusicLabel = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    MovieName = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Lyricist = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Singer = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    SongName = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_MusicTB", x => x.MusicID);
                });

            migrationBuilder.CreateTable(
                name: "RegisterUser",
                columns: table => new
                {
                    UserID = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Username = table.Column<string>(type: "nvarchar(30)", maxLength: 30, nullable: false),
                    Password = table.Column<string>(type: "nvarchar(31)", maxLength: 31, nullable: false),
                    CreateDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    EmailID = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_RegisterUser", x => x.UserID);
                });

            migrationBuilder.CreateTable(
                name: "ServicesTB",
                columns: table => new
                {
                    ServiceID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ServiceName = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    CreatedDate = table.Column<DateTime>(type: "datetime2", nullable: true),
                    APIName = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ServicesTB", x => x.ServiceID);
                });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "APIManagerTB");

            migrationBuilder.DropTable(
                name: "HitsTB");

            migrationBuilder.DropTable(
                name: "LoggerTB");

            migrationBuilder.DropTable(
                name: "MoviesTB");

            migrationBuilder.DropTable(
                name: "MusicTB");

            migrationBuilder.DropTable(
                name: "RegisterUser");

            migrationBuilder.DropTable(
                name: "ServicesTB");
        }
    }
}
