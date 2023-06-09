USE [master]
GO
/****** Object:  Database [Football tournament (RFPL)]    Script Date: 27.05.2023 14:42:28 ******/
CREATE DATABASE [Football tournament (RFPL)]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Football tournament (RFPL)', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\Football tournament (RFPL).mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Football tournament (RFPL)_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\Football tournament (RFPL)_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Football tournament (RFPL)] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Football tournament (RFPL)].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Football tournament (RFPL)] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Football tournament (RFPL)] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Football tournament (RFPL)] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Football tournament (RFPL)] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Football tournament (RFPL)] SET ARITHABORT OFF 
GO
ALTER DATABASE [Football tournament (RFPL)] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Football tournament (RFPL)] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Football tournament (RFPL)] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Football tournament (RFPL)] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Football tournament (RFPL)] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Football tournament (RFPL)] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Football tournament (RFPL)] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Football tournament (RFPL)] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Football tournament (RFPL)] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Football tournament (RFPL)] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Football tournament (RFPL)] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Football tournament (RFPL)] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Football tournament (RFPL)] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Football tournament (RFPL)] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Football tournament (RFPL)] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Football tournament (RFPL)] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Football tournament (RFPL)] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Football tournament (RFPL)] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Football tournament (RFPL)] SET  MULTI_USER 
GO
ALTER DATABASE [Football tournament (RFPL)] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Football tournament (RFPL)] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Football tournament (RFPL)] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Football tournament (RFPL)] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Football tournament (RFPL)] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Football tournament (RFPL)] SET QUERY_STORE = OFF
GO
USE [Football tournament (RFPL)]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [Football tournament (RFPL)]
GO
/****** Object:  Table [dbo].[Зритель]    Script Date: 27.05.2023 14:42:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Зритель](
	[Количество зрителей] [int] NOT NULL,
 CONSTRAINT [PK_Зритель] PRIMARY KEY CLUSTERED 
(
	[Количество зрителей] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Игрок]    Script Date: 27.05.2023 14:42:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Игрок](
	[Возрастная группа] [int] NOT NULL,
	[Национальность] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Игрок] PRIMARY KEY CLUSTERED 
(
	[Возрастная группа] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Команда]    Script Date: 27.05.2023 14:42:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Команда](
	[Наименование] [nvarchar](50) NOT NULL,
	[Возрастная группа] [int] NOT NULL,
	[Филиал] [nvarchar](max) NULL,
 CONSTRAINT [PK_Команда] PRIMARY KEY CLUSTERED 
(
	[Возрастная группа] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Матч]    Script Date: 27.05.2023 14:42:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Матч](
	[Местоположение (координаты)] [int] NOT NULL,
	[Количество голов] [int] NOT NULL,
	[Дата проведения] [datetime] NULL,
	[Возрастная группа] [int] NOT NULL,
	[Колличество зрителей] [int] NOT NULL,
 CONSTRAINT [PK_Матч] PRIMARY KEY CLUSTERED 
(
	[Местоположение (координаты)] ASC,
	[Количество голов] ASC,
	[Возрастная группа] ASC,
	[Колличество зрителей] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Результат матча]    Script Date: 27.05.2023 14:42:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Результат матча](
	[Количество голов] [int] NOT NULL,
	[Авторы голов] [nvarchar](max) NULL,
 CONSTRAINT [PK_Результат матча] PRIMARY KEY CLUSTERED 
(
	[Количество голов] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Стадион]    Script Date: 27.05.2023 14:42:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Стадион](
	[Местоположение (координаты)] [int] NOT NULL,
	[Площадь] [int] NOT NULL,
	[Название] [nvarchar](50) NULL,
	[Возрастная группа] [int] NOT NULL,
 CONSTRAINT [PK_Стадион] PRIMARY KEY CLUSTERED 
(
	[Местоположение (координаты)] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Тренер]    Script Date: 27.05.2023 14:42:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Тренер](
	[ФИО] [nvarchar](max) NULL,
	[Стаж работы] [int] NOT NULL,
	[Возрастная группа] [int] NOT NULL,
 CONSTRAINT [PK_Тренер] PRIMARY KEY CLUSTERED 
(
	[Возрастная группа] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Игрок]  WITH CHECK ADD  CONSTRAINT [FK_Игрок_Команда] FOREIGN KEY([Возрастная группа])
REFERENCES [dbo].[Команда] ([Возрастная группа])
GO
ALTER TABLE [dbo].[Игрок] CHECK CONSTRAINT [FK_Игрок_Команда]
GO
ALTER TABLE [dbo].[Матч]  WITH CHECK ADD  CONSTRAINT [FK_Матч_Зритель] FOREIGN KEY([Колличество зрителей])
REFERENCES [dbo].[Зритель] ([Количество зрителей])
GO
ALTER TABLE [dbo].[Матч] CHECK CONSTRAINT [FK_Матч_Зритель]
GO
ALTER TABLE [dbo].[Матч]  WITH CHECK ADD  CONSTRAINT [FK_Матч_Команда] FOREIGN KEY([Возрастная группа])
REFERENCES [dbo].[Команда] ([Возрастная группа])
GO
ALTER TABLE [dbo].[Матч] CHECK CONSTRAINT [FK_Матч_Команда]
GO
ALTER TABLE [dbo].[Матч]  WITH CHECK ADD  CONSTRAINT [FK_Матч_Результат матча] FOREIGN KEY([Количество голов])
REFERENCES [dbo].[Результат матча] ([Количество голов])
GO
ALTER TABLE [dbo].[Матч] CHECK CONSTRAINT [FK_Матч_Результат матча]
GO
ALTER TABLE [dbo].[Матч]  WITH CHECK ADD  CONSTRAINT [FK_Матч_Стадион] FOREIGN KEY([Местоположение (координаты)])
REFERENCES [dbo].[Стадион] ([Местоположение (координаты)])
GO
ALTER TABLE [dbo].[Матч] CHECK CONSTRAINT [FK_Матч_Стадион]
GO
ALTER TABLE [dbo].[Тренер]  WITH CHECK ADD  CONSTRAINT [FK_Тренер_Команда] FOREIGN KEY([Возрастная группа])
REFERENCES [dbo].[Команда] ([Возрастная группа])
GO
ALTER TABLE [dbo].[Тренер] CHECK CONSTRAINT [FK_Тренер_Команда]
GO
USE [master]
GO
ALTER DATABASE [Football tournament (RFPL)] SET  READ_WRITE 
GO
