USE [master]
GO
/****** Object:  Database [TitleManagerDB]    Script Date: 180223 19:47:55 ******/
CREATE DATABASE [TitleManagerDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Test', FILENAME = N'C:\Maethor\MS SQLSMS 17\Databases\Test.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Test_log', FILENAME = N'C:\Maethor\MS SQLSMS 17\Databases\Test_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [TitleManagerDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TitleManagerDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [TitleManagerDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TitleManagerDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TitleManagerDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TitleManagerDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [TitleManagerDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TitleManagerDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TitleManagerDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TitleManagerDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TitleManagerDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TitleManagerDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TitleManagerDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TitleManagerDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TitleManagerDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TitleManagerDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TitleManagerDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TitleManagerDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TitleManagerDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TitleManagerDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TitleManagerDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TitleManagerDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TitleManagerDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TitleManagerDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TitleManagerDB] SET  MULTI_USER 
GO
ALTER DATABASE [TitleManagerDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TitleManagerDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TitleManagerDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TitleManagerDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TitleManagerDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TitleManagerDB] SET QUERY_STORE = OFF
GO
USE [TitleManagerDB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [TitleManagerDB]
GO
/****** Object:  User [TestLogin]    Script Date: 180223 19:47:55 ******/
CREATE USER [TestLogin] FOR LOGIN [TestLogin] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [TestLogin]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [TestLogin]
GO
/****** Object:  Table [dbo].[Loaners]    Script Date: 180223 19:47:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loaners](
	[LoanerID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Loaners] PRIMARY KEY CLUSTERED 
(
	[LoanerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Missingmovies]    Script Date: 180223 19:47:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Missingmovies](
	[MissingmovieID] [int] IDENTITY(1,1) NOT NULL,
	[MovieID] [int] NOT NULL,
	[RegisteredByUser] [int] NOT NULL,
	[DateTimeMissing] [datetime2](7) NOT NULL,
	[DateTimeReturn] [datetime2](7) NULL,
 CONSTRAINT [PK_Missingmovies] PRIMARY KEY CLUSTERED 
(
	[MissingmovieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movieloans]    Script Date: 180223 19:47:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movieloans](
	[MovieloanID] [int] IDENTITY(1,1) NOT NULL,
	[MovieID] [int] NOT NULL,
	[LoanerID] [int] NOT NULL,
	[RegisteredByUser] [int] NOT NULL,
	[DateTimeLoan] [datetime2](7) NOT NULL,
	[DateTimeReturn] [datetime2](7) NULL,
 CONSTRAINT [PK_Movieloans] PRIMARY KEY CLUSTERED 
(
	[MovieloanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Moviequalities]    Script Date: 180223 19:47:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Moviequalities](
	[MoviequalityID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Moviequality] PRIMARY KEY CLUSTERED 
(
	[MoviequalityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movies]    Script Date: 180223 19:47:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movies](
	[MovieID] [int] IDENTITY(1,1) NOT NULL,
	[DateTimeCreated] [datetime2](7) NOT NULL,
	[CreatedByUser] [int] NOT NULL,
	[DateTimeDeleted] [datetime2](7) NULL,
	[DeletedByUser] [int] NULL,
	[Title] [nvarchar](100) NOT NULL,
	[IMDBID] [nvarchar](50) NULL,
	[IMDBRating] [float] NULL,
	[RunningTime] [int] NULL,
	[IMDBVotes] [int] NULL,
	[PlotSummary] [text] NULL,
	[Plot] [text] NULL,
	[ReleasedYear] [int] NULL,
	[Language] [nvarchar](1000) NULL,
	[Country] [nvarchar](1000) NULL,
	[Genre] [nvarchar](1000) NULL,
	[Director] [nvarchar](1000) NULL,
	[Cast] [nvarchar](1000) NULL,
	[PosterURL] [nvarchar](1000) NULL,
	[MoviestatusID] [int] NOT NULL,
	[MoviequalityID] [int] NOT NULL,
 CONSTRAINT [PK_Movies] PRIMARY KEY CLUSTERED 
(
	[MovieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Moviesortings]    Script Date: 180223 19:47:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Moviesortings](
	[MoviesortingID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[SortType] [nvarchar](50) NULL,
 CONSTRAINT [PK_Moviesorting] PRIMARY KEY CLUSTERED 
(
	[MoviesortingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Moviestatuses]    Script Date: 180223 19:47:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Moviestatuses](
	[MoviestatusID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Moviestatus] PRIMARY KEY CLUSTERED 
(
	[MoviestatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pages_UserRoles]    Script Date: 180223 19:47:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pages_UserRoles](
	[Pages_UserRolesID] [int] IDENTITY(1,1) NOT NULL,
	[PageID] [int] NOT NULL,
	[UserRoleID] [int] NOT NULL,
 CONSTRAINT [PK_Pages_UserRoles] PRIMARY KEY CLUSTERED 
(
	[Pages_UserRolesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posters]    Script Date: 180223 19:47:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posters](
	[PosterID] [int] IDENTITY(1,1) NOT NULL,
	[DateTimeCreated] [datetime2](7) NOT NULL,
	[CreatedByUser] [int] NOT NULL,
	[MovieID] [int] NOT NULL,
	[Filename] [nvarchar](100) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[Size] [int] NOT NULL,
	[MouseoverTitle] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Posters] PRIMARY KEY CLUSTERED 
(
	[PosterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subjects_UserRoles]    Script Date: 180223 19:47:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subjects_UserRoles](
	[Subjects_UserRolesID] [int] IDENTITY(1,1) NOT NULL,
	[SubjectID] [int] NOT NULL,
	[UserRoleID] [int] NOT NULL,
 CONSTRAINT [PK_Subjects_UserRoles] PRIMARY KEY CLUSTERED 
(
	[Subjects_UserRolesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TableName01]    Script Date: 180223 19:47:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableName01](
	[uniqueID] [int] IDENTITY(1,1) NOT NULL,
	[column1] [nvarchar](50) NOT NULL,
	[column2] [bit] NOT NULL,
 CONSTRAINT [PK_tableName01] PRIMARY KEY CLUSTERED 
(
	[uniqueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Web_Errors]    Script Date: 180223 19:47:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Web_Errors](
	[ErrorID] [int] IDENTITY(1,1) NOT NULL,
	[DateTimeLog] [datetime2](7) NOT NULL,
	[ErrorMessage] [nvarchar](1000) NOT NULL,
	[ExceptionMessage] [nvarchar](1000) NULL,
	[ExceptionCode] [int] NULL,
	[ExceptionTrace] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Web_Errors] PRIMARY KEY CLUSTERED 
(
	[ErrorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Web_Logins]    Script Date: 180223 19:47:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Web_Logins](
	[Web_LoginID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[DateTimeLogin] [datetime2](7) NOT NULL,
	[DateTimeLastActivity] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Web_Logins] PRIMARY KEY CLUSTERED 
(
	[Web_LoginID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Web_Pages]    Script Date: 180223 19:47:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Web_Pages](
	[PageID] [int] IDENTITY(1,1) NOT NULL,
	[SubjectID] [int] NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[Position] [int] NULL,
	[Visible] [bit] NULL,
	[Contents] [nvarchar](1000) NULL,
	[Admin] [bit] NOT NULL,
 CONSTRAINT [PK_Web.Page] PRIMARY KEY CLUSTERED 
(
	[PageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Web_Subjects]    Script Date: 180223 19:47:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Web_Subjects](
	[SubjectID] [int] IDENTITY(1,1) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[Position] [int] NULL,
	[Visible] [bit] NULL,
	[Admin] [bit] NOT NULL,
 CONSTRAINT [PK_Web.Subject] PRIMARY KEY CLUSTERED 
(
	[SubjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Web_UserRoles]    Script Date: 180223 19:47:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Web_UserRoles](
	[UserRoleID] [int] IDENTITY(1,1) NOT NULL,
	[UserRoleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[UserRoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Web_Users]    Script Date: 180223 19:47:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Web_Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[HashedPassword] [nvarchar](60) NOT NULL,
	[UserRoleID] [int] NOT NULL,
	[DateTimeCreated] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_Web_Users] UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Movies] ADD  CONSTRAINT [DF_Movies_CreatedByUser]  DEFAULT ((0)) FOR [CreatedByUser]
GO
ALTER TABLE [dbo].[Movies] ADD  CONSTRAINT [DF_Movies_IMDBID]  DEFAULT ((0)) FOR [IMDBID]
GO
ALTER TABLE [dbo].[Movies] ADD  CONSTRAINT [DF_Movies_IMDBRating]  DEFAULT ((0)) FOR [IMDBRating]
GO
ALTER TABLE [dbo].[Movies] ADD  CONSTRAINT [DF_Movies_RunningTime]  DEFAULT ((0)) FOR [RunningTime]
GO
ALTER TABLE [dbo].[Movies] ADD  CONSTRAINT [DF_Movies_IMDBVotes]  DEFAULT ((0)) FOR [IMDBVotes]
GO
ALTER TABLE [dbo].[Movies] ADD  CONSTRAINT [DF_Movies_Plot]  DEFAULT ('No plot entered.') FOR [Plot]
GO
ALTER TABLE [dbo].[Movies] ADD  CONSTRAINT [DF_Movies_ReleasedYear]  DEFAULT ((0)) FOR [ReleasedYear]
GO
ALTER TABLE [dbo].[Movies] ADD  CONSTRAINT [DF_Movies_MoviestatusID]  DEFAULT ((1)) FOR [MoviestatusID]
GO
ALTER TABLE [dbo].[Movies] ADD  CONSTRAINT [DF_Movies_QualityID]  DEFAULT ((1)) FOR [MoviequalityID]
GO
ALTER TABLE [dbo].[Web_Pages] ADD  CONSTRAINT [DF_Web_Pages_Admin]  DEFAULT ((1)) FOR [Admin]
GO
ALTER TABLE [dbo].[Web_Subjects] ADD  CONSTRAINT [DF_Web_Subjects_Admin]  DEFAULT ((1)) FOR [Admin]
GO
ALTER TABLE [dbo].[Web_Users] ADD  CONSTRAINT [DF_Web_User_UserRole]  DEFAULT ((2)) FOR [UserRoleID]
GO
ALTER TABLE [dbo].[Web_Users] ADD  CONSTRAINT [DF_Web_Users_DateCreated]  DEFAULT (getdate()) FOR [DateTimeCreated]
GO
ALTER TABLE [dbo].[Missingmovies]  WITH CHECK ADD  CONSTRAINT [FK_Missingmovies_Movies] FOREIGN KEY([MovieID])
REFERENCES [dbo].[Movies] ([MovieID])
GO
ALTER TABLE [dbo].[Missingmovies] CHECK CONSTRAINT [FK_Missingmovies_Movies]
GO
ALTER TABLE [dbo].[Missingmovies]  WITH CHECK ADD  CONSTRAINT [FK_Missingmovies_Web_Users] FOREIGN KEY([RegisteredByUser])
REFERENCES [dbo].[Web_Users] ([UserID])
GO
ALTER TABLE [dbo].[Missingmovies] CHECK CONSTRAINT [FK_Missingmovies_Web_Users]
GO
ALTER TABLE [dbo].[Movieloans]  WITH CHECK ADD  CONSTRAINT [FK_Movieloans_Loaners] FOREIGN KEY([LoanerID])
REFERENCES [dbo].[Loaners] ([LoanerID])
GO
ALTER TABLE [dbo].[Movieloans] CHECK CONSTRAINT [FK_Movieloans_Loaners]
GO
ALTER TABLE [dbo].[Movieloans]  WITH CHECK ADD  CONSTRAINT [FK_Movieloans_Movies] FOREIGN KEY([MovieID])
REFERENCES [dbo].[Movies] ([MovieID])
GO
ALTER TABLE [dbo].[Movieloans] CHECK CONSTRAINT [FK_Movieloans_Movies]
GO
ALTER TABLE [dbo].[Movieloans]  WITH CHECK ADD  CONSTRAINT [FK_Movieloans_Web_Users] FOREIGN KEY([RegisteredByUser])
REFERENCES [dbo].[Web_Users] ([UserID])
GO
ALTER TABLE [dbo].[Movieloans] CHECK CONSTRAINT [FK_Movieloans_Web_Users]
GO
ALTER TABLE [dbo].[Movies]  WITH CHECK ADD  CONSTRAINT [FK_Movies_Moviequality] FOREIGN KEY([MoviequalityID])
REFERENCES [dbo].[Moviequalities] ([MoviequalityID])
GO
ALTER TABLE [dbo].[Movies] CHECK CONSTRAINT [FK_Movies_Moviequality]
GO
ALTER TABLE [dbo].[Movies]  WITH CHECK ADD  CONSTRAINT [FK_Movies_Moviestatus] FOREIGN KEY([MoviestatusID])
REFERENCES [dbo].[Moviestatuses] ([MoviestatusID])
GO
ALTER TABLE [dbo].[Movies] CHECK CONSTRAINT [FK_Movies_Moviestatus]
GO
ALTER TABLE [dbo].[Movies]  WITH CHECK ADD  CONSTRAINT [FK_Movies_Web_Users] FOREIGN KEY([CreatedByUser])
REFERENCES [dbo].[Web_Users] ([UserID])
GO
ALTER TABLE [dbo].[Movies] CHECK CONSTRAINT [FK_Movies_Web_Users]
GO
ALTER TABLE [dbo].[Movies]  WITH CHECK ADD  CONSTRAINT [FK_Movies_Web_Users1] FOREIGN KEY([DeletedByUser])
REFERENCES [dbo].[Web_Users] ([UserID])
GO
ALTER TABLE [dbo].[Movies] CHECK CONSTRAINT [FK_Movies_Web_Users1]
GO
ALTER TABLE [dbo].[Pages_UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_Pages_UserRoles_Web_Pages] FOREIGN KEY([PageID])
REFERENCES [dbo].[Web_Pages] ([PageID])
GO
ALTER TABLE [dbo].[Pages_UserRoles] CHECK CONSTRAINT [FK_Pages_UserRoles_Web_Pages]
GO
ALTER TABLE [dbo].[Pages_UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_Pages_UserRoles_Web_UserRoles] FOREIGN KEY([UserRoleID])
REFERENCES [dbo].[Web_UserRoles] ([UserRoleID])
GO
ALTER TABLE [dbo].[Pages_UserRoles] CHECK CONSTRAINT [FK_Pages_UserRoles_Web_UserRoles]
GO
ALTER TABLE [dbo].[Posters]  WITH CHECK ADD  CONSTRAINT [FK_Posters_Movies] FOREIGN KEY([MovieID])
REFERENCES [dbo].[Movies] ([MovieID])
GO
ALTER TABLE [dbo].[Posters] CHECK CONSTRAINT [FK_Posters_Movies]
GO
ALTER TABLE [dbo].[Posters]  WITH CHECK ADD  CONSTRAINT [FK_Posters_Web_Users] FOREIGN KEY([CreatedByUser])
REFERENCES [dbo].[Web_Users] ([UserID])
GO
ALTER TABLE [dbo].[Posters] CHECK CONSTRAINT [FK_Posters_Web_Users]
GO
ALTER TABLE [dbo].[Subjects_UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_Subjects_UserRoles_Web_Subjects] FOREIGN KEY([SubjectID])
REFERENCES [dbo].[Web_Subjects] ([SubjectID])
GO
ALTER TABLE [dbo].[Subjects_UserRoles] CHECK CONSTRAINT [FK_Subjects_UserRoles_Web_Subjects]
GO
ALTER TABLE [dbo].[Subjects_UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_Subjects_UserRoles_Web_UserRoles] FOREIGN KEY([UserRoleID])
REFERENCES [dbo].[Web_UserRoles] ([UserRoleID])
GO
ALTER TABLE [dbo].[Subjects_UserRoles] CHECK CONSTRAINT [FK_Subjects_UserRoles_Web_UserRoles]
GO
ALTER TABLE [dbo].[Web_Logins]  WITH CHECK ADD  CONSTRAINT [FK_Web_Logins_Web_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Web_Users] ([UserID])
GO
ALTER TABLE [dbo].[Web_Logins] CHECK CONSTRAINT [FK_Web_Logins_Web_Users]
GO
ALTER TABLE [dbo].[Web_Pages]  WITH CHECK ADD  CONSTRAINT [FK_Web_Pages_Web_Subjects] FOREIGN KEY([SubjectID])
REFERENCES [dbo].[Web_Subjects] ([SubjectID])
GO
ALTER TABLE [dbo].[Web_Pages] CHECK CONSTRAINT [FK_Web_Pages_Web_Subjects]
GO
ALTER TABLE [dbo].[Web_Users]  WITH CHECK ADD  CONSTRAINT [FK_Web_Users_Web_UserRoles] FOREIGN KEY([UserRoleID])
REFERENCES [dbo].[Web_UserRoles] ([UserRoleID])
GO
ALTER TABLE [dbo].[Web_Users] CHECK CONSTRAINT [FK_Web_Users_Web_UserRoles]
GO
/****** Object:  StoredProcedure [dbo].[find_movie_by_imdbid]    Script Date: 180223 19:47:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[find_movie_by_imdbid] 
	@imdbid nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM dbo.Movies WHERE IMDBID = @imdbid
END
GO
USE [master]
GO
ALTER DATABASE [TitleManagerDB] SET  READ_WRITE 
GO
