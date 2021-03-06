USE [master]
GO
/****** Object:  Database [ASM_C5]    Script Date: 6/21/2021 9:53:21 AM ******/
CREATE DATABASE [ASM_C5]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ASM_C5', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ASM_C5.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ASM_C5_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ASM_C5_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ASM_C5] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ASM_C5].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ASM_C5] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ASM_C5] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ASM_C5] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ASM_C5] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ASM_C5] SET ARITHABORT OFF 
GO
ALTER DATABASE [ASM_C5] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ASM_C5] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ASM_C5] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ASM_C5] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ASM_C5] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ASM_C5] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ASM_C5] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ASM_C5] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ASM_C5] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ASM_C5] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ASM_C5] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ASM_C5] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ASM_C5] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ASM_C5] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ASM_C5] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ASM_C5] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [ASM_C5] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ASM_C5] SET RECOVERY FULL 
GO
ALTER DATABASE [ASM_C5] SET  MULTI_USER 
GO
ALTER DATABASE [ASM_C5] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ASM_C5] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ASM_C5] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ASM_C5] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ASM_C5] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ASM_C5', N'ON'
GO
USE [ASM_C5]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 6/21/2021 9:53:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DonhangChitiets]    Script Date: 6/21/2021 9:53:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonhangChitiets](
	[ChitietID] [int] IDENTITY(1,1) NOT NULL,
	[DonhangID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[MonAnID] [int] NOT NULL,
	[Soluong] [int] NOT NULL,
	[Thanhtien] [float] NOT NULL,
	[Ghichu] [nvarchar](250) NULL,
 CONSTRAINT [PK_DonhangChitiets] PRIMARY KEY CLUSTERED 
(
	[ChitietID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Donhangs]    Script Date: 6/21/2021 9:53:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Donhangs](
	[DonhangID] [int] IDENTITY(1,1) NOT NULL,
	[KhachhangID] [int] NOT NULL,
	[Ngaydat] [datetime2](7) NOT NULL,
	[Tongtien] [float] NOT NULL,
	[TrangthaiDonhang] [int] NOT NULL,
	[Ghichu] [nvarchar](250) NULL,
 CONSTRAINT [PK_Donhangs] PRIMARY KEY CLUSTERED 
(
	[DonhangID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Khachhangs]    Script Date: 6/21/2021 9:53:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Khachhangs](
	[KhachhangID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](150) NOT NULL,
	[Ngaysinh] [datetime2](7) NULL,
	[PhoneNumber] [varchar](15) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[ConfirmPassword] [varchar](50) NOT NULL,
	[Mota] [nvarchar](250) NULL,
	[Address] [nvarchar](200) NOT NULL DEFAULT (N''),
	[Email] [nvarchar](max) NOT NULL DEFAULT (N''),
 CONSTRAINT [PK_Khachhangs] PRIMARY KEY CLUSTERED 
(
	[KhachhangID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MonAns]    Script Date: 6/21/2021 9:53:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MonAns](
	[MonAnID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Gia] [float] NOT NULL,
	[Phanloai] [int] NOT NULL,
	[Hinh] [nvarchar](100) NULL,
	[Mota] [nvarchar](250) NULL,
	[Trangthai] [bit] NOT NULL,
 CONSTRAINT [PK_MonAns] PRIMARY KEY CLUSTERED 
(
	[MonAnID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Nguoidungs]    Script Date: 6/21/2021 9:53:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Nguoidungs](
	[NguoidungID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Title] [nvarchar](100) NULL,
	[DOB] [datetime2](7) NULL,
	[Admin] [bit] NOT NULL,
	[Locked] [bit] NOT NULL,
	[Password] [varchar](50) NULL,
 CONSTRAINT [PK_Nguoidungs] PRIMARY KEY CLUSTERED 
(
	[NguoidungID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210605151839_Init', N'3.1.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210605154523_db1', N'3.1.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210612125431_Init1', N'3.1.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210615111232_Init5', N'3.1.10')
SET IDENTITY_INSERT [dbo].[DonhangChitiets] ON 

INSERT [dbo].[DonhangChitiets] ([ChitietID], [DonhangID], [CustomerID], [MonAnID], [Soluong], [Thanhtien], [Ghichu]) VALUES (3, 4, 0, 11, 3, 90000, N'')
INSERT [dbo].[DonhangChitiets] ([ChitietID], [DonhangID], [CustomerID], [MonAnID], [Soluong], [Thanhtien], [Ghichu]) VALUES (4, 4, 0, 14, 1, 30000, N'')
INSERT [dbo].[DonhangChitiets] ([ChitietID], [DonhangID], [CustomerID], [MonAnID], [Soluong], [Thanhtien], [Ghichu]) VALUES (5, 4, 0, 23, 2, 50000, N'')
INSERT [dbo].[DonhangChitiets] ([ChitietID], [DonhangID], [CustomerID], [MonAnID], [Soluong], [Thanhtien], [Ghichu]) VALUES (6, 5, 0, 19, 1, 15000, N'')
INSERT [dbo].[DonhangChitiets] ([ChitietID], [DonhangID], [CustomerID], [MonAnID], [Soluong], [Thanhtien], [Ghichu]) VALUES (7, 6, 0, 16, 1, 25000, N'')
INSERT [dbo].[DonhangChitiets] ([ChitietID], [DonhangID], [CustomerID], [MonAnID], [Soluong], [Thanhtien], [Ghichu]) VALUES (8, 6, 0, 15, 1, 50000, N'')
INSERT [dbo].[DonhangChitiets] ([ChitietID], [DonhangID], [CustomerID], [MonAnID], [Soluong], [Thanhtien], [Ghichu]) VALUES (9, 6, 0, 14, 1, 30000, N'')
INSERT [dbo].[DonhangChitiets] ([ChitietID], [DonhangID], [CustomerID], [MonAnID], [Soluong], [Thanhtien], [Ghichu]) VALUES (10, 7, 0, 12, 1, 25000, N'')
INSERT [dbo].[DonhangChitiets] ([ChitietID], [DonhangID], [CustomerID], [MonAnID], [Soluong], [Thanhtien], [Ghichu]) VALUES (11, 7, 0, 14, 2, 60000, N'')
INSERT [dbo].[DonhangChitiets] ([ChitietID], [DonhangID], [CustomerID], [MonAnID], [Soluong], [Thanhtien], [Ghichu]) VALUES (12, 7, 0, 15, 2, 100000, N'')
INSERT [dbo].[DonhangChitiets] ([ChitietID], [DonhangID], [CustomerID], [MonAnID], [Soluong], [Thanhtien], [Ghichu]) VALUES (13, 7, 0, 16, 1, 25000, N'')
INSERT [dbo].[DonhangChitiets] ([ChitietID], [DonhangID], [CustomerID], [MonAnID], [Soluong], [Thanhtien], [Ghichu]) VALUES (14, 8, 0, 12, 1, 25000, N'')
INSERT [dbo].[DonhangChitiets] ([ChitietID], [DonhangID], [CustomerID], [MonAnID], [Soluong], [Thanhtien], [Ghichu]) VALUES (15, 9, 0, 14, 1, 30000, N'')
INSERT [dbo].[DonhangChitiets] ([ChitietID], [DonhangID], [CustomerID], [MonAnID], [Soluong], [Thanhtien], [Ghichu]) VALUES (16, 9, 0, 21, 1, 25000, N'')
INSERT [dbo].[DonhangChitiets] ([ChitietID], [DonhangID], [CustomerID], [MonAnID], [Soluong], [Thanhtien], [Ghichu]) VALUES (17, 10, 0, 11, 2, 60000, N'')
INSERT [dbo].[DonhangChitiets] ([ChitietID], [DonhangID], [CustomerID], [MonAnID], [Soluong], [Thanhtien], [Ghichu]) VALUES (18, 11, 0, 15, 3, 150000, N'')
INSERT [dbo].[DonhangChitiets] ([ChitietID], [DonhangID], [CustomerID], [MonAnID], [Soluong], [Thanhtien], [Ghichu]) VALUES (19, 12, 0, 11, 2, 60000, N'')
INSERT [dbo].[DonhangChitiets] ([ChitietID], [DonhangID], [CustomerID], [MonAnID], [Soluong], [Thanhtien], [Ghichu]) VALUES (20, 13, 0, 19, 1, 15000, N'')
INSERT [dbo].[DonhangChitiets] ([ChitietID], [DonhangID], [CustomerID], [MonAnID], [Soluong], [Thanhtien], [Ghichu]) VALUES (21, 13, 0, 18, 1, 15000, N'')
INSERT [dbo].[DonhangChitiets] ([ChitietID], [DonhangID], [CustomerID], [MonAnID], [Soluong], [Thanhtien], [Ghichu]) VALUES (22, 14, 0, 11, 2, 60000, N'')
INSERT [dbo].[DonhangChitiets] ([ChitietID], [DonhangID], [CustomerID], [MonAnID], [Soluong], [Thanhtien], [Ghichu]) VALUES (23, 15, 0, 19, 1, 15000, N'')
INSERT [dbo].[DonhangChitiets] ([ChitietID], [DonhangID], [CustomerID], [MonAnID], [Soluong], [Thanhtien], [Ghichu]) VALUES (24, 15, 0, 20, 1, 20000, N'')
INSERT [dbo].[DonhangChitiets] ([ChitietID], [DonhangID], [CustomerID], [MonAnID], [Soluong], [Thanhtien], [Ghichu]) VALUES (25, 15, 0, 23, 1, 25000, N'')
INSERT [dbo].[DonhangChitiets] ([ChitietID], [DonhangID], [CustomerID], [MonAnID], [Soluong], [Thanhtien], [Ghichu]) VALUES (26, 16, 0, 12, 1, 25000, N'')
INSERT [dbo].[DonhangChitiets] ([ChitietID], [DonhangID], [CustomerID], [MonAnID], [Soluong], [Thanhtien], [Ghichu]) VALUES (27, 16, 0, 18, 1, 15000, N'')
INSERT [dbo].[DonhangChitiets] ([ChitietID], [DonhangID], [CustomerID], [MonAnID], [Soluong], [Thanhtien], [Ghichu]) VALUES (28, 16, 0, 16, 1, 25000, N'')
SET IDENTITY_INSERT [dbo].[DonhangChitiets] OFF
SET IDENTITY_INSERT [dbo].[Donhangs] ON 

INSERT [dbo].[Donhangs] ([DonhangID], [KhachhangID], [Ngaydat], [Tongtien], [TrangthaiDonhang], [Ghichu]) VALUES (4, 1, CAST(N'2021-06-14 15:54:54.1684711' AS DateTime2), 170000, 1, N'')
INSERT [dbo].[Donhangs] ([DonhangID], [KhachhangID], [Ngaydat], [Tongtien], [TrangthaiDonhang], [Ghichu]) VALUES (5, 1, CAST(N'2021-06-14 15:55:06.9547931' AS DateTime2), 15000, 1, N'')
INSERT [dbo].[Donhangs] ([DonhangID], [KhachhangID], [Ngaydat], [Tongtien], [TrangthaiDonhang], [Ghichu]) VALUES (6, 1, CAST(N'2021-06-14 15:55:18.9983434' AS DateTime2), 105000, 1, N'')
INSERT [dbo].[Donhangs] ([DonhangID], [KhachhangID], [Ngaydat], [Tongtien], [TrangthaiDonhang], [Ghichu]) VALUES (7, 1, CAST(N'2021-06-14 15:56:08.7827961' AS DateTime2), 210000, 1, N'')
INSERT [dbo].[Donhangs] ([DonhangID], [KhachhangID], [Ngaydat], [Tongtien], [TrangthaiDonhang], [Ghichu]) VALUES (8, 1, CAST(N'2021-06-14 15:56:16.6051667' AS DateTime2), 25000, 1, N'')
INSERT [dbo].[Donhangs] ([DonhangID], [KhachhangID], [Ngaydat], [Tongtien], [TrangthaiDonhang], [Ghichu]) VALUES (9, 1, CAST(N'2021-06-14 15:56:29.0339787' AS DateTime2), 55000, 1, N'')
INSERT [dbo].[Donhangs] ([DonhangID], [KhachhangID], [Ngaydat], [Tongtien], [TrangthaiDonhang], [Ghichu]) VALUES (10, 5, CAST(N'2021-06-16 10:16:29.7681819' AS DateTime2), 60000, 1, N'')
INSERT [dbo].[Donhangs] ([DonhangID], [KhachhangID], [Ngaydat], [Tongtien], [TrangthaiDonhang], [Ghichu]) VALUES (11, 5, CAST(N'2021-06-16 12:13:07.8115301' AS DateTime2), 150000, 1, N'')
INSERT [dbo].[Donhangs] ([DonhangID], [KhachhangID], [Ngaydat], [Tongtien], [TrangthaiDonhang], [Ghichu]) VALUES (12, 5, CAST(N'2021-06-16 14:18:09.9757052' AS DateTime2), 60000, 1, N'')
INSERT [dbo].[Donhangs] ([DonhangID], [KhachhangID], [Ngaydat], [Tongtien], [TrangthaiDonhang], [Ghichu]) VALUES (13, 5, CAST(N'2021-06-16 14:18:54.2445158' AS DateTime2), 30000, 1, N'')
INSERT [dbo].[Donhangs] ([DonhangID], [KhachhangID], [Ngaydat], [Tongtien], [TrangthaiDonhang], [Ghichu]) VALUES (14, 3, CAST(N'2021-06-16 19:59:02.7982515' AS DateTime2), 60000, 1, N'')
INSERT [dbo].[Donhangs] ([DonhangID], [KhachhangID], [Ngaydat], [Tongtien], [TrangthaiDonhang], [Ghichu]) VALUES (15, 6, CAST(N'2021-06-16 19:59:33.9172171' AS DateTime2), 60000, 1, N'')
INSERT [dbo].[Donhangs] ([DonhangID], [KhachhangID], [Ngaydat], [Tongtien], [TrangthaiDonhang], [Ghichu]) VALUES (16, 5, CAST(N'2021-06-16 20:00:03.1198866' AS DateTime2), 65000, 1, N'')
SET IDENTITY_INSERT [dbo].[Donhangs] OFF
SET IDENTITY_INSERT [dbo].[Khachhangs] ON 

INSERT [dbo].[Khachhangs] ([KhachhangID], [FullName], [Ngaysinh], [PhoneNumber], [Password], [ConfirmPassword], [Mota], [Address], [Email]) VALUES (1, N'Hồ Mạnh Dũng', CAST(N'2021-06-13 22:17:00.0000000' AS DateTime2), N'0396313488', N'A6D36A6D82CBA68BA5A770F360AD8F8A', N'A6D36A6D82CBA68BA5A770F360AD8F8A', N'hihi', N'217/14 Thích Quảng Đức nối dài', N'dunghm2408@gmail.com')
INSERT [dbo].[Khachhangs] ([KhachhangID], [FullName], [Ngaysinh], [PhoneNumber], [Password], [ConfirmPassword], [Mota], [Address], [Email]) VALUES (2, N'Van', CAST(N'2021-06-13 23:45:00.0000000' AS DateTime2), N'0396313488', N'202CB962AC59075B964B07152D234B70', N'202CB962AC59075B964B07152D234B70', N'x', N'217/14 Thích Quảng Đức nối dài', N'van@gmail.com')
INSERT [dbo].[Khachhangs] ([KhachhangID], [FullName], [Ngaysinh], [PhoneNumber], [Password], [ConfirmPassword], [Mota], [Address], [Email]) VALUES (3, N'My phạm', CAST(N'2021-06-14 15:57:00.0000000' AS DateTime2), N'0361578521', N'C4CA4238A0B923820DCC509A6F75849B', N'C4CA4238A0B923820DCC509A6F75849B', N'a', N'321 Lê Quang Đinh', N'my@gmail.com')
INSERT [dbo].[Khachhangs] ([KhachhangID], [FullName], [Ngaysinh], [PhoneNumber], [Password], [ConfirmPassword], [Mota], [Address], [Email]) VALUES (4, N'Hùng Mạnh Dỗ', CAST(N'2021-06-14 15:58:00.0000000' AS DateTime2), N'0369851322', N'C4CA4238A0B923820DCC509A6F75849B', N'C4CA4238A0B923820DCC509A6F75849B', N'abc', N'36/25/5 Võ Thị Sáu ', N'hung@gmail.com')
INSERT [dbo].[Khachhangs] ([KhachhangID], [FullName], [Ngaysinh], [PhoneNumber], [Password], [ConfirmPassword], [Mota], [Address], [Email]) VALUES (5, N'Vân Tôn', CAST(N'2021-06-15 15:37:00.0000000' AS DateTime2), N'0334178246', N'C4CA4238A0B923820DCC509A6F75849B', N'C4CA4238A0B923820DCC509A6F75849B', N'bvds', N'102 Quang Trung', N'vanton@gmail.com')
INSERT [dbo].[Khachhangs] ([KhachhangID], [FullName], [Ngaysinh], [PhoneNumber], [Password], [ConfirmPassword], [Mota], [Address], [Email]) VALUES (6, N'Chinh chu', CAST(N'2021-06-16 19:51:00.0000000' AS DateTime2), N'0361326585', N'C4CA4238A0B923820DCC509A6F75849B', N'C4CA4238A0B923820DCC509A6F75849B', N'vbsdvs', N'223 Trường Chinh', N'chinhchu@gmail.com')
SET IDENTITY_INSERT [dbo].[Khachhangs] OFF
SET IDENTITY_INSERT [dbo].[MonAns] ON 

INSERT [dbo].[MonAns] ([MonAnID], [Name], [Gia], [Phanloai], [Hinh], [Mota], [Trangthai]) VALUES (11, N'Ba chỉ cháy cạnh', 30000, 1, N'bachi.jpg', N'Ngon', 1)
INSERT [dbo].[MonAns] ([MonAnID], [Name], [Gia], [Phanloai], [Hinh], [Mota], [Trangthai]) VALUES (12, N'Dưa xào tóp mỡ', 25000, 1, N'duaxao.jpg', N'Ngon', 1)
INSERT [dbo].[MonAns] ([MonAnID], [Name], [Gia], [Phanloai], [Hinh], [Mota], [Trangthai]) VALUES (14, N'Gà xào hạt điều', 30000, 1, N'gaoxao.jpg', N'Ngon', 1)
INSERT [dbo].[MonAns] ([MonAnID], [Name], [Gia], [Phanloai], [Hinh], [Mota], [Trangthai]) VALUES (15, N'Tôm mũ ni muối ớt', 50000, 1, N'tomuni.jpg', N'Ngon', 1)
INSERT [dbo].[MonAns] ([MonAnID], [Name], [Gia], [Phanloai], [Hinh], [Mota], [Trangthai]) VALUES (16, N'Gan cháy tỏi', 25000, 1, N'ganchaytoi.jpg', N'Ngon', 1)
INSERT [dbo].[MonAns] ([MonAnID], [Name], [Gia], [Phanloai], [Hinh], [Mota], [Trangthai]) VALUES (18, N'Nước mía', 15000, 3, N'nuocmia.jpg', N'Ngon', 1)
INSERT [dbo].[MonAns] ([MonAnID], [Name], [Gia], [Phanloai], [Hinh], [Mota], [Trangthai]) VALUES (19, N'Cafe sữa đá', 15000, 3, N'caphesua.jpg', N'Ngon', 1)
INSERT [dbo].[MonAns] ([MonAnID], [Name], [Gia], [Phanloai], [Hinh], [Mota], [Trangthai]) VALUES (20, N'Gỏi cuốn ', 20000, 1, N'goicuon.jpg', N'Ngon', 1)
INSERT [dbo].[MonAns] ([MonAnID], [Name], [Gia], [Phanloai], [Hinh], [Mota], [Trangthai]) VALUES (21, N'Cafe trứng', 25000, 3, N'cafetrung.jpg', N'Ngon', 1)
INSERT [dbo].[MonAns] ([MonAnID], [Name], [Gia], [Phanloai], [Hinh], [Mota], [Trangthai]) VALUES (23, N'Bánh xèo', 25000, 1, N'banhxeo.jpg', N'Ngon', 1)
SET IDENTITY_INSERT [dbo].[MonAns] OFF
SET IDENTITY_INSERT [dbo].[Nguoidungs] ON 

INSERT [dbo].[Nguoidungs] ([NguoidungID], [UserName], [FullName], [Email], [Title], [DOB], [Admin], [Locked], [Password]) VALUES (1, N'phuongdung', N'NguyenPhuongDung', N'phuongdung@gmail.com', N'Quản Lý', CAST(N'2000-02-02 00:00:00.0000000' AS DateTime2), 1, 1, N'c4ca4238a0b923820dcc509a6f75849b')
SET IDENTITY_INSERT [dbo].[Nguoidungs] OFF
/****** Object:  Index [IX_DonhangChitiets_DonhangID]    Script Date: 6/21/2021 9:53:21 AM ******/
CREATE NONCLUSTERED INDEX [IX_DonhangChitiets_DonhangID] ON [dbo].[DonhangChitiets]
(
	[DonhangID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_DonhangChitiets_MonAnID]    Script Date: 6/21/2021 9:53:21 AM ******/
CREATE NONCLUSTERED INDEX [IX_DonhangChitiets_MonAnID] ON [dbo].[DonhangChitiets]
(
	[MonAnID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Donhangs_KhachhangID]    Script Date: 6/21/2021 9:53:21 AM ******/
CREATE NONCLUSTERED INDEX [IX_Donhangs_KhachhangID] ON [dbo].[Donhangs]
(
	[KhachhangID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DonhangChitiets]  WITH CHECK ADD  CONSTRAINT [FK_DonhangChitiets_Donhangs_DonhangID] FOREIGN KEY([DonhangID])
REFERENCES [dbo].[Donhangs] ([DonhangID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DonhangChitiets] CHECK CONSTRAINT [FK_DonhangChitiets_Donhangs_DonhangID]
GO
ALTER TABLE [dbo].[DonhangChitiets]  WITH CHECK ADD  CONSTRAINT [FK_DonhangChitiets_MonAns_MonAnID] FOREIGN KEY([MonAnID])
REFERENCES [dbo].[MonAns] ([MonAnID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DonhangChitiets] CHECK CONSTRAINT [FK_DonhangChitiets_MonAns_MonAnID]
GO
ALTER TABLE [dbo].[Donhangs]  WITH CHECK ADD  CONSTRAINT [FK_Donhangs_Khachhangs_KhachhangID] FOREIGN KEY([KhachhangID])
REFERENCES [dbo].[Khachhangs] ([KhachhangID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Donhangs] CHECK CONSTRAINT [FK_Donhangs_Khachhangs_KhachhangID]
GO
USE [master]
GO
ALTER DATABASE [ASM_C5] SET  READ_WRITE 
GO
