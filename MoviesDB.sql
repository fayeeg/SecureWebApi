USE [master]
GO
/****** Object:  Database [MoviesDB]    Script Date: 02/04/2018 16:24:20 ******/
CREATE DATABASE [MoviesDB] ON  PRIMARY 
( NAME = N'MoviesDB', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\MoviesDB.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MoviesDB_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\MoviesDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MoviesDB] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MoviesDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MoviesDB] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [MoviesDB] SET ANSI_NULLS OFF
GO
ALTER DATABASE [MoviesDB] SET ANSI_PADDING OFF
GO
ALTER DATABASE [MoviesDB] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [MoviesDB] SET ARITHABORT OFF
GO
ALTER DATABASE [MoviesDB] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [MoviesDB] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [MoviesDB] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [MoviesDB] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [MoviesDB] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [MoviesDB] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [MoviesDB] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [MoviesDB] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [MoviesDB] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [MoviesDB] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [MoviesDB] SET  DISABLE_BROKER
GO
ALTER DATABASE [MoviesDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [MoviesDB] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [MoviesDB] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [MoviesDB] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [MoviesDB] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [MoviesDB] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [MoviesDB] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [MoviesDB] SET  READ_WRITE
GO
ALTER DATABASE [MoviesDB] SET RECOVERY SIMPLE
GO
ALTER DATABASE [MoviesDB] SET  MULTI_USER
GO
ALTER DATABASE [MoviesDB] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [MoviesDB] SET DB_CHAINING OFF
GO
USE [MoviesDB]
GO
/****** Object:  Table [dbo].[ServicesTB]    Script Date: 02/04/2018 16:24:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ServicesTB](
	[ServiceID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceName] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[APIName] [varchar](200) NULL,
 CONSTRAINT [PK_ServicesTB] PRIMARY KEY CLUSTERED 
(
	[ServiceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ServicesTB] ON
INSERT [dbo].[ServicesTB] ([ServiceID], [ServiceName], [CreatedDate], [APIName]) VALUES (1, N'Movies', CAST(0x0000A86700000000 AS DateTime), N'MoviesAPI')
INSERT [dbo].[ServicesTB] ([ServiceID], [ServiceName], [CreatedDate], [APIName]) VALUES (2, N'Music', CAST(0x0000A86700000000 AS DateTime), N'MusicAPI')
SET IDENTITY_INSERT [dbo].[ServicesTB] OFF
/****** Object:  Table [dbo].[RegisterUser]    Script Date: 02/04/2018 16:24:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RegisterUser](
	[UserID] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[EmailID] [varchar](50) NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_RegisterUser] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[RegisterUser] ON
INSERT [dbo].[RegisterUser] ([UserID], [Username], [Password], [EmailID], [CreateDate]) VALUES (1, N'demo', N'EcMeUuVrv6U89Ul/imhLmw==', N'ss@gg.com', CAST(0x0000A8790098E197 AS DateTime))
SET IDENTITY_INSERT [dbo].[RegisterUser] OFF
/****** Object:  Table [dbo].[MusicTB]    Script Date: 02/04/2018 16:24:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MusicTB](
	[MusicID] [bigint] IDENTITY(1,1) NOT NULL,
	[SongName] [varchar](50) NULL,
	[Singer] [varchar](50) NULL,
	[Lyricist] [varchar](50) NULL,
	[MusicLabel] [varchar](50) NULL,
	[MovieName] [varchar](50) NULL,
 CONSTRAINT [PK_MusicTB] PRIMARY KEY CLUSTERED 
(
	[MusicID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[MusicTB] ON
INSERT [dbo].[MusicTB] ([MusicID], [SongName], [Singer], [Lyricist], [MusicLabel], [MovieName]) VALUES (1, N'Tum Hi Ho', N'Arjit Singh', N'Mithoon', N'T-Series', N'Aashiqui 2')
INSERT [dbo].[MusicTB] ([MusicID], [SongName], [Singer], [Lyricist], [MusicLabel], [MovieName]) VALUES (2, N'Kabira', N'Arjit Singh', N'Amitabh Bhattacharya', N'T-Series', N'Yeh Jawaani Hai Deewani')
INSERT [dbo].[MusicTB] ([MusicID], [SongName], [Singer], [Lyricist], [MusicLabel], [MovieName]) VALUES (3, N'Channa Mereya', N'Arjit Singh', N'Amitabh Bhattacharya', N'Sony Music India', N'Ae Dil Hai Mushkil')
INSERT [dbo].[MusicTB] ([MusicID], [SongName], [Singer], [Lyricist], [MusicLabel], [MovieName]) VALUES (4, N'Kal Ho Na Ho', N'Sonu Nigam', N'Javed Akhtar', N'Sony BMG Music ', N'Kal Ho Na Ho')
INSERT [dbo].[MusicTB] ([MusicID], [SongName], [Singer], [Lyricist], [MusicLabel], [MovieName]) VALUES (5, N'Yeh Dil Dewanna', N'Sonu Nigam', N'Anand Bakshi', N'TIPS Music', N'Pardes')
INSERT [dbo].[MusicTB] ([MusicID], [SongName], [Singer], [Lyricist], [MusicLabel], [MovieName]) VALUES (6, N'Tere Sang Yaara', N'Atif Aslam', N'Manoj Muntashir', N'Zee Music Company', N'Rustom')
INSERT [dbo].[MusicTB] ([MusicID], [SongName], [Singer], [Lyricist], [MusicLabel], [MovieName]) VALUES (7, N'Blue Eyes', N'Honey Singh', N'Yo Yo Honey Singh', N'Mafia Mundeer Records', N'')
INSERT [dbo].[MusicTB] ([MusicID], [SongName], [Singer], [Lyricist], [MusicLabel], [MovieName]) VALUES (8, N'Sunn Raha Hai', N'Ankit Tiwari', N'Sandeep Nath', N'T-Series', N'Aashiqui 2')
SET IDENTITY_INSERT [dbo].[MusicTB] OFF
/****** Object:  Table [dbo].[MoviesTB]    Script Date: 02/04/2018 16:24:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MoviesTB](
	[MovieID] [bigint] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NULL,
	[Year] [varchar](4) NULL,
	[Rated] [varchar](50) NULL,
	[Released] [datetime] NULL,
	[Runtime] [varchar](100) NULL,
	[Genre] [varchar](100) NULL,
	[Director] [varchar](100) NULL,
	[Writer] [varchar](200) NULL,
	[Language] [varchar](100) NULL,
	[Country] [varchar](100) NULL,
	[Awards] [varchar](100) NULL,
	[BoxOffice] [varchar](20) NULL,
	[Production] [varchar](100) NULL,
	[Website] [varchar](100) NULL,
 CONSTRAINT [PK_MoviesTB] PRIMARY KEY CLUSTERED 
(
	[MovieID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[MoviesTB] ON
INSERT [dbo].[MoviesTB] ([MovieID], [Title], [Year], [Rated], [Released], [Runtime], [Genre], [Director], [Writer], [Language], [Country], [Awards], [BoxOffice], [Production], [Website]) VALUES (1, N'Beauty and the Beast', N'2017', N'7.3', CAST(0x0000A72300000000 AS DateTime), N'129 minutes', N'Family, Fantasy, Musical', N'Bill Condon', N'Stephen Chbosky,Evan Spiliotopoulos', N'English', N'United States', N'BAFTA Awards', N'$1.264 billion', N'Walt Disney Pictures,Mandeville Films', N'http://www.disney.in/')
INSERT [dbo].[MoviesTB] ([MovieID], [Title], [Year], [Rated], [Released], [Runtime], [Genre], [Director], [Writer], [Language], [Country], [Awards], [BoxOffice], [Production], [Website]) VALUES (2, N'The Fate of the Furious', N'2017', N'6.8', CAST(0x0000A75500000000 AS DateTime), N'136 minutes', N'Action, Crime, Thriller', N'Neal H. Moritz,Vin Diesel,Michael Fottrell,Chris Morgan', N'Chris Morgan', N'English', N'United States', N'Golden Trailer Awards', N'$1.236 billion', N'China Film,Original Film,One Race Films', N'http://www.fastandfurious.com/')
INSERT [dbo].[MoviesTB] ([MovieID], [Title], [Year], [Rated], [Released], [Runtime], [Genre], [Director], [Writer], [Language], [Country], [Awards], [BoxOffice], [Production], [Website]) VALUES (3, N'Star Wars: The Last Jedi', N'2017', N'7.5', CAST(0x0000A84A00000000 AS DateTime), N'152 minutes', N'Action, Adventure, Fantasy ', N'Rian Johnson', N'Rian Johnson', N'English', N'United States', N'BAFTA Awards', N'$1.228 billion', N'Lucasfilm Ltd.', N'http://www.starwars.com/')
INSERT [dbo].[MoviesTB] ([MovieID], [Title], [Year], [Rated], [Released], [Runtime], [Genre], [Director], [Writer], [Language], [Country], [Awards], [BoxOffice], [Production], [Website]) VALUES (4, N'Despicable Me 3', N'2017', N'6.3', CAST(0x0000A7A200000000 AS DateTime), N'90 minutes', N'Animation, Action, Adventure ', N'Pierre Coffin,Kyle Balda', N'Cinco Paul and Ken Daurio', N'English', N'United States', N'American Cinema Editors, USA 2018', N'$1.033 billion', N'Universal Pictures,Illumination Entertainment', N'http://www.despicable.me')
INSERT [dbo].[MoviesTB] ([MovieID], [Title], [Year], [Rated], [Released], [Runtime], [Genre], [Director], [Writer], [Language], [Country], [Awards], [BoxOffice], [Production], [Website]) VALUES (5, N'Spider-Man: Homecoming', N'2017', N'7.5', CAST(0x0000A7A900000000 AS DateTime), N'133 minutes', N'Action, Adventure, Sci-Fi', N'Jon Watts', N'Jonathan Goldstein,John Francis Daley,Jon Watts,Christopher Ford,Chris McKenna,Erik Sommers', N'English', N'United States', N'Evening Standard British Film Awards', N'$880.2 million', N'Columbia Pictures,Marvel Studios,Pascal Pictures', N'http://www.spidermanhomecoming.com/discanddigital/')
INSERT [dbo].[MoviesTB] ([MovieID], [Title], [Year], [Rated], [Released], [Runtime], [Genre], [Director], [Writer], [Language], [Country], [Awards], [BoxOffice], [Production], [Website]) VALUES (6, N'Wolf Warrior 2', N'2017', N'6.4', CAST(0x0000A7BD00000000 AS DateTime), N'121 minutes', N'Action, Drama, Thriller', N'Wu Jing', N'Wu Jing,Dong Qun,Liu Yi', N'Mandarin,English', N'China', N'(AACTA) Awards', N'$874 million', N'Deng Feng International Media,China Film Group,Bona Films,Beijing Culture', N'http://wellgousa.com/theatrical/wolf-warrior-2')
INSERT [dbo].[MoviesTB] ([MovieID], [Title], [Year], [Rated], [Released], [Runtime], [Genre], [Director], [Writer], [Language], [Country], [Awards], [BoxOffice], [Production], [Website]) VALUES (7, N'Guardians of the Galaxy Vol. 2', N'2017', N'7.8', CAST(0x0000A76A00000000 AS DateTime), N'137 minutes', N'Action, Adventure, Sci-Fi', N'James Gunn', N'James Gunn', N'English', N'United States', N'Annie Awards 2018', N'$863.7 million', N'Marvel Studios', N'https://marvel.com/guardians')
INSERT [dbo].[MoviesTB] ([MovieID], [Title], [Year], [Rated], [Released], [Runtime], [Genre], [Director], [Writer], [Language], [Country], [Awards], [BoxOffice], [Production], [Website]) VALUES (8, N'Thor: Ragnarok', N'2017', N'8.1', CAST(0x0000A82000000000 AS DateTime), N'130 minutes', N'Action, Adventure, Comedy', N'Taika Waititi', N'Eric Pearson,Craig Kyle,Christopher Yost', N'English', N'United States', N'Black Reel Awards', N'$850.4 million', N'Marvel Studios', N'https://marvel.com/thor')
INSERT [dbo].[MoviesTB] ([MovieID], [Title], [Year], [Rated], [Released], [Runtime], [Genre], [Director], [Writer], [Language], [Country], [Awards], [BoxOffice], [Production], [Website]) VALUES (9, N'Wonder Woman (2017 film)', N'2017', N'7.6', CAST(0x0000A78600000000 AS DateTime), N'141 minutes', N'Action, Adventure, Fantasy', N'Patty Jenkins', N'Allan Heinberg', N'English', N'United States', N'Screen Actors Guild Awards', N'$821.9 million', N'RatPac-Dune ,DC Films,Tencent Pictures,Wanda Pictures,Atlas ,Cruel and Unusual Films', N'http://wonderwomanfilm.com/')
INSERT [dbo].[MoviesTB] ([MovieID], [Title], [Year], [Rated], [Released], [Runtime], [Genre], [Director], [Writer], [Language], [Country], [Awards], [BoxOffice], [Production], [Website]) VALUES (10, N'Pirates of the Caribbean: Dead Men Tell No Tales', N'2017', N'6.7', CAST(0x0000A77F00000000 AS DateTime), N'129 minutes', N'Action, Adventure, Fantasy', N'Joachim Rønning,Espen Sandberg', N'Jeff Nathanson', N'English', N'United States', N'Hollywood Post Alliance, US ', N'$794.9 million', N'Walt Disney Pictures,Jerry Bruckheimer Films', N'http://pirates.disney.com/pirates-of-the-caribbean-dead-men-tell-no-tales')
SET IDENTITY_INSERT [dbo].[MoviesTB] OFF
/****** Object:  Table [dbo].[LoggerTB]    Script Date: 02/04/2018 16:24:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoggerTB](
	[LoggerID] [bigint] IDENTITY(1,1) NOT NULL,
	[LoggerAPI] [varchar](500) NULL,
	[APIKey] [varchar](100) NULL,
	[CreatedDate] [datetime] NULL,
	[Host] [varchar](100) NULL,
	[Protocol] [varchar](100) NULL,
	[Method] [varchar](100) NULL,
	[Path] [varchar](100) NULL,
	[ContentType] [varchar](100) NULL,
	[Scheme] [varchar](100) NULL,
	[QueryString] [varchar](100) NULL,
	[IsHttps] [varchar](100) NULL,
	[RemoteIpAddress] [varchar](100) NULL,
 CONSTRAINT [PK_LoggerTB] PRIMARY KEY CLUSTERED 
(
	[LoggerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[LoggerTB] ON
INSERT [dbo].[LoggerTB] ([LoggerID], [LoggerAPI], [APIKey], [CreatedDate], [Host], [Protocol], [Method], [Path], [ContentType], [Scheme], [QueryString], [IsHttps], [RemoteIpAddress]) VALUES (1, N'MoviesAPI', N'XtSREijsrZYkt9S', CAST(0x0000A87D00C2A49D AS DateTime), N'localhost:50911', N'HTTP/1.1', N'POST', N'/api/MoviesAPI', N'application/json', N'http', N'?key=XtSREijsrZYkt9S', N'No', N'::1')
INSERT [dbo].[LoggerTB] ([LoggerID], [LoggerAPI], [APIKey], [CreatedDate], [Host], [Protocol], [Method], [Path], [ContentType], [Scheme], [QueryString], [IsHttps], [RemoteIpAddress]) VALUES (2, N'MoviesAPI', N'XtSREijsrZYkt9S', CAST(0x0000A87D00C2E2EC AS DateTime), N'localhost:50911', N'HTTP/1.1', N'POST', N'/api/MoviesAPI', N'application/json', N'http', N'?key=XtSREijsrZYkt9S', N'No', N'::1')
INSERT [dbo].[LoggerTB] ([LoggerID], [LoggerAPI], [APIKey], [CreatedDate], [Host], [Protocol], [Method], [Path], [ContentType], [Scheme], [QueryString], [IsHttps], [RemoteIpAddress]) VALUES (3, N'MoviesAPI', N'XtSREijsrZYkt9S', CAST(0x0000A87D00C95514 AS DateTime), N'localhost:50911', N'HTTP/1.1', N'POST', N'/api/MoviesAPI', N'application/json', N'http', N'?key=XtSREijsrZYkt9S', N'No', N'::1')
INSERT [dbo].[LoggerTB] ([LoggerID], [LoggerAPI], [APIKey], [CreatedDate], [Host], [Protocol], [Method], [Path], [ContentType], [Scheme], [QueryString], [IsHttps], [RemoteIpAddress]) VALUES (4, N'MoviesAPI', N'XtSREijsrZYkt9S', CAST(0x0000A87D00C2E2EC AS DateTime), N'localhost:50911', N'HTTP/1.1', N'POST', N'/api/MoviesAPI', N'application/json', N'http', N'?key=XtSREijsrZYkt9S', N'No', N'::1')
INSERT [dbo].[LoggerTB] ([LoggerID], [LoggerAPI], [APIKey], [CreatedDate], [Host], [Protocol], [Method], [Path], [ContentType], [Scheme], [QueryString], [IsHttps], [RemoteIpAddress]) VALUES (5, N'MoviesAPI', N'XtSREijsrZYkt9S', CAST(0x0000A87D00C2E2EC AS DateTime), N'localhost:50911', N'HTTP/1.1', N'POST', N'/api/MoviesAPI', N'application/json', N'http', N'?key=XtSREijsrZYkt9S', N'No', N'::1')
INSERT [dbo].[LoggerTB] ([LoggerID], [LoggerAPI], [APIKey], [CreatedDate], [Host], [Protocol], [Method], [Path], [ContentType], [Scheme], [QueryString], [IsHttps], [RemoteIpAddress]) VALUES (6, N'MoviesAPI', N'XtSREijsrZYkt9S', CAST(0x0000A87D00C2E2EC AS DateTime), N'localhost:50911', N'HTTP/1.1', N'POST', N'/api/MoviesAPI', N'application/json', N'http', N'?key=XtSREijsrZYkt9S', N'No', N'::1')
INSERT [dbo].[LoggerTB] ([LoggerID], [LoggerAPI], [APIKey], [CreatedDate], [Host], [Protocol], [Method], [Path], [ContentType], [Scheme], [QueryString], [IsHttps], [RemoteIpAddress]) VALUES (7, N'MoviesAPI', N'XtSREijsrZYkt9S', CAST(0x0000A87D00C2E2EC AS DateTime), N'localhost:50911', N'HTTP/1.1', N'POST', N'/api/MoviesAPI', N'application/json', N'http', N'?key=XtSREijsrZYkt9S', N'No', N'::1')
INSERT [dbo].[LoggerTB] ([LoggerID], [LoggerAPI], [APIKey], [CreatedDate], [Host], [Protocol], [Method], [Path], [ContentType], [Scheme], [QueryString], [IsHttps], [RemoteIpAddress]) VALUES (8, N'MoviesAPI', N'XtSREijsrZYkt9S', CAST(0x0000A87D00C2E2EC AS DateTime), N'localhost:50911', N'HTTP/1.1', N'POST', N'/api/MoviesAPI', N'application/json', N'http', N'?key=XtSREijsrZYkt9S', N'No', N'::1')
INSERT [dbo].[LoggerTB] ([LoggerID], [LoggerAPI], [APIKey], [CreatedDate], [Host], [Protocol], [Method], [Path], [ContentType], [Scheme], [QueryString], [IsHttps], [RemoteIpAddress]) VALUES (9, N'MoviesAPI', N'XtSREijsrZYkt9S', CAST(0x0000A87D00C2E2EC AS DateTime), N'localhost:50911', N'HTTP/1.1', N'POST', N'/api/MoviesAPI', N'application/json', N'http', N'?key=XtSREijsrZYkt9S', N'No', N'::1')
INSERT [dbo].[LoggerTB] ([LoggerID], [LoggerAPI], [APIKey], [CreatedDate], [Host], [Protocol], [Method], [Path], [ContentType], [Scheme], [QueryString], [IsHttps], [RemoteIpAddress]) VALUES (10, N'MoviesAPI', N'XtSREijsrZYkt9S', CAST(0x0000A87D00C2E2EC AS DateTime), N'localhost:50911', N'HTTP/1.1', N'POST', N'/api/MoviesAPI', N'application/json', N'http', N'?key=XtSREijsrZYkt9S', N'No', N'::1')
SET IDENTITY_INSERT [dbo].[LoggerTB] OFF
/****** Object:  Table [dbo].[HitsTB]    Script Date: 02/04/2018 16:24:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HitsTB](
	[HitsID] [bigint] IDENTITY(1,1) NOT NULL,
	[Hits] [bigint] NULL,
	[HitsDisplay] [varchar](50) NULL,
 CONSTRAINT [PK_HitsTB] PRIMARY KEY CLUSTERED 
(
	[HitsID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[HitsTB] ON
INSERT [dbo].[HitsTB] ([HitsID], [Hits], [HitsDisplay]) VALUES (1, 1000, N'1000')
INSERT [dbo].[HitsTB] ([HitsID], [Hits], [HitsDisplay]) VALUES (2, 2000, N'2000')
INSERT [dbo].[HitsTB] ([HitsID], [Hits], [HitsDisplay]) VALUES (3, 5000, N'5000')
INSERT [dbo].[HitsTB] ([HitsID], [Hits], [HitsDisplay]) VALUES (4, 30000, N'30000')
INSERT [dbo].[HitsTB] ([HitsID], [Hits], [HitsDisplay]) VALUES (5, 500000, N'Unlimited')
SET IDENTITY_INSERT [dbo].[HitsTB] OFF
/****** Object:  Table [dbo].[APIManagerTB]    Script Date: 02/04/2018 16:24:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[APIManagerTB](
	[TokenID] [int] IDENTITY(1,1) NOT NULL,
	[APIKey] [varchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[UserID] [bigint] NULL,
	[HitsID] [bigint] NULL,
	[ServiceID] [int] NULL,
	[Status] [char](1) NULL,
 CONSTRAINT [PK_APIManagerTB_1] PRIMARY KEY CLUSTERED 
(
	[TokenID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[APIManagerTB] ON
INSERT [dbo].[APIManagerTB] ([TokenID], [APIKey], [CreatedOn], [UserID], [HitsID], [ServiceID], [Status]) VALUES (1, N'XtSREijsrZYkt9S', CAST(0x0000A87A00A02E63 AS DateTime), 1, 1, 1, N'A')
INSERT [dbo].[APIManagerTB] ([TokenID], [APIKey], [CreatedOn], [UserID], [HitsID], [ServiceID], [Status]) VALUES (2, N'loU1gNtSehr7lfF', CAST(0x0000A87D00C4A69F AS DateTime), 1, 1, 2, N'D')
SET IDENTITY_INSERT [dbo].[APIManagerTB] OFF
/****** Object:  StoredProcedure [dbo].[Usp_ReactivateService_update]    Script Date: 02/04/2018 16:24:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec Usp_GetApiDetailsbyServiceIDandUserID 2,2
Create proc [dbo].[Usp_ReactivateService_update]
@ServiceID int,
@UserID int
as
begin
Update APIManagerTB
set APIManagerTB.Status = 'A'
Where APIManagerTB.ServiceID =@ServiceID and APIManagerTB.UserID =@UserID 
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_GetChartsMusicreport]    Script Date: 02/04/2018 16:24:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Usp_GetChartsMusicreport]

as
begin

Declare @year int 
set @year = (select datepart (yy,GETDATE()))

   DECLARE @ChartReport TABLE 
   ( 
    Requestcount int NOT NULL
    )
      
Insert into @ChartReport   
select COUNT(CreatedDate)   from [LoggerTB]   where  datepart (mm,CreatedDate)  =1 and  datepart (yy,CreatedDate) =@year and LoggerAPI ='MusicAPI'
Insert into @ChartReport   
select COUNT(CreatedDate)   from [LoggerTB]   where  datepart (mm,CreatedDate)  =2 and  datepart (yy,CreatedDate) =@year and LoggerAPI ='MusicAPI'
Insert into @ChartReport   
select COUNT(CreatedDate)   from [LoggerTB]   where  datepart (mm,CreatedDate)  =3  and  datepart (yy,CreatedDate) =@year and LoggerAPI ='MusicAPI'
Insert into @ChartReport   
select COUNT(CreatedDate)   from [LoggerTB]   where  datepart (mm,CreatedDate)  =4 and  datepart (yy,CreatedDate) =@year and LoggerAPI ='MusicAPI'
Insert into @ChartReport   
select COUNT(CreatedDate)   from [LoggerTB]   where  datepart (mm,CreatedDate)  =5and  datepart (yy,CreatedDate) =@year and LoggerAPI ='MusicAPI'
Insert into @ChartReport    
select COUNT(CreatedDate)   from [LoggerTB]   where  datepart (mm,CreatedDate)  =6 and  datepart (yy,CreatedDate) =@year and LoggerAPI ='MusicAPI'
Insert into @ChartReport   
select COUNT(CreatedDate)   from [LoggerTB]   where  datepart (mm,CreatedDate)  =7 and  datepart (yy,CreatedDate) =@year and LoggerAPI ='MusicAPI'
Insert into @ChartReport   
select COUNT(CreatedDate)   from [LoggerTB]   where  datepart (mm,CreatedDate)  =8 and  datepart (yy,CreatedDate) =@year and LoggerAPI ='MusicAPI'
Insert into @ChartReport   
select COUNT(CreatedDate)   from [LoggerTB]   where  datepart (mm,CreatedDate)  =9 and  datepart (yy,CreatedDate) =@year and LoggerAPI ='MusicAPI'
Insert into @ChartReport   
select COUNT(CreatedDate)   from [LoggerTB]   where  datepart (mm,CreatedDate)  =10and  datepart (yy,CreatedDate) =@year and LoggerAPI ='MusicAPI'
Insert into @ChartReport    
select COUNT(CreatedDate)   from [LoggerTB]   where  datepart (mm,CreatedDate)  =11and  datepart (yy,CreatedDate) =@year and LoggerAPI ='MusicAPI'
Insert into @ChartReport    
select COUNT(CreatedDate)   from [LoggerTB]   where  datepart (mm,CreatedDate)  =12 and  datepart (yy,CreatedDate) =@year and LoggerAPI ='MusicAPI'

select * from @ChartReport

end
GO
/****** Object:  StoredProcedure [dbo].[Usp_GetChartsMoviesreport]    Script Date: 02/04/2018 16:24:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Usp_GetChartsMoviesreport]

as
begin

Declare @year int 
set @year = (select datepart (yy,GETDATE()))

   DECLARE @ChartReport TABLE 
   ( 
    Requestcount int NOT NULL
    )
      
Insert into @ChartReport   
select COUNT(CreatedDate)   from [LoggerTB]   where  datepart (mm,CreatedDate)  =1 and  datepart (yy,CreatedDate) =@year and LoggerAPI ='MoviesAPI'
Insert into @ChartReport   
select COUNT(CreatedDate)   from [LoggerTB]   where  datepart (mm,CreatedDate)  =2 and  datepart (yy,CreatedDate) =@year and LoggerAPI ='MoviesAPI'
Insert into @ChartReport   
select COUNT(CreatedDate)   from [LoggerTB]   where  datepart (mm,CreatedDate)  =3  and  datepart (yy,CreatedDate) =@year and LoggerAPI ='MoviesAPI'
Insert into @ChartReport   
select COUNT(CreatedDate)   from [LoggerTB]   where  datepart (mm,CreatedDate)  =4 and  datepart (yy,CreatedDate) =@year and LoggerAPI ='MoviesAPI'
Insert into @ChartReport   
select COUNT(CreatedDate)   from [LoggerTB]   where  datepart (mm,CreatedDate)  =5and  datepart (yy,CreatedDate) =@year and LoggerAPI ='MoviesAPI'
Insert into @ChartReport    
select COUNT(CreatedDate)   from [LoggerTB]   where  datepart (mm,CreatedDate)  =6 and  datepart (yy,CreatedDate) =@year and LoggerAPI ='MoviesAPI'
Insert into @ChartReport   
select COUNT(CreatedDate)   from [LoggerTB]   where  datepart (mm,CreatedDate)  =7 and  datepart (yy,CreatedDate) =@year and LoggerAPI ='MoviesAPI'
Insert into @ChartReport   
select COUNT(CreatedDate)   from [LoggerTB]   where  datepart (mm,CreatedDate)  =8 and  datepart (yy,CreatedDate) =@year and LoggerAPI ='MoviesAPI'
Insert into @ChartReport   
select COUNT(CreatedDate)   from [LoggerTB]   where  datepart (mm,CreatedDate)  =9 and  datepart (yy,CreatedDate) =@year and LoggerAPI ='MoviesAPI'
Insert into @ChartReport   
select COUNT(CreatedDate)   from [LoggerTB]   where  datepart (mm,CreatedDate)  =10and  datepart (yy,CreatedDate) =@year and LoggerAPI ='MoviesAPI'
Insert into @ChartReport    
select COUNT(CreatedDate)   from [LoggerTB]   where  datepart (mm,CreatedDate)  =11and  datepart (yy,CreatedDate) =@year and LoggerAPI ='MoviesAPI'
Insert into @ChartReport    
select COUNT(CreatedDate)   from [LoggerTB]   where  datepart (mm,CreatedDate)  =12 and  datepart (yy,CreatedDate) =@year and LoggerAPI ='MoviesAPI'

select * from @ChartReport

end
GO
/****** Object:  StoredProcedure [dbo].[Usp_GetApiDetailsbyServiceIDandUserID]    Script Date: 02/04/2018 16:24:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Usp_GetApiDetailsbyServiceIDandUserID]
@ServiceID int,
@UserID int
as

begin
SELECT ROW_NUMBER() OVER (ORDER BY TokenID DESC) as RowNo,
       TokenID
      ,APIKey
      ,STB.ServiceName
      ,HTB.Hits
      ,CONVERT(varchar(12),CreatedOn,107) as CreatedOn
      ,ATB.ServiceID
      ,ATB.Status
  FROM APIManagerTB ATB
  inner join ServicesTB STB on ATB.ServiceID = STB.ServiceID
  inner join HitsTB HTB on ATB.HitsID = HTB.HitsID
  Where ATB.ServiceID =@ServiceID and ATB.UserID =@UserID 
end
GO
/****** Object:  StoredProcedure [dbo].[Usp_DeactivateService_update]    Script Date: 02/04/2018 16:24:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec Usp_GetApiDetailsbyServiceIDandUserID 2,2
Create proc [dbo].[Usp_DeactivateService_update]
@ServiceID int,
@UserID int
as
begin
Update APIManagerTB
set APIManagerTB.Status = 'D'
Where APIManagerTB.ServiceID =@ServiceID and APIManagerTB.UserID =@UserID 
end
GO
