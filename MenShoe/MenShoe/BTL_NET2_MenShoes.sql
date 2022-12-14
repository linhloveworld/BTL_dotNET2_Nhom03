USE [master]
GO
/****** Object:  Database [BTL_NET2_MenShoes]    Script Date: 14-Dec-22 6:04:24 PM ******/
CREATE DATABASE [BTL_NET2_MenShoes] ON  PRIMARY 
( NAME = N'MenShoes', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.LINH\MSSQL\DATA\MenShoes.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MenShoes_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.LINH\MSSQL\DATA\MenShoes_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BTL_NET2_MenShoes] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BTL_NET2_MenShoes].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BTL_NET2_MenShoes] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BTL_NET2_MenShoes] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BTL_NET2_MenShoes] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BTL_NET2_MenShoes] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BTL_NET2_MenShoes] SET ARITHABORT OFF 
GO
ALTER DATABASE [BTL_NET2_MenShoes] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BTL_NET2_MenShoes] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BTL_NET2_MenShoes] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BTL_NET2_MenShoes] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BTL_NET2_MenShoes] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BTL_NET2_MenShoes] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BTL_NET2_MenShoes] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BTL_NET2_MenShoes] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BTL_NET2_MenShoes] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BTL_NET2_MenShoes] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BTL_NET2_MenShoes] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BTL_NET2_MenShoes] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BTL_NET2_MenShoes] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BTL_NET2_MenShoes] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BTL_NET2_MenShoes] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BTL_NET2_MenShoes] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BTL_NET2_MenShoes] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BTL_NET2_MenShoes] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BTL_NET2_MenShoes] SET  MULTI_USER 
GO
ALTER DATABASE [BTL_NET2_MenShoes] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BTL_NET2_MenShoes] SET DB_CHAINING OFF 
GO
USE [BTL_NET2_MenShoes]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 14-Dec-22 6:04:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [bigint] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[MetaTitle] [varchar](50) NOT NULL,
	[SeoTitle] [nvarchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [varchar](50) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [varchar](50) NOT NULL,
	[MetaKeywords] [nvarchar](50) NOT NULL,
	[MetaDescriptions] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Colors]    Script Date: 14-Dec-22 6:04:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Colors](
	[ColorID] [bigint] NOT NULL,
	[NameColor] [nvarchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [varchar](50) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Colors] PRIMARY KEY CLUSTERED 
(
	[ColorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 14-Dec-22 6:04:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [bigint] NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[Mobile] [nvarchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [varchar](50) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [varchar](50) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 14-Dec-22 6:04:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [bigint] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CustomerID] [bigint] NOT NULL,
	[ShipName] [nvarchar](50) NOT NULL,
	[ShipAdress] [varchar](50) NOT NULL,
	[ShipEmail] [nvarchar](50) NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 14-Dec-22 6:04:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[ProductID] [bigint] NOT NULL,
	[OrderID] [bigint] NOT NULL,
	[ColorID] [bigint] NOT NULL,
	[SizeID] [bigint] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 14-Dec-22 6:04:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [bigint] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[MetaTitle] [nvarchar](50) NOT NULL,
	[Price] [decimal](18, 0) NOT NULL,
	[PromotionPrice] [decimal](18, 0) NOT NULL,
	[Detail] [text] NOT NULL,
	[Quantity] [int] NOT NULL,
	[CategoryID] [bigint] NOT NULL,
	[ProductCategoryID] [bigint] NOT NULL,
	[Warranty] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [varchar](50) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [varchar](50) NOT NULL,
	[New] [bit] NOT NULL,
	[Image] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Color]    Script Date: 14-Dec-22 6:04:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Color](
	[ProductColorID] [bigint] NOT NULL,
	[ColorID] [bigint] NOT NULL,
	[ProductID] [bigint] NOT NULL,
 CONSTRAINT [PK_Product_Color] PRIMARY KEY CLUSTERED 
(
	[ProductColorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Size]    Script Date: 14-Dec-22 6:04:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Size](
	[ProductSizeID] [bigint] NOT NULL,
	[ProductID] [bigint] NOT NULL,
	[SizeID] [bigint] NOT NULL,
 CONSTRAINT [PK_Product_Size] PRIMARY KEY CLUSTERED 
(
	[ProductSizeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 14-Dec-22 6:04:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[ProductCategoryID] [bigint] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[MetaTitle] [varchar](50) NOT NULL,
	[SeoTitle] [nvarchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [varchar](50) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [varchar](50) NOT NULL,
	[MetaKeywords] [nvarchar](50) NOT NULL,
	[MetaDescriptions] [nchar](10) NOT NULL,
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[ProductCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImage]    Script Date: 14-Dec-22 6:04:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImage](
	[ProductImageID] [bigint] NOT NULL,
	[ImageDetail] [nvarchar](50) NOT NULL,
	[ProductID] [bigint] NOT NULL,
 CONSTRAINT [PK_ProductImage] PRIMARY KEY CLUSTERED 
(
	[ProductImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sizes]    Script Date: 14-Dec-22 6:04:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sizes](
	[SizeID] [bigint] NOT NULL,
	[Number] [int] NOT NULL,
	[Detail] [text] NOT NULL,
 CONSTRAINT [PK_Sizes] PRIMARY KEY CLUSTERED 
(
	[SizeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sysdiagrams]    Script Date: 14-Dec-22 6:04:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sysdiagrams](
	[name] [nvarchar](50) NOT NULL,
	[principal_id] [int] NOT NULL,
	[diagram_id] [int] NOT NULL,
	[version] [int] NOT NULL,
	[definition] [varbinary](max) NOT NULL,
 CONSTRAINT [PK_sysdiagrams] PRIMARY KEY CLUSTERED 
(
	[diagram_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 14-Dec-22 6:04:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [bigint] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[Mobile] [nvarchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [varchar](50) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [varchar](50) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [PK_Table_2]    Script Date: 14-Dec-22 6:04:24 PM ******/
CREATE NONCLUSTERED INDEX [PK_Table_2] ON [dbo].[OrderDetail]
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [BTL_NET2_MenShoes] SET  READ_WRITE 
GO
