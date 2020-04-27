USE [master]
GO
/****** Object:  Database [MVC_FormsAuthentication]    Script Date: 28/4/2020 12:35:25 AM ******/
CREATE DATABASE [MVC_FormsAuthentication]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MVC_FormsAuthentication', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MVC_FormsAuthentication.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MVC_FormsAuthentication_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MVC_FormsAuthentication_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MVC_FormsAuthentication] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MVC_FormsAuthentication].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MVC_FormsAuthentication] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MVC_FormsAuthentication] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MVC_FormsAuthentication] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MVC_FormsAuthentication] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MVC_FormsAuthentication] SET ARITHABORT OFF 
GO
ALTER DATABASE [MVC_FormsAuthentication] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MVC_FormsAuthentication] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MVC_FormsAuthentication] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MVC_FormsAuthentication] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MVC_FormsAuthentication] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MVC_FormsAuthentication] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MVC_FormsAuthentication] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MVC_FormsAuthentication] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MVC_FormsAuthentication] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MVC_FormsAuthentication] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MVC_FormsAuthentication] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MVC_FormsAuthentication] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MVC_FormsAuthentication] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MVC_FormsAuthentication] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MVC_FormsAuthentication] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MVC_FormsAuthentication] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MVC_FormsAuthentication] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MVC_FormsAuthentication] SET RECOVERY FULL 
GO
ALTER DATABASE [MVC_FormsAuthentication] SET  MULTI_USER 
GO
ALTER DATABASE [MVC_FormsAuthentication] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MVC_FormsAuthentication] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MVC_FormsAuthentication] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MVC_FormsAuthentication] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MVC_FormsAuthentication] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MVC_FormsAuthentication', N'ON'
GO
ALTER DATABASE [MVC_FormsAuthentication] SET QUERY_STORE = OFF
GO
USE [MVC_FormsAuthentication]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 28/4/2020 12:35:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Designation] [varchar](50) NULL,
	[Salary] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleMaster]    Script Date: 28/4/2020 12:35:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleMaster](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RollName] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRolesMapping]    Script Date: 28/4/2020 12:35:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRolesMapping](
	[ID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[RoleID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 28/4/2020 12:35:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[UserPassword] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserRolesMapping]  WITH CHECK ADD FOREIGN KEY([RoleID])
REFERENCES [dbo].[RoleMaster] ([ID])
GO
ALTER TABLE [dbo].[UserRolesMapping]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
USE [master]
GO
ALTER DATABASE [MVC_FormsAuthentication] SET  READ_WRITE 
GO
