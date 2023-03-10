USE [master]
GO
/****** Object:  Database [db_schedule]    Script Date: 08/11/2022 13:12:05 ******/
CREATE DATABASE [db_schedule]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db_schedule', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\db_schedule.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'db_schedule_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\db_schedule_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [db_schedule] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_schedule].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_schedule] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db_schedule] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db_schedule] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db_schedule] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db_schedule] SET ARITHABORT OFF 
GO
ALTER DATABASE [db_schedule] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [db_schedule] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db_schedule] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db_schedule] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db_schedule] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db_schedule] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db_schedule] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db_schedule] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db_schedule] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db_schedule] SET  DISABLE_BROKER 
GO
ALTER DATABASE [db_schedule] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db_schedule] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db_schedule] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db_schedule] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db_schedule] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db_schedule] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db_schedule] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db_schedule] SET RECOVERY FULL 
GO
ALTER DATABASE [db_schedule] SET  MULTI_USER 
GO
ALTER DATABASE [db_schedule] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db_schedule] SET DB_CHAINING OFF 
GO
ALTER DATABASE [db_schedule] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [db_schedule] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [db_schedule] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [db_schedule] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'db_schedule', N'ON'
GO
ALTER DATABASE [db_schedule] SET QUERY_STORE = OFF
GO
USE [db_schedule]
GO
/****** Object:  Table [dbo].[data_item]    Script Date: 08/11/2022 13:12:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data_item](
	[id_item] [int] IDENTITY(1,1) NOT NULL,
	[type_item] [varchar](50) NULL,
	[tanggal_pembuatan] [date] NULL,
	[berat_produk] [float] NULL,
	[std_spray] [varchar](50) NULL,
	[jenis] [varchar](50) NULL,
 CONSTRAINT [PK_data_mould] PRIMARY KEY CLUSTERED 
(
	[id_item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[data_pm]    Script Date: 08/11/2022 13:12:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data_pm](
	[id_pm] [int] IDENTITY(1,1) NOT NULL,
	[start_date] [date] NULL,
	[actual_date] [date] NULL,
	[shift] [int] NULL,
	[created_at] [datetime] NULL,
 CONSTRAINT [PK_data_pm] PRIMARY KEY CLUSTERED 
(
	[id_pm] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[data_rak]    Script Date: 08/11/2022 13:12:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data_rak](
	[id_rak] [varchar](50) NOT NULL,
	[jenis_rak] [varchar](50) NULL,
	[status] [int] NULL,
	[last_update] [datetime] NULL,
	[keterangan] [varchar](100) NULL,
 CONSTRAINT [PK_data_rak] PRIMARY KEY CLUSTERED 
(
	[id_rak] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[data_trimdies]    Script Date: 08/11/2022 13:12:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data_trimdies](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[type_trimdies] [varchar](100) NULL,
	[no_trimdies] [int] NULL,
	[jarak_pisau] [float] NULL,
	[jenis] [varchar](50) NULL,
 CONSTRAINT [PK_data_trimdies] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[history]    Script Date: 08/11/2022 13:12:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[history](
	[type] [varchar](50) NULL,
	[last_update] [datetime] NULL,
	[keterangan] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[data_item] ON 

INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (1, N'CG80-1P', CAST(N'2022-08-10' AS Date), 93, NULL, N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (2, N'CG80-2P', CAST(N'2022-08-09' AS Date), 93, NULL, N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (3, N'CG80-3P', CAST(N'2022-10-11' AS Date), 93, N'4-4 LAYER', N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (4, N'CG80-4P', CAST(N'2019-01-15' AS Date), 93, N'3-3 LAYER', N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (5, N'CG80-5P', CAST(N'2012-10-11' AS Date), 93, N'4-4 LAYER', N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (6, N'CG80-6P', CAST(N'2013-07-19' AS Date), 93, N'4-3 LAYER', N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (7, N'CG80-7P', CAST(N'2022-07-16' AS Date), 93, NULL, N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (8, N'CG80D-1P', CAST(N'2009-03-03' AS Date), 93, NULL, N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (9, N'CG82-1P', CAST(N'2022-09-26' AS Date), 87, N'5-5 LAYER', N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (10, N'CG82-2P', CAST(N'2003-03-24' AS Date), 87, NULL, N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (11, N'CG82-3P', CAST(N'2013-04-08' AS Date), 87, N'5-4 LAYER', N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (12, N'CG82-4P', CAST(N'2003-03-24' AS Date), 87, N'5-5 LAYER', N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (13, N'CG82-5P', CAST(N'2019-07-19' AS Date), 87, N'5-5 LAYER', N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (14, N'CG82-6P', CAST(N'2012-10-11' AS Date), 87, N'4-5 LAYER', N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (15, N'CG82-7P', CAST(N'2013-07-16' AS Date), 87, N'4-3 LAYER', N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (16, N'CG82-8P', CAST(N'2013-08-23' AS Date), 87, N'4-3 LAYER', N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (17, N'CG82-9P', CAST(N'2019-11-12' AS Date), 87, N'6-5 LAYER', N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (18, N'CG85-1N', CAST(N'2012-10-11' AS Date), 81, NULL, N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (19, N'CG85-2N', CAST(N'2002-07-16' AS Date), 81, NULL, N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (20, N'CG85-3N', CAST(N'2019-07-10' AS Date), 81, NULL, N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (21, N'CG85-4N', CAST(N'2002-04-03' AS Date), 81, NULL, N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (22, N'CG85D-1P', NULL, 81, NULL, N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (23, N'CG85E-1', CAST(N'2019-07-10' AS Date), 82, NULL, N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (24, N'CG85E-2', NULL, 82, NULL, N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (25, N'CG87-1N', CAST(N'2013-04-08' AS Date), 72, N'4-3 LAYER', N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (26, N'CG87-2N', CAST(N'2013-07-16' AS Date), 72, N'4-3 LAYER', N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (27, N'CG87-3N', NULL, 72, N'4-3 LAYER', N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (28, N'CG87-4N', NULL, 72, N'4-3 LAYER', N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (29, N'CG87-5N', NULL, 72, N'4-3 LAYER', N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (30, N'CG87-6N', NULL, 72, N'4-3 LAYER', N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (31, N'CG87-7N', NULL, 72, N'4-3 LAYER', N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (32, N'CG87-8N', NULL, 72, N'4-3 LAYER', N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (33, N'CG87-9N', NULL, 72, N'4-3 LAYER', N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (34, N'CG87-10N', NULL, 72, N'4-3 LAYER', N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (35, N'CG87-11N', NULL, 72, N'4-3 LAYER', N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (36, N'CG87-12N', NULL, 72, N'4-3 LAYER', N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (37, N'CM84-1P', CAST(N'2014-06-23' AS Date), 59.2, NULL, N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (39, N'CM84-2P', CAST(N'2017-07-25' AS Date), 59.2, N'2-5 LAYER', N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (40, N'CM84-3P', CAST(N'2012-05-25' AS Date), 59.2, N'7-5 LAYER', N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (41, N'CM84-4P', CAST(N'2013-08-09' AS Date), 59.2, NULL, N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (42, N'CM84-5P', CAST(N'2002-07-16' AS Date), 59.2, N'6-4 LAYER', N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (43, N'CM84-6P', CAST(N'2018-06-23' AS Date), 59.2, N'3-3 LAYER', N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (44, N'CM87-1N', CAST(N'2012-05-25' AS Date), 52, NULL, N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (45, N'CM87-2N', CAST(N'2012-08-09' AS Date), 52, NULL, N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (46, N'CM87-3N', CAST(N'2017-07-25' AS Date), 52, N'4-4 LAYER', N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (47, N'CM87-4N', CAST(N'2002-08-09' AS Date), 52, NULL, N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (48, N'CM87-5N', CAST(N'2016-01-20' AS Date), 52, N'4-4 LAYER', N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (49, N'CM87-6N', CAST(N'2002-07-16' AS Date), 52, NULL, N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (50, N'YG85-1P', CAST(N'2014-10-03' AS Date), 85, N'4-4 LAYER', N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (51, N'YG85-2P', CAST(N'2012-05-25' AS Date), 85, NULL, N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (52, N'YG85-1N', CAST(N'2013-01-30' AS Date), 85, N'3-4 LAYER', N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (53, N'YG85-2N', CAST(N'2002-08-09' AS Date), 85, N'3-4 LAYER', N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (54, N'YG87-1N', CAST(N'2014-10-04' AS Date), 85, N'2-5 LAYER', N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (55, N'YG87-2N', CAST(N'2002-12-26' AS Date), 85, NULL, N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (56, N'YM82-1P', CAST(N'2018-08-20' AS Date), NULL, NULL, N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (57, N'YM84-1P', CAST(N'2001-03-21' AS Date), 70, NULL, N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (58, N'YM84-2P', CAST(N'2002-05-25' AS Date), 70, NULL, N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (59, N'YM84-3P', CAST(N'2003-03-21' AS Date), 70, NULL, N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (60, N'YM84-4P', CAST(N'2002-08-09' AS Date), 70, NULL, N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (61, N'YM84-1N', CAST(N'2013-08-23' AS Date), 63, N'5-4 LAYER', N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (62, N'YM84-2N', CAST(N'2013-08-23' AS Date), 63, N'6-4 LAYER', N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (63, N'YM84-3N', CAST(N'2016-01-20' AS Date), 63, N'4-4 LAYER', N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (64, N'YM84-4N', CAST(N'2002-08-09' AS Date), 63, NULL, N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (65, N'CR82-1', NULL, 84, NULL, N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (66, N'CR87-1', NULL, 59, NULL, N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (67, N'DF72-1P', CAST(N'2002-07-09' AS Date), 156, NULL, N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (68, N'DF72-2P', CAST(N'2019-12-12' AS Date), 156, NULL, N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (69, N'DF78-1N', CAST(N'2002-07-09' AS Date), 107, NULL, N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (70, N'DF78-2N', CAST(N'2020-04-01' AS Date), 107, NULL, N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (71, N'M87-1', CAST(N'2016-02-03' AS Date), 93, N'3-2 LAYER', N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (72, N'M87-2', CAST(N'2019-10-19' AS Date), 93, N'2-2 LAYER', N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (73, N'YC62-1P', CAST(N'2020-03-25' AS Date), NULL, NULL, N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (74, N'YC70-1N', CAST(N'2020-03-25' AS Date), NULL, NULL, N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (75, N'YT71-1P', CAST(N'2013-09-09' AS Date), 176, NULL, N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (76, N'YT80-1N', CAST(N'2013-09-09' AS Date), 116, NULL, N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (77, N'YL80-1P', CAST(N'2008-01-09' AS Date), 74, NULL, N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (78, N'YL84-1N', CAST(N'2008-01-09' AS Date), 59, NULL, N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (79, N'YS67-1P', CAST(N'2016-03-16' AS Date), 175, NULL, N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (80, N'YS76-1N', CAST(N'2016-03-16' AS Date), 116, NULL, N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (81, N'YU67-1P', CAST(N'2016-03-16' AS Date), 230, NULL, N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (82, N'YU76-1N', CAST(N'2016-03-16' AS Date), 147, NULL, N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (83, N'YA82', CAST(N'2015-08-10' AS Date), NULL, NULL, N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (84, N'YA85', CAST(N'2015-08-10' AS Date), NULL, NULL, N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (85, N'YW7', CAST(N'2018-10-03' AS Date), NULL, NULL, N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (86, N'YW75', CAST(N'2020-07-23' AS Date), NULL, NULL, N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (87, N'YW82', CAST(N'2018-10-03' AS Date), NULL, NULL, N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (88, N'YD85', CAST(N'2016-05-25' AS Date), 85, NULL, N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (89, N'YH87', CAST(N'2018-10-01' AS Date), 85, NULL, N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (90, N'YB85-1N', CAST(N'2018-10-01' AS Date), NULL, NULL, N'Mould')
INSERT [dbo].[data_item] ([id_item], [type_item], [tanggal_pembuatan], [berat_produk], [std_spray], [jenis]) VALUES (91, N'CA82', NULL, NULL, NULL, N'Mould')
SET IDENTITY_INSERT [dbo].[data_item] OFF
GO
SET IDENTITY_INSERT [dbo].[data_pm] ON 

INSERT [dbo].[data_pm] ([id_pm], [start_date], [actual_date], [shift], [created_at]) VALUES (1, CAST(N'2022-11-02' AS Date), CAST(N'2022-11-03' AS Date), 1, CAST(N'2022-10-12T14:45:41.190' AS DateTime))
INSERT [dbo].[data_pm] ([id_pm], [start_date], [actual_date], [shift], [created_at]) VALUES (2, CAST(N'2022-11-08' AS Date), NULL, NULL, CAST(N'2022-10-13T08:30:54.997' AS DateTime))
SET IDENTITY_INSERT [dbo].[data_pm] OFF
GO
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'A1', N'Mould', 0, CAST(N'2022-11-08T11:17:40.000' AS DateTime), NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'A10', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'A11', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'A12', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'A13', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'A14', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'A15', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'A16', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'A17', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'A18', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'A19', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'A2', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'A20', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'A3', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'A4', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'A5', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'A6', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'A7', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'A8', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'A9', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'B1', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'B10', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'B11', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'B12', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'B13', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'B14', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'B15', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'B16', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'B17', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'B18', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'B19', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'B2', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'B20', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'B3', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'B4', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'B5', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'B6', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'B7', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'B8', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'B9', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'C1', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'C10', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'C11', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'C12', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'C13', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'C14', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'C15', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'C16', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'C17', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'C18', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'C19', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'C2', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'C20', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'C3', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'C4', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'C5', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'C6', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'C7', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'C8', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'C9', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'D1', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'D10', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'D11', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'D12', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'D13', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'D14', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'D15', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'D16', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'D17', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'D18', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'D19', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'D2', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'D20', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'D3', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'D4', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'D5', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'D6', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'D7', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'D8', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'D9', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'E1', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'E10', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'E11', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'E12', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'E13', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'E14', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'E15', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'E16', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'E17', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'E18', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'E19', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'E2', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'E20', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'E3', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'E4', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'E5', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'E6', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'E7', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'E8', N'Mould', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'E9', N'Mould', 0, NULL, NULL)
GO
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'F1', N'Trimdies', 0, CAST(N'2022-11-08T11:17:54.000' AS DateTime), NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'F10', N'Trimdies', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'F11', N'Trimdies', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'F12', N'Trimdies', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'F13', N'Trimdies', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'F14', N'Trimdies', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'F15', N'Trimdies', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'F16', N'Trimdies', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'F17', N'Trimdies', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'F18', N'Trimdies', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'F19', N'Trimdies', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'F2', N'Trimdies', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'F20', N'Trimdies', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'F3', N'Trimdies', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'F4', N'Trimdies', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'F5', N'Trimdies', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'F6', N'Trimdies', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'F7', N'Trimdies', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'F8', N'Trimdies', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'F9', N'Trimdies', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'G1', N'Trimdies', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'G10', N'Trimdies', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'G11', N'Trimdies', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'G12', N'Trimdies', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'G13', N'Trimdies', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'G14', N'Trimdies', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'G15', N'Trimdies', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'G16', N'Trimdies', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'G17', N'Trimdies', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'G18', N'Trimdies', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'G19', N'Trimdies', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'G2', N'Trimdies', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'G20', N'Trimdies', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'G3', N'Trimdies', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'G4', N'Trimdies', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'G5', N'Trimdies', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'G6', N'Trimdies', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'G7', N'Trimdies', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'G8', N'Trimdies', 0, NULL, NULL)
INSERT [dbo].[data_rak] ([id_rak], [jenis_rak], [status], [last_update], [keterangan]) VALUES (N'G9', N'Trimdies', 0, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[data_trimdies] ON 

INSERT [dbo].[data_trimdies] ([id], [type_trimdies], [no_trimdies], [jarak_pisau], [jenis]) VALUES (1, N'TD JUGU CG-YG 1', 1, 144.5, N'Trimdies')
INSERT [dbo].[data_trimdies] ([id], [type_trimdies], [no_trimdies], [jarak_pisau], [jenis]) VALUES (2, N'TD JUGU CG-YG 2', 2, 144.5, N'Trimdies')
INSERT [dbo].[data_trimdies] ([id], [type_trimdies], [no_trimdies], [jarak_pisau], [jenis]) VALUES (3, N'TD JUGU CG-YG 3', 3, 144.5, N'Trimdies')
INSERT [dbo].[data_trimdies] ([id], [type_trimdies], [no_trimdies], [jarak_pisau], [jenis]) VALUES (4, N'TD JUGU CG-YG 4', 4, 144.5, N'Trimdies')
INSERT [dbo].[data_trimdies] ([id], [type_trimdies], [no_trimdies], [jarak_pisau], [jenis]) VALUES (5, N'TD JUGU CG-YG 5', 5, 144.5, N'Trimdies')
INSERT [dbo].[data_trimdies] ([id], [type_trimdies], [no_trimdies], [jarak_pisau], [jenis]) VALUES (6, N'TD JUGU CG-YG 6', 6, 144.5, N'Trimdies')
INSERT [dbo].[data_trimdies] ([id], [type_trimdies], [no_trimdies], [jarak_pisau], [jenis]) VALUES (7, N'TD JUGU CG-YG 7', 7, 144.5, N'Trimdies')
INSERT [dbo].[data_trimdies] ([id], [type_trimdies], [no_trimdies], [jarak_pisau], [jenis]) VALUES (8, N'TD JUGU CG-YG 8', 8, 144.5, N'Trimdies')
INSERT [dbo].[data_trimdies] ([id], [type_trimdies], [no_trimdies], [jarak_pisau], [jenis]) VALUES (9, N'TD JUGU CG-YG 9', 9, 144.5, N'Trimdies')
INSERT [dbo].[data_trimdies] ([id], [type_trimdies], [no_trimdies], [jarak_pisau], [jenis]) VALUES (10, N'TD JUGU CG-YG 10', 10, 144.5, N'Trimdies')
INSERT [dbo].[data_trimdies] ([id], [type_trimdies], [no_trimdies], [jarak_pisau], [jenis]) VALUES (11, N'TD JUGU CG-YG 11', 11, 144.5, N'Trimdies')
INSERT [dbo].[data_trimdies] ([id], [type_trimdies], [no_trimdies], [jarak_pisau], [jenis]) VALUES (12, N'TD JUGU CG-YG 12', 12, 144.5, N'Trimdies')
INSERT [dbo].[data_trimdies] ([id], [type_trimdies], [no_trimdies], [jarak_pisau], [jenis]) VALUES (13, N'TD JUGU CG-YG 13', 13, 144.5, N'Trimdies')
INSERT [dbo].[data_trimdies] ([id], [type_trimdies], [no_trimdies], [jarak_pisau], [jenis]) VALUES (14, N'TD JUGU CG-YG 14', 14, 144.5, N'Trimdies')
INSERT [dbo].[data_trimdies] ([id], [type_trimdies], [no_trimdies], [jarak_pisau], [jenis]) VALUES (15, N'TD JUGU CG-YG 15', 15, 144.5, N'Trimdies')
INSERT [dbo].[data_trimdies] ([id], [type_trimdies], [no_trimdies], [jarak_pisau], [jenis]) VALUES (16, N'TD JUGU CG-YG 16', 16, 144.5, N'Trimdies')
INSERT [dbo].[data_trimdies] ([id], [type_trimdies], [no_trimdies], [jarak_pisau], [jenis]) VALUES (17, N'TD JUGU CG-YG 17', 17, 144.5, N'Trimdies')
INSERT [dbo].[data_trimdies] ([id], [type_trimdies], [no_trimdies], [jarak_pisau], [jenis]) VALUES (18, N'TD JUGU CG-YG 18', 18, 144.5, N'Trimdies')
INSERT [dbo].[data_trimdies] ([id], [type_trimdies], [no_trimdies], [jarak_pisau], [jenis]) VALUES (19, N'TD JUGU CG-YG 19', 19, 144.5, N'Trimdies')
INSERT [dbo].[data_trimdies] ([id], [type_trimdies], [no_trimdies], [jarak_pisau], [jenis]) VALUES (20, N'TD JUGU CG-YG 20', 20, 144.5, N'Trimdies')
INSERT [dbo].[data_trimdies] ([id], [type_trimdies], [no_trimdies], [jarak_pisau], [jenis]) VALUES (21, N'TD JUGU CM-YM 1', 1, 108, N'Trimdies')
INSERT [dbo].[data_trimdies] ([id], [type_trimdies], [no_trimdies], [jarak_pisau], [jenis]) VALUES (22, N'TD JUGU CM-YM 2', 2, 108, N'Trimdies')
INSERT [dbo].[data_trimdies] ([id], [type_trimdies], [no_trimdies], [jarak_pisau], [jenis]) VALUES (23, N'TD JUGU CM-YM 3', 3, 108, N'Trimdies')
INSERT [dbo].[data_trimdies] ([id], [type_trimdies], [no_trimdies], [jarak_pisau], [jenis]) VALUES (24, N'TD JUGU CM-YM 4', 4, 108, N'Trimdies')
INSERT [dbo].[data_trimdies] ([id], [type_trimdies], [no_trimdies], [jarak_pisau], [jenis]) VALUES (25, N'TD JUGU CM-YM 5', 5, 108, N'Trimdies')
INSERT [dbo].[data_trimdies] ([id], [type_trimdies], [no_trimdies], [jarak_pisau], [jenis]) VALUES (26, N'TD JUGU CM-YM 6', 6, 108, N'Trimdies')
INSERT [dbo].[data_trimdies] ([id], [type_trimdies], [no_trimdies], [jarak_pisau], [jenis]) VALUES (27, N'TD JUGU DF 1', 1, 158, N'Trimdies')
INSERT [dbo].[data_trimdies] ([id], [type_trimdies], [no_trimdies], [jarak_pisau], [jenis]) VALUES (28, N'TD JUGU DF 2', 2, 158, N'Trimdies')
INSERT [dbo].[data_trimdies] ([id], [type_trimdies], [no_trimdies], [jarak_pisau], [jenis]) VALUES (29, N'TD JUGU MCB 1', 1, 120.5, N'Trimdies')
INSERT [dbo].[data_trimdies] ([id], [type_trimdies], [no_trimdies], [jarak_pisau], [jenis]) VALUES (30, N'TD JUGU MCB 2', 2, 120.5, N'Trimdies')
INSERT [dbo].[data_trimdies] ([id], [type_trimdies], [no_trimdies], [jarak_pisau], [jenis]) VALUES (31, N'TD JUGU YB 1', 1, NULL, N'Trimdies')
INSERT [dbo].[data_trimdies] ([id], [type_trimdies], [no_trimdies], [jarak_pisau], [jenis]) VALUES (32, N'TD JUGU YC 1', 1, NULL, N'Trimdies')
INSERT [dbo].[data_trimdies] ([id], [type_trimdies], [no_trimdies], [jarak_pisau], [jenis]) VALUES (33, N'TD JUGU YH 1', 1, 101, N'Trimdies')
INSERT [dbo].[data_trimdies] ([id], [type_trimdies], [no_trimdies], [jarak_pisau], [jenis]) VALUES (34, N'TD JUGU YL 1', 1, 123, N'Trimdies')
INSERT [dbo].[data_trimdies] ([id], [type_trimdies], [no_trimdies], [jarak_pisau], [jenis]) VALUES (35, N'TD JUGU YS 1', 1, 144.5, N'Trimdies')
INSERT [dbo].[data_trimdies] ([id], [type_trimdies], [no_trimdies], [jarak_pisau], [jenis]) VALUES (36, N'TD JUGU YT 1', 1, 120.5, N'Trimdies')
INSERT [dbo].[data_trimdies] ([id], [type_trimdies], [no_trimdies], [jarak_pisau], [jenis]) VALUES (37, N'TD JUGU YU 1', 1, 140, N'Trimdies')
INSERT [dbo].[data_trimdies] ([id], [type_trimdies], [no_trimdies], [jarak_pisau], [jenis]) VALUES (38, N'TD WINKLE CG-YG 1', 1, 144.5, N'Trimdies')
INSERT [dbo].[data_trimdies] ([id], [type_trimdies], [no_trimdies], [jarak_pisau], [jenis]) VALUES (39, N'TD WINKLE CG-YG 2', 2, 144.5, N'Trimdies')
INSERT [dbo].[data_trimdies] ([id], [type_trimdies], [no_trimdies], [jarak_pisau], [jenis]) VALUES (40, N'TD WINKLE CG-YG 3', 3, 144.5, N'Trimdies')
INSERT [dbo].[data_trimdies] ([id], [type_trimdies], [no_trimdies], [jarak_pisau], [jenis]) VALUES (41, N'TD WINKLE CG-YG 4', 4, 144.5, N'Trimdies')
INSERT [dbo].[data_trimdies] ([id], [type_trimdies], [no_trimdies], [jarak_pisau], [jenis]) VALUES (42, N'TD WINKLE CG-YG 5', 5, 144.5, N'Trimdies')
INSERT [dbo].[data_trimdies] ([id], [type_trimdies], [no_trimdies], [jarak_pisau], [jenis]) VALUES (43, N'TD WINKLE CG-YG 6', 6, 144.5, N'Trimdies')
INSERT [dbo].[data_trimdies] ([id], [type_trimdies], [no_trimdies], [jarak_pisau], [jenis]) VALUES (44, N'TD WINKLE CG-YG 7', 7, 144.5, N'Trimdies')
INSERT [dbo].[data_trimdies] ([id], [type_trimdies], [no_trimdies], [jarak_pisau], [jenis]) VALUES (45, N'TD WINKLE CG-YG 8', 8, 144.5, N'Trimdies')
INSERT [dbo].[data_trimdies] ([id], [type_trimdies], [no_trimdies], [jarak_pisau], [jenis]) VALUES (46, N'TD JUGU YW 1', 1, NULL, N'Trimdies')
INSERT [dbo].[data_trimdies] ([id], [type_trimdies], [no_trimdies], [jarak_pisau], [jenis]) VALUES (47, N'TD WINKLE CM-YM 1', 1, 108, N'Trimdies')
INSERT [dbo].[data_trimdies] ([id], [type_trimdies], [no_trimdies], [jarak_pisau], [jenis]) VALUES (48, N'TD WINKLE CM-YM 2', 2, 108, N'Trimdies')
INSERT [dbo].[data_trimdies] ([id], [type_trimdies], [no_trimdies], [jarak_pisau], [jenis]) VALUES (49, N'TD WIRTZ CG-YG 1', 1, 144.5, N'Trimdies')
INSERT [dbo].[data_trimdies] ([id], [type_trimdies], [no_trimdies], [jarak_pisau], [jenis]) VALUES (50, N'TD WIRTZ CG-YG 2', 2, 144.5, N'Trimdies')
INSERT [dbo].[data_trimdies] ([id], [type_trimdies], [no_trimdies], [jarak_pisau], [jenis]) VALUES (51, N'TD WIRTZ CG-YG 3', 3, 144.5, N'Trimdies')
INSERT [dbo].[data_trimdies] ([id], [type_trimdies], [no_trimdies], [jarak_pisau], [jenis]) VALUES (52, N'TD WIRTZ CG-YG 4', 4, 144.5, N'Trimdies')
INSERT [dbo].[data_trimdies] ([id], [type_trimdies], [no_trimdies], [jarak_pisau], [jenis]) VALUES (53, N'TD WIRTZ CG-YG 5', 5, 144.5, N'Trimdies')
INSERT [dbo].[data_trimdies] ([id], [type_trimdies], [no_trimdies], [jarak_pisau], [jenis]) VALUES (54, N'TD WIRTZ CG-YG 6', 6, 144.5, N'Trimdies')
INSERT [dbo].[data_trimdies] ([id], [type_trimdies], [no_trimdies], [jarak_pisau], [jenis]) VALUES (55, N'TD WIRTZ CM-YM 1', 1, 108, N'Trimdies')
INSERT [dbo].[data_trimdies] ([id], [type_trimdies], [no_trimdies], [jarak_pisau], [jenis]) VALUES (56, N'TD WIRTZ CM-YM 2', 2, 108, N'Trimdies')
INSERT [dbo].[data_trimdies] ([id], [type_trimdies], [no_trimdies], [jarak_pisau], [jenis]) VALUES (57, N'TD WIRTZ CM-YM 3', 3, 108, N'Trimdies')
INSERT [dbo].[data_trimdies] ([id], [type_trimdies], [no_trimdies], [jarak_pisau], [jenis]) VALUES (58, N'TD WIRTZ CM-YM 4', 4, 108, N'Trimdies')
INSERT [dbo].[data_trimdies] ([id], [type_trimdies], [no_trimdies], [jarak_pisau], [jenis]) VALUES (59, N'TD WIRTZ CM-YM 5', 5, 108, N'Trimdies')
SET IDENTITY_INSERT [dbo].[data_trimdies] OFF
GO
ALTER TABLE [dbo].[data_pm] ADD  CONSTRAINT [DF_data_pm_created_at]  DEFAULT (getdate()) FOR [created_at]
GO
USE [master]
GO
ALTER DATABASE [db_schedule] SET  READ_WRITE 
GO
