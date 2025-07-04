USE [master]
GO
/****** Object:  Database [OnlineShop]    Script Date: 30/06/2025 23:25:12 ******/
CREATE DATABASE [OnlineShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OnlineShop', FILENAME = N'C:\japierdole\SQL Database\OnlineShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OnlineShop_log', FILENAME = N'C:\japierdole\SQL Database\OnlineShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [OnlineShop] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OnlineShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OnlineShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OnlineShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OnlineShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OnlineShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OnlineShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [OnlineShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OnlineShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OnlineShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OnlineShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OnlineShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OnlineShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OnlineShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OnlineShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OnlineShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OnlineShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OnlineShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OnlineShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OnlineShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OnlineShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OnlineShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OnlineShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OnlineShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OnlineShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [OnlineShop] SET  MULTI_USER 
GO
ALTER DATABASE [OnlineShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OnlineShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OnlineShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OnlineShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OnlineShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [OnlineShop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'OnlineShop', N'ON'
GO
ALTER DATABASE [OnlineShop] SET QUERY_STORE = ON
GO
ALTER DATABASE [OnlineShop] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [OnlineShop]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 30/06/2025 23:25:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TItle] [nvarchar](200) NULL,
	[Description] [nvarchar](500) NULL,
	[FullDesc] [nvarchar](4000) NULL,
	[Price] [money] NULL,
	[Discount] [money] NULL,
	[ImageName] [nvarchar](50) NULL,
	[Qty] [int] NULL,
	[Tags] [nvarchar](1000) NULL,
	[VideoUrl] [nvarchar](300) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 30/06/2025 23:25:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[CompanyName] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Comment] [nvarchar](200) NULL,
	[CouponCode] [nvarchar](50) NULL,
	[CouponDiscount] [money] NULL,
	[Shipping] [money] NULL,
	[SubTotal] [money] NULL,
	[Total] [money] NULL,
	[CreateDate] [datetime] NULL,
	[TransId] [nvarchar](200) NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 30/06/2025 23:25:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductTitle] [nvarchar](200) NOT NULL,
	[ProductPrice] [money] NOT NULL,
	[Count] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[BestSellingTemp]    Script Date: 30/06/2025 23:25:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[BestSellingTemp]
AS
SELECT      dbo.OrderDetails.ProductId, dbo.OrderDetails.Count, dbo.Products.TItle, dbo.Products.Price, dbo.Products.Discount, dbo.Products.ImageName, dbo.Products.Qty, dbo.OrderDetails.OrderId, dbo.[Order].Status
FROM         dbo.Products INNER JOIN
                   dbo.OrderDetails ON dbo.Products.Id = dbo.OrderDetails.ProductId LEFT OUTER JOIN
                   dbo.[Order] ON dbo.OrderDetails.OrderId = dbo.[Order].Id
WHERE      (dbo.[Order].Status = N'approved')
GO
/****** Object:  View [dbo].[BestSellingFinal]    Script Date: 30/06/2025 23:25:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[BestSellingFinal]
AS
SELECT      TOP (8) ProductId, SUM(Count) AS TotalSum, TItle, Price, Discount, ImageName, Qty, Status
FROM         dbo.BestSellingTemp
GROUP BY ProductId, TItle, Price, Discount, ImageName, Qty, Status
ORDER BY TotalSum DESC
GO
/****** Object:  Table [dbo].[Banner]    Script Date: 30/06/2025 23:25:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banner](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) NULL,
	[SubTitle] [nvarchar](1000) NULL,
	[ImageName] [nvarchar](50) NULL,
	[Priority] [smallint] NULL,
	[Link] [nvarchar](100) NULL,
	[Position] [nvarchar](50) NULL,
 CONSTRAINT [PK_Banner] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 30/06/2025 23:25:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[CommentText] [nvarchar](1000) NOT NULL,
	[ProductId] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Coupon]    Script Date: 30/06/2025 23:25:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coupon](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Discount] [money] NOT NULL,
 CONSTRAINT [PK_Coupon] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menus]    Script Date: 30/06/2025 23:25:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MenuTitle] [nvarchar](50) NULL,
	[Link] [nvarchar](300) NULL,
	[Type] [nvarchar](20) NULL,
 CONSTRAINT [PK_Menus] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductGallery]    Script Date: 30/06/2025 23:25:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductGallery](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[ImageName] [nvarchar](50) NULL,
 CONSTRAINT [PK_ProductGalery] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Settings]    Script Date: 30/06/2025 23:25:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Settings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Shipping] [money] NULL,
	[Title] [nvarchar](100) NULL,
	[Address] [nvarchar](500) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[CopyRight] [nvarchar](100) NULL,
	[Instagram] [nvarchar](100) NULL,
	[FaceBook] [nvarchar](100) NULL,
	[GooglePlus] [nvarchar](100) NULL,
	[Youtube] [nvarchar](100) NULL,
	[Twitter] [nvarchar](100) NULL,
	[Logo] [nvarchar](50) NULL,
 CONSTRAINT [PK_Settings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 30/06/2025 23:25:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[IsAdmin] [bit] NOT NULL,
	[RegisterDate] [datetime] NULL,
	[RecoveryCode] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Banner] ON 

INSERT [dbo].[Banner] ([ID], [Title], [SubTitle], [ImageName], [Priority], [Link], [Position]) VALUES (5, N'fashion trend for autum
 mans with vibes', N'We love seeing how 
our Aslam wearers like ', N'edbd2ad8-51a0-4292-b017-f208c8703c34.jpg', 1, N'About.html', N'Slider')
INSERT [dbo].[Banner] ([ID], [Title], [SubTitle], [ImageName], [Priority], [Link], [Position]) VALUES (6, N'Zara Pattern
backpacks', N'Stretch, fresh-cool help you alway ', N'8615dc24-bbda-4587-ac19-70dc09d8e965.jpg', 1, N'About.html', N'Banner1')
INSERT [dbo].[Banner] ([ID], [Title], [SubTitle], [ImageName], [Priority], [Link], [Position]) VALUES (7, N'Minimalist  sneaker', N'Stretch, fresh-cool help you alway ', N'88024d7c-6cef-4109-befb-4441889920c3.jpg', 2, NULL, N'Banner1')
INSERT [dbo].[Banner] ([ID], [Title], [SubTitle], [ImageName], [Priority], [Link], [Position]) VALUES (8, N'Basic 
Color Caps', N'Minimalist never cool, 
choose and make ', N'446b8fdb-20d4-4aaa-9ac4-88f0d236ed9f.jpg', 1, N'About.html', N'Banner2')
INSERT [dbo].[Banner] ([ID], [Title], [SubTitle], [ImageName], [Priority], [Link], [Position]) VALUES (21, N'50% OFF
FOR AUTUMN', N'Stretch, fresh-cool help you
 always comfortable', N'74faa625-ede9-4b4c-9f32-1770ac7ac4cb.jpg', 2, NULL, N'Banner2')
INSERT [dbo].[Banner] ([ID], [Title], [SubTitle], [ImageName], [Priority], [Link], [Position]) VALUES (24, N'fashion trend for ', N'autum mans with vibes', N'89cf7e42-4d74-4d2b-bdb2-3422bee34b91.jpg', 2, N'Blog.html', N'Slider')
INSERT [dbo].[Banner] ([ID], [Title], [SubTitle], [ImageName], [Priority], [Link], [Position]) VALUES (25, N'ddd fff', N'dsff hjgh jg hjg', N'5eb28500-ac6a-4f30-8409-baf98acf2f7b.jpg', 3, N'Blog.html', N'Slider')
SET IDENTITY_INSERT [dbo].[Banner] OFF
GO
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([Id], [Name], [Email], [CommentText], [ProductId], [CreateDate]) VALUES (1, N'Bob', N'test@yahoo.com', N'test test test test test test', 13, CAST(N'2024-12-10T10:00:00.000' AS DateTime))
INSERT [dbo].[Comment] ([Id], [Name], [Email], [CommentText], [ProductId], [CreateDate]) VALUES (3, N'Sara', N'test2@gmail.com', N'my my my', 9, CAST(N'2024-10-14T20:20:00.000' AS DateTime))
INSERT [dbo].[Comment] ([Id], [Name], [Email], [CommentText], [ProductId], [CreateDate]) VALUES (4, N'Alex', N'test3@gmail.com', N'text text text', 3, CAST(N'2024-11-29T23:01:00.000' AS DateTime))
INSERT [dbo].[Comment] ([Id], [Name], [Email], [CommentText], [ProductId], [CreateDate]) VALUES (5, N'Bob', N'test4@gmail.com', N'Your email address will not be published', 9, CAST(N'2024-07-26T02:09:58.023' AS DateTime))
INSERT [dbo].[Comment] ([Id], [Name], [Email], [CommentText], [ProductId], [CreateDate]) VALUES (7, N'Alex', N'alex@yahoo.com', N'eee rrrrrrrrrr', 3, CAST(N'2024-07-26T02:14:25.617' AS DateTime))
INSERT [dbo].[Comment] ([Id], [Name], [Email], [CommentText], [ProductId], [CreateDate]) VALUES (8, N'shduhgdsgsjl', N'cos@gmail.com', N'Ten tego
testetestetete', 13, CAST(N'2025-06-26T22:03:37.660' AS DateTime))
SET IDENTITY_INSERT [dbo].[Comment] OFF
GO
SET IDENTITY_INSERT [dbo].[Coupon] ON 

INSERT [dbo].[Coupon] ([Id], [Code], [Discount]) VALUES (1, N'Free2024', 10.0000)
SET IDENTITY_INSERT [dbo].[Coupon] OFF
GO
SET IDENTITY_INSERT [dbo].[Menus] ON 

INSERT [dbo].[Menus] ([ID], [MenuTitle], [Link], [Type]) VALUES (1, N'Home', N'/', N'Top')
INSERT [dbo].[Menus] ([ID], [MenuTitle], [Link], [Type]) VALUES (2, N'Shop', N'/products', N'Top')
INSERT [dbo].[Menus] ([ID], [MenuTitle], [Link], [Type]) VALUES (3, N'Home', N'index.html', N'Bottom')
INSERT [dbo].[Menus] ([ID], [MenuTitle], [Link], [Type]) VALUES (6, N'Shopping Cart', N'/Cart', N'Top')
INSERT [dbo].[Menus] ([ID], [MenuTitle], [Link], [Type]) VALUES (10, N'Shop', N'/products', N'Bottom')
INSERT [dbo].[Menus] ([ID], [MenuTitle], [Link], [Type]) VALUES (11, N'Checkout', N'/Cart/Checkout', N'Top')
SET IDENTITY_INSERT [dbo].[Menus] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Id], [UserId], [FirstName], [LastName], [CompanyName], [Country], [Address], [City], [Email], [Phone], [Comment], [CouponCode], [CouponDiscount], [Shipping], [SubTotal], [Total], [CreateDate], [TransId], [Status]) VALUES (1, 5, N'fn', N'ln', N'aaaa', N'2', N'ad', N'tw', N'Sara3@yahoo.com', N'22222', N'ccccccc', NULL, NULL, 20.0000, 298.0000, 318.0000, CAST(N'2024-08-21T02:56:58.947' AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([Id], [UserId], [FirstName], [LastName], [CompanyName], [Country], [Address], [City], [Email], [Phone], [Comment], [CouponCode], [CouponDiscount], [Shipping], [SubTotal], [Total], [CreateDate], [TransId], [Status]) VALUES (2, 5, N'fn1', N'ln1', N'aaaa', N'2', N'ad', N'tw', N'Sara3@yahoo.com', N'22222', N'ccccc', N'Free2024', 10.0000, 20.0000, 23.0000, 33.0000, CAST(N'2024-08-21T03:04:38.460' AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([Id], [UserId], [FirstName], [LastName], [CompanyName], [Country], [Address], [City], [Email], [Phone], [Comment], [CouponCode], [CouponDiscount], [Shipping], [SubTotal], [Total], [CreateDate], [TransId], [Status]) VALUES (3, 5, N'fn3', N'ln3', N'aaaa3', N'2', N'ad', N'tw', N'Sara3@yahoo.com', N'22222', NULL, NULL, NULL, 20.0000, 23.0000, 43.0000, CAST(N'2024-08-22T17:54:41.853' AS DateTime), N'8M015654GX169600X', N'approved')
INSERT [dbo].[Order] ([Id], [UserId], [FirstName], [LastName], [CompanyName], [Country], [Address], [City], [Email], [Phone], [Comment], [CouponCode], [CouponDiscount], [Shipping], [SubTotal], [Total], [CreateDate], [TransId], [Status]) VALUES (4, 4, N'fn4', N'ln4', N'aaaa4', N'2', N'ad', N'tw', N'Sara3@yahoo.com', N'22222', NULL, NULL, NULL, 20.0000, 23.0000, 43.0000, CAST(N'2024-08-22T18:58:44.627' AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([Id], [UserId], [FirstName], [LastName], [CompanyName], [Country], [Address], [City], [Email], [Phone], [Comment], [CouponCode], [CouponDiscount], [Shipping], [SubTotal], [Total], [CreateDate], [TransId], [Status]) VALUES (5, 4, N'fn6', N'ln6', N'aaaa', N'2', N'ad', N'tw', N'Sara3@yahoo.com', N'22222', NULL, NULL, NULL, 20.0000, 23.0000, 43.0000, CAST(N'2024-08-24T23:20:26.150' AS DateTime), N'57K86196WL2334315', N'approved')
INSERT [dbo].[Order] ([Id], [UserId], [FirstName], [LastName], [CompanyName], [Country], [Address], [City], [Email], [Phone], [Comment], [CouponCode], [CouponDiscount], [Shipping], [SubTotal], [Total], [CreateDate], [TransId], [Status]) VALUES (6, 4, N'fn7', N'ln', N'aaaa', N'2', N'ad', N'tw', N'Sara3@yahoo.com', N'22222', NULL, NULL, NULL, 20.0000, 23.0000, 43.0000, CAST(N'2024-08-24T23:36:18.273' AS DateTime), N'7TJ39240LF385102X', N'approved')
INSERT [dbo].[Order] ([Id], [UserId], [FirstName], [LastName], [CompanyName], [Country], [Address], [City], [Email], [Phone], [Comment], [CouponCode], [CouponDiscount], [Shipping], [SubTotal], [Total], [CreateDate], [TransId], [Status]) VALUES (8, 5, N'fn88', N'ln', N'aaaa', N'2', N'ad', N'tw', N'Sara3@yahoo.com', N'22222', NULL, NULL, NULL, 20.0000, 8.0000, 28.0000, CAST(N'2024-08-24T23:41:25.410' AS DateTime), N'9EH845236T3229010', N'approved')
INSERT [dbo].[Order] ([Id], [UserId], [FirstName], [LastName], [CompanyName], [Country], [Address], [City], [Email], [Phone], [Comment], [CouponCode], [CouponDiscount], [Shipping], [SubTotal], [Total], [CreateDate], [TransId], [Status]) VALUES (9, 5, N'fn888', N'ln', N'aaaa', N'2', N'ad', N'tw', N'Sara3@yahoo.com', N'22222', NULL, NULL, NULL, 20.0000, 55000.0000, 55020.0000, CAST(N'2024-08-24T23:45:05.077' AS DateTime), N'6BY22391AF3529831', N'approved')
INSERT [dbo].[Order] ([Id], [UserId], [FirstName], [LastName], [CompanyName], [Country], [Address], [City], [Email], [Phone], [Comment], [CouponCode], [CouponDiscount], [Shipping], [SubTotal], [Total], [CreateDate], [TransId], [Status]) VALUES (10, 4, N'fn9', N'ln', N'aaaa', N'2', N'ad', N'tw', N'Sara3@yahoo.com', N'22222', NULL, NULL, NULL, 20.0000, 70.0000, 90.0000, CAST(N'2024-09-04T23:37:56.813' AS DateTime), N'2HY80633GK258331V', N'approved')
INSERT [dbo].[Order] ([Id], [UserId], [FirstName], [LastName], [CompanyName], [Country], [Address], [City], [Email], [Phone], [Comment], [CouponCode], [CouponDiscount], [Shipping], [SubTotal], [Total], [CreateDate], [TransId], [Status]) VALUES (11, 4, N'fn10', N'ln', N'aaaa', N'2', N'ad', N'tw', N'Sara3@yahoo.com', N'22222', NULL, NULL, NULL, 20.0000, 15.0000, 35.0000, CAST(N'2024-09-05T00:24:23.637' AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([Id], [UserId], [FirstName], [LastName], [CompanyName], [Country], [Address], [City], [Email], [Phone], [Comment], [CouponCode], [CouponDiscount], [Shipping], [SubTotal], [Total], [CreateDate], [TransId], [Status]) VALUES (12, 4, N'fn12', N'ln', N'aaaa', N'2', N'ad', N'tw', N'Sara3@yahoo.com', N'22222', NULL, NULL, NULL, 20.0000, 15.0000, 35.0000, CAST(N'2024-09-05T00:34:17.490' AS DateTime), N'2TA25461J9959382L', N'approved')
INSERT [dbo].[Order] ([Id], [UserId], [FirstName], [LastName], [CompanyName], [Country], [Address], [City], [Email], [Phone], [Comment], [CouponCode], [CouponDiscount], [Shipping], [SubTotal], [Total], [CreateDate], [TransId], [Status]) VALUES (13, 4, N'fn14', N'ln14', N'aaaa', N'2', N'ad', N'tw', N'Sara3@yahoo.com', N'22222', NULL, NULL, NULL, 20.0000, 108.0000, 128.0000, CAST(N'2024-09-22T19:50:47.247' AS DateTime), NULL, NULL)
INSERT [dbo].[Order] ([Id], [UserId], [FirstName], [LastName], [CompanyName], [Country], [Address], [City], [Email], [Phone], [Comment], [CouponCode], [CouponDiscount], [Shipping], [SubTotal], [Total], [CreateDate], [TransId], [Status]) VALUES (14, 10, N'aegsdfg', N'sdfhsdfg', NULL, N'2', N'dfshbv', N'sehdbgv', N'kubus115@o2.pl', N'501607237', NULL, NULL, NULL, 20.0000, 865.7800, 885.7800, CAST(N'2025-06-30T23:22:47.367' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([Id], [ProductTitle], [ProductPrice], [Count], [OrderId], [ProductId]) VALUES (1, N'Black White Simple Sneaker	', 55.0000, 5, 1, 3)
INSERT [dbo].[OrderDetails] ([Id], [ProductTitle], [ProductPrice], [Count], [OrderId], [ProductId]) VALUES (2, N'Red Simple Sneaker	', 8.0000, 1, 1, 9)
INSERT [dbo].[OrderDetails] ([Id], [ProductTitle], [ProductPrice], [Count], [OrderId], [ProductId]) VALUES (3, N'Green Simple Sneaker ', 15.0000, 1, 1, 10)
INSERT [dbo].[OrderDetails] ([Id], [ProductTitle], [ProductPrice], [Count], [OrderId], [ProductId]) VALUES (4, N'Red Simple Sneaker	', 8.0000, 1, 2, 9)
INSERT [dbo].[OrderDetails] ([Id], [ProductTitle], [ProductPrice], [Count], [OrderId], [ProductId]) VALUES (5, N'Green Simple Sneaker ', 15.0000, 1, 2, 10)
INSERT [dbo].[OrderDetails] ([Id], [ProductTitle], [ProductPrice], [Count], [OrderId], [ProductId]) VALUES (6, N'Red Simple Sneaker	', 8.0000, 1, 3, 9)
INSERT [dbo].[OrderDetails] ([Id], [ProductTitle], [ProductPrice], [Count], [OrderId], [ProductId]) VALUES (7, N'Green Simple Sneaker ', 15.0000, 1, 3, 10)
INSERT [dbo].[OrderDetails] ([Id], [ProductTitle], [ProductPrice], [Count], [OrderId], [ProductId]) VALUES (8, N'Red Simple Sneaker	', 8.0000, 1, 4, 9)
INSERT [dbo].[OrderDetails] ([Id], [ProductTitle], [ProductPrice], [Count], [OrderId], [ProductId]) VALUES (9, N'Green Simple Sneaker ', 15.0000, 1, 4, 10)
INSERT [dbo].[OrderDetails] ([Id], [ProductTitle], [ProductPrice], [Count], [OrderId], [ProductId]) VALUES (10, N'Red Simple Sneaker	', 8.0000, 1, 5, 9)
INSERT [dbo].[OrderDetails] ([Id], [ProductTitle], [ProductPrice], [Count], [OrderId], [ProductId]) VALUES (11, N'Green Simple Sneaker ', 15.0000, 1, 5, 10)
INSERT [dbo].[OrderDetails] ([Id], [ProductTitle], [ProductPrice], [Count], [OrderId], [ProductId]) VALUES (12, N'Red Simple Sneaker	', 8.0000, 1, 6, 9)
INSERT [dbo].[OrderDetails] ([Id], [ProductTitle], [ProductPrice], [Count], [OrderId], [ProductId]) VALUES (13, N'Green Simple Sneaker ', 15.0000, 1, 6, 10)
INSERT [dbo].[OrderDetails] ([Id], [ProductTitle], [ProductPrice], [Count], [OrderId], [ProductId]) VALUES (15, N'Red Simple Sneaker	', 8.0000, 1, 8, 9)
INSERT [dbo].[OrderDetails] ([Id], [ProductTitle], [ProductPrice], [Count], [OrderId], [ProductId]) VALUES (16, N'Black White Simple Sneaker	', 55.0000, 5, 9, 3)
INSERT [dbo].[OrderDetails] ([Id], [ProductTitle], [ProductPrice], [Count], [OrderId], [ProductId]) VALUES (17, N'Black White Simple Sneaker	', 55.0000, 1, 10, 3)
INSERT [dbo].[OrderDetails] ([Id], [ProductTitle], [ProductPrice], [Count], [OrderId], [ProductId]) VALUES (18, N'Green Simple Sneaker ', 15.0000, 1, 10, 10)
INSERT [dbo].[OrderDetails] ([Id], [ProductTitle], [ProductPrice], [Count], [OrderId], [ProductId]) VALUES (19, N'Green Simple Sneaker ', 15.0000, 1, 11, 10)
INSERT [dbo].[OrderDetails] ([Id], [ProductTitle], [ProductPrice], [Count], [OrderId], [ProductId]) VALUES (20, N'Green Simple Sneaker ', 15.0000, 1, 12, 10)
INSERT [dbo].[OrderDetails] ([Id], [ProductTitle], [ProductPrice], [Count], [OrderId], [ProductId]) VALUES (21, N'Black White Simple Sneaker	', 55.0000, 1, 13, 3)
INSERT [dbo].[OrderDetails] ([Id], [ProductTitle], [ProductPrice], [Count], [OrderId], [ProductId]) VALUES (22, N'Red Simple Sneaker	', 8.0000, 1, 13, 9)
INSERT [dbo].[OrderDetails] ([Id], [ProductTitle], [ProductPrice], [Count], [OrderId], [ProductId]) VALUES (23, N'Green Simple Sneaker ', 15.0000, 3, 13, 10)
INSERT [dbo].[OrderDetails] ([Id], [ProductTitle], [ProductPrice], [Count], [OrderId], [ProductId]) VALUES (24, N'Intel Core i9-13900K', 865.7800, 1, 14, 13)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductGallery] ON 

INSERT [dbo].[ProductGallery] ([Id], [ProductId], [ImageName]) VALUES (39, 13, N'13900k_1.jpg')
INSERT [dbo].[ProductGallery] ([Id], [ProductId], [ImageName]) VALUES (40, 13, N'13900k_2.jpg')
INSERT [dbo].[ProductGallery] ([Id], [ProductId], [ImageName]) VALUES (41, 14, N'7950X_1.jpg')
SET IDENTITY_INSERT [dbo].[ProductGallery] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [TItle], [Description], [FullDesc], [Price], [Discount], [ImageName], [Qty], [Tags], [VideoUrl]) VALUES (13, N'Intel Core i9-13900K', N'24-core CPU for extreme performance', N'Flagship Intel 13th-gen processor with 24 cores (8P+16E) and high overclocking headroom. Perfect for gaming, content creation, and demanding multitasking workloads.', 920.2200, 54.4400, N'13900kthumbnail.jpg', 44, N'CPU', NULL)
INSERT [dbo].[Products] ([Id], [TItle], [Description], [FullDesc], [Price], [Discount], [ImageName], [Qty], [Tags], [VideoUrl]) VALUES (14, N'AMD Ryzen 9 7950X', N'	16-core CPU for productivity and gaming', N'High-end AMD Zen 4 processor with 16 cores and 32 threads, ideal for advanced multitasking, 3D rendering, and enthusiast gaming. PCIe 5.0 and DDR5 support included.', 1081.7900, 88.7600, N'Thumbnail7950X.jpg', 9, N'CPU', NULL)
INSERT [dbo].[Products] ([Id], [TItle], [Description], [FullDesc], [Price], [Discount], [ImageName], [Qty], [Tags], [VideoUrl]) VALUES (15, N'Intel Core i7-14700F', N'	20-core CPU without integrated graphics', N'Performance Intel 14th-gen chip with 20 cores (8P+12E), ideal for high-end gaming and workloads, lacking integrated GPU for discrete graphics setups.', 243.0600, 12.1100, NULL, 32, N'CPU', NULL)
INSERT [dbo].[Products] ([Id], [TItle], [Description], [FullDesc], [Price], [Discount], [ImageName], [Qty], [Tags], [VideoUrl]) VALUES (16, N'AMD Ryzen 7 7800X3D', N'	8-core CPU with 3D V-Cache for gaming', NULL, 224.8800, 1.0700, NULL, 21, N'CPU', NULL)
INSERT [dbo].[Products] ([Id], [TItle], [Description], [FullDesc], [Price], [Discount], [ImageName], [Qty], [Tags], [VideoUrl]) VALUES (17, N'NVIDIA RTX 4080', NULL, NULL, 296.8000, 12.0800, NULL, 15, N'GPU', NULL)
INSERT [dbo].[Products] ([Id], [TItle], [Description], [FullDesc], [Price], [Discount], [ImageName], [Qty], [Tags], [VideoUrl]) VALUES (18, N'AMD Radeon RX 7900 XTX', NULL, NULL, 1147.8100, 2.5300, NULL, 23, N'GPU', NULL)
INSERT [dbo].[Products] ([Id], [TItle], [Description], [FullDesc], [Price], [Discount], [ImageName], [Qty], [Tags], [VideoUrl]) VALUES (19, N'NVIDIA RTX 4070 Super', NULL, NULL, 901.3500, 72.5500, NULL, 48, N'GPU', NULL)
INSERT [dbo].[Products] ([Id], [TItle], [Description], [FullDesc], [Price], [Discount], [ImageName], [Qty], [Tags], [VideoUrl]) VALUES (20, N'AMD Radeon RX 7700 XT', NULL, NULL, 218.3300, 0.8400, NULL, 10, N'GPU', NULL)
INSERT [dbo].[Products] ([Id], [TItle], [Description], [FullDesc], [Price], [Discount], [ImageName], [Qty], [Tags], [VideoUrl]) VALUES (21, N'Corsair Vengeance DDR5 32GB', NULL, NULL, 1022.3300, 77.5800, NULL, 36, N'RAM', NULL)
INSERT [dbo].[Products] ([Id], [TItle], [Description], [FullDesc], [Price], [Discount], [ImageName], [Qty], [Tags], [VideoUrl]) VALUES (22, N'G.Skill Trident Z5 RGB 32GB', NULL, NULL, 765.3000, 11.6600, NULL, 13, N'RAM', NULL)
INSERT [dbo].[Products] ([Id], [TItle], [Description], [FullDesc], [Price], [Discount], [ImageName], [Qty], [Tags], [VideoUrl]) VALUES (23, N'Kingston Fury Beast DDR5 16GB', NULL, NULL, 767.8000, 47.3300, NULL, 42, N'RAM', NULL)
INSERT [dbo].[Products] ([Id], [TItle], [Description], [FullDesc], [Price], [Discount], [ImageName], [Qty], [Tags], [VideoUrl]) VALUES (24, N'ASUS ROG STRIX Z790-E', NULL, NULL, 463.9700, 34.5000, NULL, 9, N'Motherboard', NULL)
INSERT [dbo].[Products] ([Id], [TItle], [Description], [FullDesc], [Price], [Discount], [ImageName], [Qty], [Tags], [VideoUrl]) VALUES (25, N'MSI MAG B650 TOMAHAWK', NULL, NULL, 232.2400, 7.2600, NULL, 35, N'Motherboard', NULL)
INSERT [dbo].[Products] ([Id], [TItle], [Description], [FullDesc], [Price], [Discount], [ImageName], [Qty], [Tags], [VideoUrl]) VALUES (26, N'Gigabyte X670 AORUS Elite AX', NULL, NULL, 1020.6800, 71.4900, NULL, 34, N'Motherboard', NULL)
INSERT [dbo].[Products] ([Id], [TItle], [Description], [FullDesc], [Price], [Discount], [ImageName], [Qty], [Tags], [VideoUrl]) VALUES (27, N'ASRock B760M Pro RS', NULL, NULL, 620.1800, 9.1800, NULL, 30, N'Motherboard', NULL)
INSERT [dbo].[Products] ([Id], [TItle], [Description], [FullDesc], [Price], [Discount], [ImageName], [Qty], [Tags], [VideoUrl]) VALUES (28, N'Samsung 990 Pro 1TB', NULL, NULL, 359.1000, 15.0600, NULL, 12, N'SSD', NULL)
INSERT [dbo].[Products] ([Id], [TItle], [Description], [FullDesc], [Price], [Discount], [ImageName], [Qty], [Tags], [VideoUrl]) VALUES (29, N'WD Black SN850X 2TB', NULL, NULL, 341.1800, 17.6400, NULL, 19, N'SSD', NULL)
INSERT [dbo].[Products] ([Id], [TItle], [Description], [FullDesc], [Price], [Discount], [ImageName], [Qty], [Tags], [VideoUrl]) VALUES (30, N'Crucial P5 Plus 1TB', NULL, NULL, 431.2000, 6.8400, NULL, 21, N'SSD', NULL)
INSERT [dbo].[Products] ([Id], [TItle], [Description], [FullDesc], [Price], [Discount], [ImageName], [Qty], [Tags], [VideoUrl]) VALUES (31, N'Kingston KC3000 2TB', NULL, NULL, 830.6400, 32.2300, NULL, 5, N'SSD', NULL)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Settings] ON 

INSERT [dbo].[Settings] ([Id], [Shipping], [Title], [Address], [Email], [Phone], [CopyRight], [Instagram], [FaceBook], [GooglePlus], [Youtube], [Twitter], [Logo]) VALUES (1, 20.0000, N'Best Online Shop', N'869 General Village Apt. 645, Moorebury, Usa', N'uthrstore@domain.com', N'+05483716566', N'©2021 Uthr. made with  by HasThemes', N'https://www.instagram.com', N'https://www.facebook.com', N'https://www.google.com', N'https://www.youtube.com', N'https://twitter.com', N'38c29e04-17ec-435e-bd6f-838d59da8f84.png')
SET IDENTITY_INSERT [dbo].[Settings] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [Email], [FullName], [Password], [IsAdmin], [RegisterDate], [RecoveryCode]) VALUES (1, N'alex@yahoo.com', N'Alex', N'3333', 0, CAST(N'2024-07-28T20:16:41.320' AS DateTime), 0)
INSERT [dbo].[User] ([Id], [Email], [FullName], [Password], [IsAdmin], [RegisterDate], [RecoveryCode]) VALUES (2, N'Sara@yahoo.com', N'Alex', N'111', 0, NULL, NULL)
INSERT [dbo].[User] ([Id], [Email], [FullName], [Password], [IsAdmin], [RegisterDate], [RecoveryCode]) VALUES (3, N'jack@gmaail.com', N'Jack', N'3333', 0, NULL, NULL)
INSERT [dbo].[User] ([Id], [Email], [FullName], [Password], [IsAdmin], [RegisterDate], [RecoveryCode]) VALUES (4, N'Sara2@yahoo.com', N'Bob', N'111', 1, NULL, NULL)
INSERT [dbo].[User] ([Id], [Email], [FullName], [Password], [IsAdmin], [RegisterDate], [RecoveryCode]) VALUES (5, N'Sara3@yahoo.com', N'sara3', N'111', 0, CAST(N'2024-07-29T17:50:52.560' AS DateTime), 0)
INSERT [dbo].[User] ([Id], [Email], [FullName], [Password], [IsAdmin], [RegisterDate], [RecoveryCode]) VALUES (6, N'Sara4@yahoo.com', N'111', N'111', 0, CAST(N'2024-07-29T19:55:29.957' AS DateTime), 30657)
INSERT [dbo].[User] ([Id], [Email], [FullName], [Password], [IsAdmin], [RegisterDate], [RecoveryCode]) VALUES (7, N'Sara5@yahoo.com', N'111', N'111', 0, CAST(N'2024-07-29T20:02:36.223' AS DateTime), 0)
INSERT [dbo].[User] ([Id], [Email], [FullName], [Password], [IsAdmin], [RegisterDate], [RecoveryCode]) VALUES (8, N'emailsendertest0055@gmail.com', N'ccc', N'111', 0, CAST(N'2024-08-01T01:37:05.413' AS DateTime), 87000)
INSERT [dbo].[User] ([Id], [Email], [FullName], [Password], [IsAdmin], [RegisterDate], [RecoveryCode]) VALUES (9, N'frdrunszy@mozmail.com', N'Jakub Dziektarz', N'kubus115', 0, CAST(N'2025-06-26T14:26:41.107' AS DateTime), 0)
INSERT [dbo].[User] ([Id], [Email], [FullName], [Password], [IsAdmin], [RegisterDate], [RecoveryCode]) VALUES (10, N'kubus115@o2.pl', N'Jakub Ciekan', N'123', 0, CAST(N'2025-06-30T23:22:22.053' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[10] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "BestSellingTemp"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 321
               Right = 232
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 10
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 1710
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'BestSellingFinal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'BestSellingFinal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[36] 4[30] 2[13] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Order"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 318
               Right = 243
            End
            DisplayFlags = 280
            TopColumn = 9
         End
         Begin Table = "OrderDetails"
            Begin Extent = 
               Top = 14
               Left = 365
               Bottom = 311
               Right = 559
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Products"
            Begin Extent = 
               Top = 13
               Left = 745
               Bottom = 324
               Right = 939
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 10
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 2055
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 2355
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'BestSellingTemp'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'BestSellingTemp'
GO
USE [master]
GO
ALTER DATABASE [OnlineShop] SET  READ_WRITE 
GO
