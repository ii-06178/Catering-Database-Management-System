USE [master]
GO
/****** Object:  Database [cateringSystemDatabase]    Script Date: 11/29/2020 1:33:06 AM ******/
CREATE DATABASE [cateringSystemDatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'cateringSystemDatabase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\cateringSystemDatabase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'cateringSystemDatabase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\cateringSystemDatabase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [cateringSystemDatabase] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [cateringSystemDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [cateringSystemDatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [cateringSystemDatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [cateringSystemDatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [cateringSystemDatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [cateringSystemDatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [cateringSystemDatabase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [cateringSystemDatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [cateringSystemDatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [cateringSystemDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [cateringSystemDatabase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [cateringSystemDatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [cateringSystemDatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [cateringSystemDatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [cateringSystemDatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [cateringSystemDatabase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [cateringSystemDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [cateringSystemDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [cateringSystemDatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [cateringSystemDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [cateringSystemDatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [cateringSystemDatabase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [cateringSystemDatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [cateringSystemDatabase] SET RECOVERY FULL 
GO
ALTER DATABASE [cateringSystemDatabase] SET  MULTI_USER 
GO
ALTER DATABASE [cateringSystemDatabase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [cateringSystemDatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [cateringSystemDatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [cateringSystemDatabase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [cateringSystemDatabase] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'cateringSystemDatabase', N'ON'
GO
ALTER DATABASE [cateringSystemDatabase] SET QUERY_STORE = OFF
GO
USE [cateringSystemDatabase]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 11/29/2020 1:33:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[AdminID] [int] NOT NULL,
	[Name] [varchar](25) NOT NULL,
	[Role] [varchar](20) NULL,
	[Email] [varchar](100) NOT NULL,
	[Password_2] [varchar](50) NOT NULL,
	[DateAdded] [date] NULL,
 CONSTRAINT [PK__Admin__719FE4E859DBF413] PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 11/29/2020 1:33:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoriesID] [int] NOT NULL,
	[CategoryName] [varchar](30) NULL,
	[MeasuredIn] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoriesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 11/29/2020 1:33:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] NOT NULL,
	[CustomerName] [varchar](50) NOT NULL,
	[CustomerContactNo] [varchar](20) NOT NULL,
	[CustomerAddress] [varchar](100) NOT NULL,
	[AlternatePhone] [varchar](20) NULL,
	[Email] [varchar](100) NULL,
	[CreditCardNo] [varchar](20) NULL,
 CONSTRAINT [PK__Customer__A4AE64B849F0DF74] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Deal]    Script Date: 11/29/2020 1:33:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Deal](
	[DealID] [int] NOT NULL,
	[DealPrice] [int] NOT NULL,
	[ValidFrom] [date] NULL,
	[ValidTill] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[DealID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Deal_has_FoodItem]    Script Date: 11/29/2020 1:33:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Deal_has_FoodItem](
	[Deal_DealID] [int] NOT NULL,
	[FoodItem_FoodItemID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Deal_DealID] ASC,
	[FoodItem_FoodItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Deal_has_Orders]    Script Date: 11/29/2020 1:33:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Deal_has_Orders](
	[Deal_DealID] [int] NOT NULL,
	[Orders_OrderID] [int] NOT NULL,
	[NoOfDeals] [int] NULL,
	[UnitPrice] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Deal_DealID] ASC,
	[Orders_OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FoodItem]    Script Date: 11/29/2020 1:33:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoodItem](
	[FoodItemID] [int] NOT NULL,
	[Categories_CategoriesID] [int] NOT NULL,
	[ItemName] [varchar](30) NULL,
	[UnitPrice] [money] NULL,
	[UnitQuantity] [real] NULL,
 CONSTRAINT [PK__FoodItem__464DCBF2E2127545] PRIMARY KEY CLUSTERED 
(
	[FoodItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ingredients]    Script Date: 11/29/2020 1:33:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ingredients](
	[IngredientsID] [int] NOT NULL,
	[IngredientName] [varchar](50) NULL,
	[ItemsInStock] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IngredientsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ingredients_for_FoodItem]    Script Date: 11/29/2020 1:33:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ingredients_for_FoodItem](
	[FoodItem_FoodItemID] [int] NOT NULL,
	[Ingredients_IngredientsID] [int] NOT NULL,
	[Quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[FoodItem_FoodItemID] ASC,
	[Ingredients_IngredientsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderbyItem]    Script Date: 11/29/2020 1:33:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderbyItem](
	[Orders_OrderID] [int] NOT NULL,
	[FoodItem_FoodItemID] [int] NOT NULL,
	[Quantity] [int] NULL,
	[Discount] [int] NULL,
	[UnitPrice] [money] NOT NULL,
	[Weight] [real] NULL,
 CONSTRAINT [PK__OrderbyI__2200BB557250FC91] PRIMARY KEY CLUSTERED 
(
	[Orders_OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 11/29/2020 1:33:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] NOT NULL,
	[Payment_PaymentID] [int] NOT NULL,
	[Region_RegionID] [int] NOT NULL,
	[Rider_RiderID] [int] NULL,
	[Customers_CustomerID] [int] NOT NULL,
	[OrderDate] [date] NOT NULL,
	[RequiredDate] [date] NOT NULL,
	[ShippedDate] [date] NULL,
	[OrderStatus] [varchar](50) NOT NULL,
	[TotalPrice] [money] NULL,
 CONSTRAINT [PK__Orders__C3905BAF8105EB5B] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 11/29/2020 1:33:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[PaymentID] [int] NOT NULL,
	[PaymentType] [varchar](25) NULL,
	[CashReceived] [money] NULL,
	[CashReturned] [money] NULL,
 CONSTRAINT [PK__Payment__9B556A58C5768A1C] PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Region]    Script Date: 11/29/2020 1:33:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Region](
	[RegionID] [int] NOT NULL,
	[RegionDescription] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[RegionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rider]    Script Date: 11/29/2020 1:33:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rider](
	[RiderID] [int] NOT NULL,
	[Region_RegionID] [int] NOT NULL,
	[RiderName] [varchar](50) NOT NULL,
	[RiderPhoneNo] [varchar](20) NOT NULL,
	[RiderCNIC] [varbinary](20) NOT NULL,
	[RiderCompany] [varchar](50) NULL,
	[RiderEmail] [varchar](100) NULL,
	[RiderPassword] [varchar](50) NULL,
 CONSTRAINT [PK__Rider__7D726C000895CBD8] PRIMARY KEY CLUSTERED 
(
	[RiderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WeeklyMenu]    Script Date: 11/29/2020 1:33:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WeeklyMenu](
	[WeeklyMenuID] [int] NOT NULL,
	[WeekDay] [varchar](25) NOT NULL,
	[FoodItem_FoodItemID] [int] NOT NULL,
	[Date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[WeeklyMenuID] ASC,
	[WeekDay] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WeeklyMenu_has_Orders]    Script Date: 11/29/2020 1:33:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WeeklyMenu_has_Orders](
	[WeeklyMenu_WeeklyMenuID] [int] NOT NULL,
	[Orders_OrderID] [int] NOT NULL,
	[WeeklyMenu_WeekDay] [varchar](25) NOT NULL,
	[Quantity] [int] NULL,
	[Discount] [int] NULL,
	[UnitPrice] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[WeeklyMenu_WeeklyMenuID] ASC,
	[Orders_OrderID] ASC,
	[WeeklyMenu_WeekDay] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [Deal_has_FoodItem_FKIndex1]    Script Date: 11/29/2020 1:33:07 AM ******/
CREATE NONCLUSTERED INDEX [Deal_has_FoodItem_FKIndex1] ON [dbo].[Deal_has_FoodItem]
(
	[Deal_DealID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Deal_has_FoodItem_FKIndex2]    Script Date: 11/29/2020 1:33:07 AM ******/
CREATE NONCLUSTERED INDEX [Deal_has_FoodItem_FKIndex2] ON [dbo].[Deal_has_FoodItem]
(
	[FoodItem_FoodItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Deal_has_Orders_FKIndex1]    Script Date: 11/29/2020 1:33:07 AM ******/
CREATE NONCLUSTERED INDEX [Deal_has_Orders_FKIndex1] ON [dbo].[Deal_has_Orders]
(
	[Deal_DealID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Deal_has_Orders_FKIndex2]    Script Date: 11/29/2020 1:33:07 AM ******/
CREATE NONCLUSTERED INDEX [Deal_has_Orders_FKIndex2] ON [dbo].[Deal_has_Orders]
(
	[Orders_OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [FoodItem_FKIndex1]    Script Date: 11/29/2020 1:33:07 AM ******/
CREATE NONCLUSTERED INDEX [FoodItem_FKIndex1] ON [dbo].[FoodItem]
(
	[Categories_CategoriesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [FoodItem_has_Supplies_FKIndex1]    Script Date: 11/29/2020 1:33:07 AM ******/
CREATE NONCLUSTERED INDEX [FoodItem_has_Supplies_FKIndex1] ON [dbo].[Ingredients_for_FoodItem]
(
	[FoodItem_FoodItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [FoodItem_has_Supplies_FKIndex2]    Script Date: 11/29/2020 1:33:07 AM ******/
CREATE NONCLUSTERED INDEX [FoodItem_has_Supplies_FKIndex2] ON [dbo].[Ingredients_for_FoodItem]
(
	[Ingredients_IngredientsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Items_has_Orders_FKIndex2]    Script Date: 11/29/2020 1:33:07 AM ******/
CREATE NONCLUSTERED INDEX [Items_has_Orders_FKIndex2] ON [dbo].[OrderbyItem]
(
	[Orders_OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [OrderbyItem_FKIndex2]    Script Date: 11/29/2020 1:33:07 AM ******/
CREATE NONCLUSTERED INDEX [OrderbyItem_FKIndex2] ON [dbo].[OrderbyItem]
(
	[FoodItem_FoodItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Orders_FKIndex1]    Script Date: 11/29/2020 1:33:07 AM ******/
CREATE NONCLUSTERED INDEX [Orders_FKIndex1] ON [dbo].[Orders]
(
	[Customers_CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Orders_FKIndex2]    Script Date: 11/29/2020 1:33:07 AM ******/
CREATE NONCLUSTERED INDEX [Orders_FKIndex2] ON [dbo].[Orders]
(
	[Rider_RiderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Orders_FKIndex3]    Script Date: 11/29/2020 1:33:07 AM ******/
CREATE NONCLUSTERED INDEX [Orders_FKIndex3] ON [dbo].[Orders]
(
	[Region_RegionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Orders_FKIndex4]    Script Date: 11/29/2020 1:33:07 AM ******/
CREATE NONCLUSTERED INDEX [Orders_FKIndex4] ON [dbo].[Orders]
(
	[Payment_PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Rider_FKIndex1]    Script Date: 11/29/2020 1:33:07 AM ******/
CREATE NONCLUSTERED INDEX [Rider_FKIndex1] ON [dbo].[Rider]
(
	[Region_RegionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [WeeklyMenu_FKIndex1]    Script Date: 11/29/2020 1:33:07 AM ******/
CREATE NONCLUSTERED INDEX [WeeklyMenu_FKIndex1] ON [dbo].[WeeklyMenu]
(
	[FoodItem_FoodItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [WeeklyMenu_has_Orders_FKIndex1]    Script Date: 11/29/2020 1:33:07 AM ******/
CREATE NONCLUSTERED INDEX [WeeklyMenu_has_Orders_FKIndex1] ON [dbo].[WeeklyMenu_has_Orders]
(
	[WeeklyMenu_WeeklyMenuID] ASC,
	[WeeklyMenu_WeekDay] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [WeeklyMenu_has_Orders_FKIndex2]    Script Date: 11/29/2020 1:33:07 AM ******/
CREATE NONCLUSTERED INDEX [WeeklyMenu_has_Orders_FKIndex2] ON [dbo].[WeeklyMenu_has_Orders]
(
	[Orders_OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [cateringSystemDatabase] SET  READ_WRITE 
GO
