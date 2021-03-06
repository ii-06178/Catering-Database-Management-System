USE [master]
GO
/****** Object:  Database [cateringSystemDatabase]    Script Date: 12/7/2020 10:05:09 AM ******/
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
/****** Object:  Table [dbo].[Ingredients_for_FoodItem]    Script Date: 12/7/2020 10:05:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ingredients_for_FoodItem](
	[FoodItem_FoodItemID] [int] NOT NULL,
	[Ingredients_IngredientsID] [int] NOT NULL,
	[Quantity_grams] [real] NULL,
 CONSTRAINT [PK__Ingredie__44018FF01BE7DAD9] PRIMARY KEY CLUSTERED 
(
	[FoodItem_FoodItemID] ASC,
	[Ingredients_IngredientsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ingredients]    Script Date: 12/7/2020 10:05:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ingredients](
	[IngredientsID] [int] NOT NULL,
	[IngredientName] [varchar](50) NULL,
	[QtyInStock_kg] [real] NULL,
 CONSTRAINT [PK__Ingredie__EA22D19033C610A6] PRIMARY KEY CLUSTERED 
(
	[IngredientsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FoodItem]    Script Date: 12/7/2020 10:05:09 AM ******/
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
/****** Object:  View [dbo].[showFoodItemIngredients]    Script Date: 12/7/2020 10:05:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[showFoodItemIngredients]
AS
SELECT f.FoodItemID AS [Item ID], f.ItemName AS [Food Item], i.IngredientName AS Ingredients, fi.Quantity_grams AS [Quantity (grams)]
FROM   dbo.FoodItem AS f INNER JOIN
             dbo.Ingredients_for_FoodItem AS fi ON f.FoodItemID = fi.FoodItem_FoodItemID INNER JOIN
             dbo.Ingredients AS i ON i.IngredientsID = fi.Ingredients_IngredientsID
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 12/7/2020 10:05:09 AM ******/
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
/****** Object:  View [dbo].[showAllFoodItems]    Script Date: 12/7/2020 10:05:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[showAllFoodItems] as select fooditemID as 'ID', itemname as 'Item', categoryname as 'Category', unitquantity as 'Unit Quantity', measuredin as 'Measured In', unitprice as 'Unit Price (Rs.)' from fooditem f inner join categories c on f.Categories_CategoriesID = c.CategoriesID
GO
/****** Object:  View [dbo].[ItemsWithIngrnt]    Script Date: 12/7/2020 10:05:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[ItemsWithIngrnt] as select ingredientsID as 'ID', ingredientName as 'Ingredient', itemName as 'Food Item', quantity_grams as 'Quantity Required (grams)' from ingredients i inner join ingredients_for_fooditem fi on i.ingredientsID = fi.Ingredients_IngredientsID inner join fooditem f on fi.FoodItem_FoodItemID = f.FoodItemID
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 12/7/2020 10:05:09 AM ******/
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
/****** Object:  Table [dbo].[Payment]    Script Date: 12/7/2020 10:05:09 AM ******/
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
/****** Object:  View [dbo].[OrdersDeliveredByRider]    Script Date: 12/7/2020 10:05:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[OrdersDeliveredByRider] as select rider_riderID as 'Rider ID', orderID as 'Order ID',customers_customerID as 'Customer ID', paymentType as 'Payment Type', region_regionID as 'Region ID', orderDate as 'Order Date', requiredDate as 'Required Date', shippedDate as 'Shipped Date', OrderStatus as 'Order Status', totalPrice as 'Total Price/Rs.'  from payment p inner join orders o on p.paymentid = o.payment_paymentid
GO
/****** Object:  Table [dbo].[Rider]    Script Date: 12/7/2020 10:05:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rider](
	[RiderID] [int] NOT NULL,
	[RiderName] [varchar](50) NOT NULL,
	[RiderPhoneNo] [varchar](20) NOT NULL,
	[RiderCNIC] [varchar](50) NOT NULL,
	[RiderCompany] [varchar](50) NULL,
	[RiderEmail] [varchar](100) NOT NULL,
	[RiderPassword] [varchar](50) NOT NULL,
 CONSTRAINT [PK__Rider__7D726C000895CBD8] PRIMARY KEY CLUSTERED 
(
	[RiderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[RiderDeliveredMostOrders]    Script Date: 12/7/2020 10:05:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[RiderDeliveredMostOrders] as select top(1) RiderID, RiderName, RiderPhoneNo, RiderCNIC, RiderCompany, RiderEmail, RiderPassword, count(OrderID) as 'No of Orders Delivered' from rider r inner join orders o on r.riderID = o.Rider_RiderID group by riderID, RiderName, RiderPhoneNo, RiderCNIC, RiderCompany, RiderEmail, RiderPassword
GO
/****** Object:  Table [dbo].[WeeklyMenuItems]    Script Date: 12/7/2020 10:05:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WeeklyMenuItems](
	[WeeklyMenuID] [int] NOT NULL,
	[WeekDay] [varchar](25) NOT NULL,
	[FoodItem_FoodItemID] [int] NOT NULL,
 CONSTRAINT [PK__WeeklyMe__CAFAD8FB80BC7751] PRIMARY KEY CLUSTERED 
(
	[WeeklyMenuID] ASC,
	[WeekDay] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WeeklyMenu]    Script Date: 12/7/2020 10:05:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WeeklyMenu](
	[WeeklyMenuID] [int] NOT NULL,
	[ValidFrom] [date] NOT NULL,
	[ValidTill] [date] NOT NULL,
 CONSTRAINT [PK_WeeklyMenu] PRIMARY KEY CLUSTERED 
(
	[WeeklyMenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[viewAllMenus]    Script Date: 12/7/2020 10:05:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[viewAllMenus] as
select w.WeeklyMenuID as 'ID', [WeekDay] as 'Day', FoodItem_FoodItemID as 'Food Item ID', ItemName as 'Food Item', ValidFrom, ValidTill from WeeklyMenu w inner join WeeklyMenuItems wi on w.WeeklyMenuID = wi.WeeklyMenuID inner join FoodItem f on f.FoodItemID = wi.FoodItem_FoodItemID
GO
/****** Object:  View [dbo].[ViewOrder]    Script Date: 12/7/2020 10:05:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[ViewOrder] as select orderID as 'ID',customers_customerID as 'Customer ID', paymentType as 'Payment Type', region_regionID as 'Region ID', rider_riderID as 'Rider ID', orderDate as 'Order Date', requiredDate as 'Required Date', shippedDate as 'Shipped Date', OrderStatus as 'Order Status', totalPrice as 'Total Price/Rs.', CashReceived as 'Cash Received', CashReturned as 'Cash Returned'  from payment p inner join orders o on p.paymentid = o.payment_paymentid
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 12/7/2020 10:05:09 AM ******/
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
/****** Object:  Table [dbo].[Customers]    Script Date: 12/7/2020 10:05:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] NOT NULL,
	[CustomerFName] [varchar](50) NOT NULL,
	[CustomerLName] [varchar](25) NULL,
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
/****** Object:  Table [dbo].[Deal]    Script Date: 12/7/2020 10:05:09 AM ******/
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
/****** Object:  Table [dbo].[Deal_has_FoodItem]    Script Date: 12/7/2020 10:05:09 AM ******/
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
/****** Object:  Table [dbo].[Deal_has_Orders]    Script Date: 12/7/2020 10:05:09 AM ******/
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
/****** Object:  Table [dbo].[OrderbyItem]    Script Date: 12/7/2020 10:05:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderbyItem](
	[OrderID] [int] NOT NULL,
	[FoodItem_FoodItemID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Discount] [int] NULL,
	[UnitPrice] [int] NOT NULL,
 CONSTRAINT [PK_OrderbyItem] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[FoodItem_FoodItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Region]    Script Date: 12/7/2020 10:05:09 AM ******/
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
INSERT [dbo].[Admin] ([AdminID], [Name], [Role], [Email], [Password_2], [DateAdded]) VALUES (1, N'hana', N'TBD', N'hana@gmail.com', N'abcd1234', CAST(N'2020-11-18' AS Date))
INSERT [dbo].[Admin] ([AdminID], [Name], [Role], [Email], [Password_2], [DateAdded]) VALUES (2, N'ifrah', N'TBD', N'ifrah@gmail.com', N'1234abcd', CAST(N'2020-11-22' AS Date))
INSERT [dbo].[Admin] ([AdminID], [Name], [Role], [Email], [Password_2], [DateAdded]) VALUES (3, N'tasmiya', N'Owner', N'tas@gmail.com', N'1234abcd', CAST(N'2020-11-22' AS Date))
GO
INSERT [dbo].[Categories] ([CategoriesID], [CategoryName], [MeasuredIn]) VALUES (1, N'Rice', N'Weight (Kg)')
INSERT [dbo].[Categories] ([CategoriesID], [CategoryName], [MeasuredIn]) VALUES (2, N'Burgers', N'No. Of Units')
INSERT [dbo].[Categories] ([CategoriesID], [CategoryName], [MeasuredIn]) VALUES (3, N'Rolls', N'No. Of Units')
INSERT [dbo].[Categories] ([CategoriesID], [CategoryName], [MeasuredIn]) VALUES (4, N'Frozen', N'No. Of Units')
INSERT [dbo].[Categories] ([CategoriesID], [CategoryName], [MeasuredIn]) VALUES (5, N'Pizzas', N'No. Of Units')
INSERT [dbo].[Categories] ([CategoriesID], [CategoryName], [MeasuredIn]) VALUES (6, N'Chinese', N'Weight (Kg)')
INSERT [dbo].[Categories] ([CategoriesID], [CategoryName], [MeasuredIn]) VALUES (7, N'BBQ', N'No. Of Units')
INSERT [dbo].[Categories] ([CategoriesID], [CategoryName], [MeasuredIn]) VALUES (8, N'Sides', N'No. Of Units')
INSERT [dbo].[Categories] ([CategoriesID], [CategoryName], [MeasuredIn]) VALUES (9, N'Cakes', N'Weight (Kg)')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerFName], [CustomerLName], [CustomerContactNo], [CustomerAddress], [AlternatePhone], [Email], [CreditCardNo]) VALUES (1, N'Nancy', N'Drew', N'00308302023', N'Gulshan, Karachi', N'00920220930', N'nancydrew@gmail.com', N'1223')
INSERT [dbo].[Customers] ([CustomerID], [CustomerFName], [CustomerLName], [CustomerContactNo], [CustomerAddress], [AlternatePhone], [Email], [CreditCardNo]) VALUES (2, N'Artemis ', N'Fowl', N'124578989', N'Defense, Karachi', N'245767879', N'artemisfowl@gmail.com', N'0092308202')
INSERT [dbo].[Customers] ([CustomerID], [CustomerFName], [CustomerLName], [CustomerContactNo], [CustomerAddress], [AlternatePhone], [Email], [CreditCardNo]) VALUES (3, N'Magnus', N'Chase', N'0294739302', N'Malir, Karachi', N'0283890168', N'magnuschase@gmail.com', N'')
INSERT [dbo].[Customers] ([CustomerID], [CustomerFName], [CustomerLName], [CustomerContactNo], [CustomerAddress], [AlternatePhone], [Email], [CreditCardNo]) VALUES (4, N'Nancy', N'David', N'0974828373', N'Defense, Karachi', NULL, N'nancydrew@gmail.com', N'')
INSERT [dbo].[Customers] ([CustomerID], [CustomerFName], [CustomerLName], [CustomerContactNo], [CustomerAddress], [AlternatePhone], [Email], [CreditCardNo]) VALUES (5, N'Tas', N'Malik', N'0309482934', N'Defense, Karachi', N'', N'tas@gmail.com', N'8371889283')
INSERT [dbo].[Customers] ([CustomerID], [CustomerFName], [CustomerLName], [CustomerContactNo], [CustomerAddress], [AlternatePhone], [Email], [CreditCardNo]) VALUES (6, N'Fifi', N'Jones', N'0088329031', N'Nazimabad, Karachi', N'', N'fifijones@gmail.com', N'')
INSERT [dbo].[Customers] ([CustomerID], [CustomerFName], [CustomerLName], [CustomerContactNo], [CustomerAddress], [AlternatePhone], [Email], [CreditCardNo]) VALUES (7, N'Ifrah', N'Ilyas', N'034058302', N'Nazimabad, Karachi', N'', N'ifrah@gmail.com', N'')
INSERT [dbo].[Customers] ([CustomerID], [CustomerFName], [CustomerLName], [CustomerContactNo], [CustomerAddress], [AlternatePhone], [Email], [CreditCardNo]) VALUES (9, N'Kashmala', N'Hanif', N'01223813', N'Block G, C-24', N'02312311254', N'kashh@yahoo.com', N'')
GO
INSERT [dbo].[FoodItem] ([FoodItemID], [Categories_CategoriesID], [ItemName], [UnitPrice], [UnitQuantity]) VALUES (1, 1, N'Biryani', 50.0000, 0.5)
INSERT [dbo].[FoodItem] ([FoodItemID], [Categories_CategoriesID], [ItemName], [UnitPrice], [UnitQuantity]) VALUES (2, 1, N'Pulao', 40.0000, 0.5)
INSERT [dbo].[FoodItem] ([FoodItemID], [Categories_CategoriesID], [ItemName], [UnitPrice], [UnitQuantity]) VALUES (3, 2, N'Grilled Chicken Burger', 100.0000, 1)
INSERT [dbo].[FoodItem] ([FoodItemID], [Categories_CategoriesID], [ItemName], [UnitPrice], [UnitQuantity]) VALUES (4, 2, N'Beef Burger', 200.0000, 1)
INSERT [dbo].[FoodItem] ([FoodItemID], [Categories_CategoriesID], [ItemName], [UnitPrice], [UnitQuantity]) VALUES (5, 1, N'Chinese Fried Rice', 200.0000, 0.5)
INSERT [dbo].[FoodItem] ([FoodItemID], [Categories_CategoriesID], [ItemName], [UnitPrice], [UnitQuantity]) VALUES (6, 2, N'ZInger Burger', 250.0000, 1)
INSERT [dbo].[FoodItem] ([FoodItemID], [Categories_CategoriesID], [ItemName], [UnitPrice], [UnitQuantity]) VALUES (7, 3, N'Chicken Tikka Roll', 150.0000, 1)
INSERT [dbo].[FoodItem] ([FoodItemID], [Categories_CategoriesID], [ItemName], [UnitPrice], [UnitQuantity]) VALUES (8, 3, N'Egg Rolls', 200.0000, 3)
INSERT [dbo].[FoodItem] ([FoodItemID], [Categories_CategoriesID], [ItemName], [UnitPrice], [UnitQuantity]) VALUES (10, 4, N'Frozen Egg Rolls', 200.0000, 3)
INSERT [dbo].[FoodItem] ([FoodItemID], [Categories_CategoriesID], [ItemName], [UnitPrice], [UnitQuantity]) VALUES (11, 4, N'Pizza', 250.0000, 2)
INSERT [dbo].[FoodItem] ([FoodItemID], [Categories_CategoriesID], [ItemName], [UnitPrice], [UnitQuantity]) VALUES (12, 4, N'Chicken Samosas', 200.0000, 6)
INSERT [dbo].[FoodItem] ([FoodItemID], [Categories_CategoriesID], [ItemName], [UnitPrice], [UnitQuantity]) VALUES (13, 4, N'Vegetable Samosas', 150.0000, 6)
INSERT [dbo].[FoodItem] ([FoodItemID], [Categories_CategoriesID], [ItemName], [UnitPrice], [UnitQuantity]) VALUES (14, 6, N'Shashlik', 250.0000, 0.5)
INSERT [dbo].[FoodItem] ([FoodItemID], [Categories_CategoriesID], [ItemName], [UnitPrice], [UnitQuantity]) VALUES (15, 9, N'Chocolate Cake', 500.0000, 0.5)
INSERT [dbo].[FoodItem] ([FoodItemID], [Categories_CategoriesID], [ItemName], [UnitPrice], [UnitQuantity]) VALUES (16, 8, N'Raita', 20.0000, 0.2)
INSERT [dbo].[FoodItem] ([FoodItemID], [Categories_CategoriesID], [ItemName], [UnitPrice], [UnitQuantity]) VALUES (17, 7, N'Seekh Kebab', 80.0000, 0.75)
GO
INSERT [dbo].[Ingredients] ([IngredientsID], [IngredientName], [QtyInStock_kg]) VALUES (1, N'Tomatoes', 19.5349979)
INSERT [dbo].[Ingredients] ([IngredientsID], [IngredientName], [QtyInStock_kg]) VALUES (2, N'Rice', 17)
INSERT [dbo].[Ingredients] ([IngredientsID], [IngredientName], [QtyInStock_kg]) VALUES (3, N'Ginger', 19.97)
INSERT [dbo].[Ingredients] ([IngredientsID], [IngredientName], [QtyInStock_kg]) VALUES (4, N'Chicken', 16.45)
INSERT [dbo].[Ingredients] ([IngredientsID], [IngredientName], [QtyInStock_kg]) VALUES (5, N'Carrots', 19.97)
INSERT [dbo].[Ingredients] ([IngredientsID], [IngredientName], [QtyInStock_kg]) VALUES (6, N'Garlic', 19.975)
INSERT [dbo].[Ingredients] ([IngredientsID], [IngredientName], [QtyInStock_kg]) VALUES (7, N'Spices', 19.7999973)
INSERT [dbo].[Ingredients] ([IngredientsID], [IngredientName], [QtyInStock_kg]) VALUES (8, N'Onions', 19.585)
INSERT [dbo].[Ingredients] ([IngredientsID], [IngredientName], [QtyInStock_kg]) VALUES (9, N'Beef', 20)
INSERT [dbo].[Ingredients] ([IngredientsID], [IngredientName], [QtyInStock_kg]) VALUES (10, N'Flour', 18.94)
INSERT [dbo].[Ingredients] ([IngredientsID], [IngredientName], [QtyInStock_kg]) VALUES (12, N'Cheese', 20)
INSERT [dbo].[Ingredients] ([IngredientsID], [IngredientName], [QtyInStock_kg]) VALUES (13, N'Buns', 20)
INSERT [dbo].[Ingredients] ([IngredientsID], [IngredientName], [QtyInStock_kg]) VALUES (14, N'Eggs', 19.99)
GO
INSERT [dbo].[Ingredients_for_FoodItem] ([FoodItem_FoodItemID], [Ingredients_IngredientsID], [Quantity_grams]) VALUES (1, 1, 50)
INSERT [dbo].[Ingredients_for_FoodItem] ([FoodItem_FoodItemID], [Ingredients_IngredientsID], [Quantity_grams]) VALUES (1, 2, 500)
INSERT [dbo].[Ingredients_for_FoodItem] ([FoodItem_FoodItemID], [Ingredients_IngredientsID], [Quantity_grams]) VALUES (1, 4, 500)
INSERT [dbo].[Ingredients_for_FoodItem] ([FoodItem_FoodItemID], [Ingredients_IngredientsID], [Quantity_grams]) VALUES (1, 7, 20)
INSERT [dbo].[Ingredients_for_FoodItem] ([FoodItem_FoodItemID], [Ingredients_IngredientsID], [Quantity_grams]) VALUES (1, 8, 50)
INSERT [dbo].[Ingredients_for_FoodItem] ([FoodItem_FoodItemID], [Ingredients_IngredientsID], [Quantity_grams]) VALUES (2, 3, 1)
INSERT [dbo].[Ingredients_for_FoodItem] ([FoodItem_FoodItemID], [Ingredients_IngredientsID], [Quantity_grams]) VALUES (2, 6, 1)
INSERT [dbo].[Ingredients_for_FoodItem] ([FoodItem_FoodItemID], [Ingredients_IngredientsID], [Quantity_grams]) VALUES (3, 6, 1)
INSERT [dbo].[Ingredients_for_FoodItem] ([FoodItem_FoodItemID], [Ingredients_IngredientsID], [Quantity_grams]) VALUES (4, 3, 1)
INSERT [dbo].[Ingredients_for_FoodItem] ([FoodItem_FoodItemID], [Ingredients_IngredientsID], [Quantity_grams]) VALUES (4, 5, 1)
INSERT [dbo].[Ingredients_for_FoodItem] ([FoodItem_FoodItemID], [Ingredients_IngredientsID], [Quantity_grams]) VALUES (5, 1, 50)
INSERT [dbo].[Ingredients_for_FoodItem] ([FoodItem_FoodItemID], [Ingredients_IngredientsID], [Quantity_grams]) VALUES (5, 2, 500)
INSERT [dbo].[Ingredients_for_FoodItem] ([FoodItem_FoodItemID], [Ingredients_IngredientsID], [Quantity_grams]) VALUES (5, 3, 10)
INSERT [dbo].[Ingredients_for_FoodItem] ([FoodItem_FoodItemID], [Ingredients_IngredientsID], [Quantity_grams]) VALUES (5, 5, 50)
INSERT [dbo].[Ingredients_for_FoodItem] ([FoodItem_FoodItemID], [Ingredients_IngredientsID], [Quantity_grams]) VALUES (5, 6, 10)
INSERT [dbo].[Ingredients_for_FoodItem] ([FoodItem_FoodItemID], [Ingredients_IngredientsID], [Quantity_grams]) VALUES (5, 7, 10)
INSERT [dbo].[Ingredients_for_FoodItem] ([FoodItem_FoodItemID], [Ingredients_IngredientsID], [Quantity_grams]) VALUES (6, 1, 10)
INSERT [dbo].[Ingredients_for_FoodItem] ([FoodItem_FoodItemID], [Ingredients_IngredientsID], [Quantity_grams]) VALUES (6, 4, 50)
INSERT [dbo].[Ingredients_for_FoodItem] ([FoodItem_FoodItemID], [Ingredients_IngredientsID], [Quantity_grams]) VALUES (6, 8, 10)
INSERT [dbo].[Ingredients_for_FoodItem] ([FoodItem_FoodItemID], [Ingredients_IngredientsID], [Quantity_grams]) VALUES (7, 1, 10)
INSERT [dbo].[Ingredients_for_FoodItem] ([FoodItem_FoodItemID], [Ingredients_IngredientsID], [Quantity_grams]) VALUES (7, 4, 50)
INSERT [dbo].[Ingredients_for_FoodItem] ([FoodItem_FoodItemID], [Ingredients_IngredientsID], [Quantity_grams]) VALUES (7, 7, 10)
INSERT [dbo].[Ingredients_for_FoodItem] ([FoodItem_FoodItemID], [Ingredients_IngredientsID], [Quantity_grams]) VALUES (7, 8, 10)
INSERT [dbo].[Ingredients_for_FoodItem] ([FoodItem_FoodItemID], [Ingredients_IngredientsID], [Quantity_grams]) VALUES (7, 10, 50)
INSERT [dbo].[Ingredients_for_FoodItem] ([FoodItem_FoodItemID], [Ingredients_IngredientsID], [Quantity_grams]) VALUES (8, 1, 10)
INSERT [dbo].[Ingredients_for_FoodItem] ([FoodItem_FoodItemID], [Ingredients_IngredientsID], [Quantity_grams]) VALUES (8, 3, 10)
INSERT [dbo].[Ingredients_for_FoodItem] ([FoodItem_FoodItemID], [Ingredients_IngredientsID], [Quantity_grams]) VALUES (8, 5, 10)
INSERT [dbo].[Ingredients_for_FoodItem] ([FoodItem_FoodItemID], [Ingredients_IngredientsID], [Quantity_grams]) VALUES (8, 6, 10)
INSERT [dbo].[Ingredients_for_FoodItem] ([FoodItem_FoodItemID], [Ingredients_IngredientsID], [Quantity_grams]) VALUES (8, 7, 10)
INSERT [dbo].[Ingredients_for_FoodItem] ([FoodItem_FoodItemID], [Ingredients_IngredientsID], [Quantity_grams]) VALUES (8, 8, 10)
INSERT [dbo].[Ingredients_for_FoodItem] ([FoodItem_FoodItemID], [Ingredients_IngredientsID], [Quantity_grams]) VALUES (10, 1, 10)
INSERT [dbo].[Ingredients_for_FoodItem] ([FoodItem_FoodItemID], [Ingredients_IngredientsID], [Quantity_grams]) VALUES (10, 3, 10)
INSERT [dbo].[Ingredients_for_FoodItem] ([FoodItem_FoodItemID], [Ingredients_IngredientsID], [Quantity_grams]) VALUES (10, 5, 10)
INSERT [dbo].[Ingredients_for_FoodItem] ([FoodItem_FoodItemID], [Ingredients_IngredientsID], [Quantity_grams]) VALUES (10, 8, 10)
INSERT [dbo].[Ingredients_for_FoodItem] ([FoodItem_FoodItemID], [Ingredients_IngredientsID], [Quantity_grams]) VALUES (10, 10, 10)
INSERT [dbo].[Ingredients_for_FoodItem] ([FoodItem_FoodItemID], [Ingredients_IngredientsID], [Quantity_grams]) VALUES (10, 14, 10)
INSERT [dbo].[Ingredients_for_FoodItem] ([FoodItem_FoodItemID], [Ingredients_IngredientsID], [Quantity_grams]) VALUES (11, 1, 30)
INSERT [dbo].[Ingredients_for_FoodItem] ([FoodItem_FoodItemID], [Ingredients_IngredientsID], [Quantity_grams]) VALUES (11, 4, 100)
INSERT [dbo].[Ingredients_for_FoodItem] ([FoodItem_FoodItemID], [Ingredients_IngredientsID], [Quantity_grams]) VALUES (11, 8, 10)
INSERT [dbo].[Ingredients_for_FoodItem] ([FoodItem_FoodItemID], [Ingredients_IngredientsID], [Quantity_grams]) VALUES (11, 10, 300)
INSERT [dbo].[Ingredients_for_FoodItem] ([FoodItem_FoodItemID], [Ingredients_IngredientsID], [Quantity_grams]) VALUES (12, 4, 100)
INSERT [dbo].[Ingredients_for_FoodItem] ([FoodItem_FoodItemID], [Ingredients_IngredientsID], [Quantity_grams]) VALUES (12, 7, 10)
INSERT [dbo].[Ingredients_for_FoodItem] ([FoodItem_FoodItemID], [Ingredients_IngredientsID], [Quantity_grams]) VALUES (12, 8, 10)
INSERT [dbo].[Ingredients_for_FoodItem] ([FoodItem_FoodItemID], [Ingredients_IngredientsID], [Quantity_grams]) VALUES (13, 1, 10)
INSERT [dbo].[Ingredients_for_FoodItem] ([FoodItem_FoodItemID], [Ingredients_IngredientsID], [Quantity_grams]) VALUES (13, 3, 10)
INSERT [dbo].[Ingredients_for_FoodItem] ([FoodItem_FoodItemID], [Ingredients_IngredientsID], [Quantity_grams]) VALUES (13, 5, 10)
INSERT [dbo].[Ingredients_for_FoodItem] ([FoodItem_FoodItemID], [Ingredients_IngredientsID], [Quantity_grams]) VALUES (13, 8, 10)
INSERT [dbo].[Ingredients_for_FoodItem] ([FoodItem_FoodItemID], [Ingredients_IngredientsID], [Quantity_grams]) VALUES (13, 14, 10)
INSERT [dbo].[Ingredients_for_FoodItem] ([FoodItem_FoodItemID], [Ingredients_IngredientsID], [Quantity_grams]) VALUES (14, 1, 5)
INSERT [dbo].[Ingredients_for_FoodItem] ([FoodItem_FoodItemID], [Ingredients_IngredientsID], [Quantity_grams]) VALUES (14, 3, 3)
INSERT [dbo].[Ingredients_for_FoodItem] ([FoodItem_FoodItemID], [Ingredients_IngredientsID], [Quantity_grams]) VALUES (14, 4, 2)
INSERT [dbo].[Ingredients_for_FoodItem] ([FoodItem_FoodItemID], [Ingredients_IngredientsID], [Quantity_grams]) VALUES (14, 6, 3)
INSERT [dbo].[Ingredients_for_FoodItem] ([FoodItem_FoodItemID], [Ingredients_IngredientsID], [Quantity_grams]) VALUES (14, 7, 3)
INSERT [dbo].[Ingredients_for_FoodItem] ([FoodItem_FoodItemID], [Ingredients_IngredientsID], [Quantity_grams]) VALUES (15, 10, 1)
INSERT [dbo].[Ingredients_for_FoodItem] ([FoodItem_FoodItemID], [Ingredients_IngredientsID], [Quantity_grams]) VALUES (15, 14, 5)
INSERT [dbo].[Ingredients_for_FoodItem] ([FoodItem_FoodItemID], [Ingredients_IngredientsID], [Quantity_grams]) VALUES (16, 16, 1)
INSERT [dbo].[Ingredients_for_FoodItem] ([FoodItem_FoodItemID], [Ingredients_IngredientsID], [Quantity_grams]) VALUES (16, 17, 1)
INSERT [dbo].[Ingredients_for_FoodItem] ([FoodItem_FoodItemID], [Ingredients_IngredientsID], [Quantity_grams]) VALUES (16, 18, 1)
INSERT [dbo].[Ingredients_for_FoodItem] ([FoodItem_FoodItemID], [Ingredients_IngredientsID], [Quantity_grams]) VALUES (17, 7, 3)
INSERT [dbo].[Ingredients_for_FoodItem] ([FoodItem_FoodItemID], [Ingredients_IngredientsID], [Quantity_grams]) VALUES (17, 9, 2)
GO
INSERT [dbo].[OrderbyItem] ([OrderID], [FoodItem_FoodItemID], [Quantity], [Discount], [UnitPrice]) VALUES (3, 1, 1, 0, 50)
INSERT [dbo].[OrderbyItem] ([OrderID], [FoodItem_FoodItemID], [Quantity], [Discount], [UnitPrice]) VALUES (3, 2, 1, 0, 40)
INSERT [dbo].[OrderbyItem] ([OrderID], [FoodItem_FoodItemID], [Quantity], [Discount], [UnitPrice]) VALUES (3, 5, 3, 0, 150)
INSERT [dbo].[OrderbyItem] ([OrderID], [FoodItem_FoodItemID], [Quantity], [Discount], [UnitPrice]) VALUES (4, 1, 3, 0, 50)
INSERT [dbo].[OrderbyItem] ([OrderID], [FoodItem_FoodItemID], [Quantity], [Discount], [UnitPrice]) VALUES (4, 3, 2, 0, 100)
INSERT [dbo].[OrderbyItem] ([OrderID], [FoodItem_FoodItemID], [Quantity], [Discount], [UnitPrice]) VALUES (5, 1, 5, 0, 50)
INSERT [dbo].[OrderbyItem] ([OrderID], [FoodItem_FoodItemID], [Quantity], [Discount], [UnitPrice]) VALUES (5, 2, 3, 0, 40)
INSERT [dbo].[OrderbyItem] ([OrderID], [FoodItem_FoodItemID], [Quantity], [Discount], [UnitPrice]) VALUES (5, 3, 2, 0, 100)
INSERT [dbo].[OrderbyItem] ([OrderID], [FoodItem_FoodItemID], [Quantity], [Discount], [UnitPrice]) VALUES (6, 4, 2, 0, 200)
INSERT [dbo].[OrderbyItem] ([OrderID], [FoodItem_FoodItemID], [Quantity], [Discount], [UnitPrice]) VALUES (7, 3, 1, 0, 100)
INSERT [dbo].[OrderbyItem] ([OrderID], [FoodItem_FoodItemID], [Quantity], [Discount], [UnitPrice]) VALUES (7, 7, 1, 0, 150)
INSERT [dbo].[OrderbyItem] ([OrderID], [FoodItem_FoodItemID], [Quantity], [Discount], [UnitPrice]) VALUES (7, 8, 3, 0, 200)
INSERT [dbo].[OrderbyItem] ([OrderID], [FoodItem_FoodItemID], [Quantity], [Discount], [UnitPrice]) VALUES (8, 1, 0, 0, 50)
INSERT [dbo].[OrderbyItem] ([OrderID], [FoodItem_FoodItemID], [Quantity], [Discount], [UnitPrice]) VALUES (8, 3, 3, 0, 100)
INSERT [dbo].[OrderbyItem] ([OrderID], [FoodItem_FoodItemID], [Quantity], [Discount], [UnitPrice]) VALUES (8, 5, 0, 0, 200)
INSERT [dbo].[OrderbyItem] ([OrderID], [FoodItem_FoodItemID], [Quantity], [Discount], [UnitPrice]) VALUES (8, 7, 3, 0, 150)
GO
INSERT [dbo].[Orders] ([OrderID], [Payment_PaymentID], [Region_RegionID], [Rider_RiderID], [Customers_CustomerID], [OrderDate], [RequiredDate], [ShippedDate], [OrderStatus], [TotalPrice]) VALUES (1, 1, 1, 1, 1, CAST(N'2020-11-12' AS Date), CAST(N'2020-11-12' AS Date), CAST(N'2020-12-07' AS Date), N'Delivered', NULL)
INSERT [dbo].[Orders] ([OrderID], [Payment_PaymentID], [Region_RegionID], [Rider_RiderID], [Customers_CustomerID], [OrderDate], [RequiredDate], [ShippedDate], [OrderStatus], [TotalPrice]) VALUES (3, 3, 2, NULL, 7, CAST(N'2020-12-01' AS Date), CAST(N'2020-12-02' AS Date), CAST(N'2020-12-06' AS Date), N'Delivered', 850.0000)
INSERT [dbo].[Orders] ([OrderID], [Payment_PaymentID], [Region_RegionID], [Rider_RiderID], [Customers_CustomerID], [OrderDate], [RequiredDate], [ShippedDate], [OrderStatus], [TotalPrice]) VALUES (4, 4, 2, NULL, 5, CAST(N'2020-12-05' AS Date), CAST(N'2020-12-05' AS Date), NULL, N'In Process', 700.0000)
INSERT [dbo].[Orders] ([OrderID], [Payment_PaymentID], [Region_RegionID], [Rider_RiderID], [Customers_CustomerID], [OrderDate], [RequiredDate], [ShippedDate], [OrderStatus], [TotalPrice]) VALUES (5, 5, 3, NULL, 6, CAST(N'2020-12-05' AS Date), CAST(N'2020-12-05' AS Date), NULL, N'In Process', 1140.0000)
INSERT [dbo].[Orders] ([OrderID], [Payment_PaymentID], [Region_RegionID], [Rider_RiderID], [Customers_CustomerID], [OrderDate], [RequiredDate], [ShippedDate], [OrderStatus], [TotalPrice]) VALUES (6, 6, 3, NULL, 7, CAST(N'2020-12-05' AS Date), CAST(N'2020-12-05' AS Date), NULL, N'In Process', 916.6667)
INSERT [dbo].[Orders] ([OrderID], [Payment_PaymentID], [Region_RegionID], [Rider_RiderID], [Customers_CustomerID], [OrderDate], [RequiredDate], [ShippedDate], [OrderStatus], [TotalPrice]) VALUES (7, 7, 3, NULL, 8, CAST(N'2020-12-05' AS Date), CAST(N'2020-12-05' AS Date), NULL, N'In Process', 650.0000)
INSERT [dbo].[Orders] ([OrderID], [Payment_PaymentID], [Region_RegionID], [Rider_RiderID], [Customers_CustomerID], [OrderDate], [RequiredDate], [ShippedDate], [OrderStatus], [TotalPrice]) VALUES (8, 9, 4, NULL, 9, CAST(N'2020-12-07' AS Date), CAST(N'2020-12-09' AS Date), NULL, N'In Process', 800.0000)
GO
INSERT [dbo].[Payment] ([PaymentID], [PaymentType], [CashReceived], [CashReturned]) VALUES (1, N'COD', 250.0000, 0.0000)
INSERT [dbo].[Payment] ([PaymentID], [PaymentType], [CashReceived], [CashReturned]) VALUES (3, N'Credit Card', NULL, NULL)
INSERT [dbo].[Payment] ([PaymentID], [PaymentType], [CashReceived], [CashReturned]) VALUES (4, N'Credit Card', NULL, NULL)
INSERT [dbo].[Payment] ([PaymentID], [PaymentType], [CashReceived], [CashReturned]) VALUES (5, N'COD', NULL, NULL)
INSERT [dbo].[Payment] ([PaymentID], [PaymentType], [CashReceived], [CashReturned]) VALUES (6, N'COD', NULL, NULL)
INSERT [dbo].[Payment] ([PaymentID], [PaymentType], [CashReceived], [CashReturned]) VALUES (7, N'COD', NULL, NULL)
INSERT [dbo].[Payment] ([PaymentID], [PaymentType], [CashReceived], [CashReturned]) VALUES (8, N'COD', NULL, NULL)
INSERT [dbo].[Payment] ([PaymentID], [PaymentType], [CashReceived], [CashReturned]) VALUES (9, N'COD', NULL, NULL)
GO
INSERT [dbo].[Region] ([RegionID], [RegionDescription]) VALUES (1, N'Malir Cantt.')
INSERT [dbo].[Region] ([RegionID], [RegionDescription]) VALUES (3, N'Nazimabad')
INSERT [dbo].[Region] ([RegionID], [RegionDescription]) VALUES (4, N'North Nazimabad')
INSERT [dbo].[Region] ([RegionID], [RegionDescription]) VALUES (5, N'Clifton')
INSERT [dbo].[Region] ([RegionID], [RegionDescription]) VALUES (6, N'Korangi')
INSERT [dbo].[Region] ([RegionID], [RegionDescription]) VALUES (7, N'Gulshan-e-Iqbal')
INSERT [dbo].[Region] ([RegionID], [RegionDescription]) VALUES (8, N'DHA Phase I')
INSERT [dbo].[Region] ([RegionID], [RegionDescription]) VALUES (9, N'DHA Phase II')
INSERT [dbo].[Region] ([RegionID], [RegionDescription]) VALUES (10, N'DHA Phase III')
INSERT [dbo].[Region] ([RegionID], [RegionDescription]) VALUES (11, N'DHA Phase IV')
INSERT [dbo].[Region] ([RegionID], [RegionDescription]) VALUES (12, N'DHA Phase V')
INSERT [dbo].[Region] ([RegionID], [RegionDescription]) VALUES (13, N'DHA Phase VI')
INSERT [dbo].[Region] ([RegionID], [RegionDescription]) VALUES (14, N'DHA Phase VII')
INSERT [dbo].[Region] ([RegionID], [RegionDescription]) VALUES (15, N'DHA Phase VIII')
INSERT [dbo].[Region] ([RegionID], [RegionDescription]) VALUES (16, N'Saddar')
INSERT [dbo].[Region] ([RegionID], [RegionDescription]) VALUES (17, N'Gulistan-e-Jauhar')
INSERT [dbo].[Region] ([RegionID], [RegionDescription]) VALUES (18, N'Federal B. Area')
INSERT [dbo].[Region] ([RegionID], [RegionDescription]) VALUES (19, N'Gulberg')
INSERT [dbo].[Region] ([RegionID], [RegionDescription]) VALUES (20, N'North Karachi')
INSERT [dbo].[Region] ([RegionID], [RegionDescription]) VALUES (21, N'Aisha Manzil')
GO
INSERT [dbo].[Rider] ([RiderID], [RiderName], [RiderPhoneNo], [RiderCNIC], [RiderCompany], [RiderEmail], [RiderPassword]) VALUES (1, N'Ali Ahmed', N'0303032992', N'35202-939393-2', N'XYZ', N'aliahmed@gmail.com', N'abcd')
INSERT [dbo].[Rider] ([RiderID], [RiderName], [RiderPhoneNo], [RiderCNIC], [RiderCompany], [RiderEmail], [RiderPassword]) VALUES (2, N'Muhammad Umar', N'0038010012', N'35202-9384829-7', N'ABC', N'mumar@gmail.com', N'ksjadjwadh')
INSERT [dbo].[Rider] ([RiderID], [RiderName], [RiderPhoneNo], [RiderCNIC], [RiderCompany], [RiderEmail], [RiderPassword]) VALUES (3, N'Najam Kamal', N'03049783893', N'35202-45636-6', N'PQR', N'najam@gmail.com', N'kkjksklls')
INSERT [dbo].[Rider] ([RiderID], [RiderName], [RiderPhoneNo], [RiderCNIC], [RiderCompany], [RiderEmail], [RiderPassword]) VALUES (4, N'Taemoor Kamal', N'00929838902', N'35202-7938274-3', N'PQR', N'taemoor@gmail.com', N'assadasa')
INSERT [dbo].[Rider] ([RiderID], [RiderName], [RiderPhoneNo], [RiderCNIC], [RiderCompany], [RiderEmail], [RiderPassword]) VALUES (5, N'Jameel Khan', N'033458923', N'35202-882922-3', N'ABC', N'jameel@gmail.com', N'ui887oi')
INSERT [dbo].[Rider] ([RiderID], [RiderName], [RiderPhoneNo], [RiderCNIC], [RiderCompany], [RiderEmail], [RiderPassword]) VALUES (6, N'Muhammad Hasan', N'03299379234', N'35202-888833-3', N'XYZ', N'mhasan@gmail.com', N'jd73kksf')
GO
INSERT [dbo].[WeeklyMenu] ([WeeklyMenuID], [ValidFrom], [ValidTill]) VALUES (1, CAST(N'2020-11-12' AS Date), CAST(N'2020-11-15' AS Date))
INSERT [dbo].[WeeklyMenu] ([WeeklyMenuID], [ValidFrom], [ValidTill]) VALUES (2, CAST(N'2020-12-06' AS Date), CAST(N'2020-12-06' AS Date))
GO
INSERT [dbo].[WeeklyMenuItems] ([WeeklyMenuID], [WeekDay], [FoodItem_FoodItemID]) VALUES (2, N'Monday', 1)
INSERT [dbo].[WeeklyMenuItems] ([WeeklyMenuID], [WeekDay], [FoodItem_FoodItemID]) VALUES (2, N'Tuesday', 2)
INSERT [dbo].[WeeklyMenuItems] ([WeeklyMenuID], [WeekDay], [FoodItem_FoodItemID]) VALUES (2, N'Wednesday', 3)
INSERT [dbo].[WeeklyMenuItems] ([WeeklyMenuID], [WeekDay], [FoodItem_FoodItemID]) VALUES (2, N'Friday', 4)
INSERT [dbo].[WeeklyMenuItems] ([WeeklyMenuID], [WeekDay], [FoodItem_FoodItemID]) VALUES (2, N'Thursday', 4)
INSERT [dbo].[WeeklyMenuItems] ([WeeklyMenuID], [WeekDay], [FoodItem_FoodItemID]) VALUES (2, N'Saturday', 6)
INSERT [dbo].[WeeklyMenuItems] ([WeeklyMenuID], [WeekDay], [FoodItem_FoodItemID]) VALUES (2, N'Sunday', 7)
GO
/****** Object:  Index [Deal_has_FoodItem_FKIndex1]    Script Date: 12/7/2020 10:05:10 AM ******/
CREATE NONCLUSTERED INDEX [Deal_has_FoodItem_FKIndex1] ON [dbo].[Deal_has_FoodItem]
(
	[Deal_DealID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Deal_has_FoodItem_FKIndex2]    Script Date: 12/7/2020 10:05:10 AM ******/
CREATE NONCLUSTERED INDEX [Deal_has_FoodItem_FKIndex2] ON [dbo].[Deal_has_FoodItem]
(
	[FoodItem_FoodItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Deal_has_Orders_FKIndex1]    Script Date: 12/7/2020 10:05:10 AM ******/
CREATE NONCLUSTERED INDEX [Deal_has_Orders_FKIndex1] ON [dbo].[Deal_has_Orders]
(
	[Deal_DealID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Deal_has_Orders_FKIndex2]    Script Date: 12/7/2020 10:05:10 AM ******/
CREATE NONCLUSTERED INDEX [Deal_has_Orders_FKIndex2] ON [dbo].[Deal_has_Orders]
(
	[Orders_OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [FoodItem_FKIndex1]    Script Date: 12/7/2020 10:05:10 AM ******/
CREATE NONCLUSTERED INDEX [FoodItem_FKIndex1] ON [dbo].[FoodItem]
(
	[Categories_CategoriesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [FoodItem_has_Supplies_FKIndex1]    Script Date: 12/7/2020 10:05:10 AM ******/
CREATE NONCLUSTERED INDEX [FoodItem_has_Supplies_FKIndex1] ON [dbo].[Ingredients_for_FoodItem]
(
	[FoodItem_FoodItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [FoodItem_has_Supplies_FKIndex2]    Script Date: 12/7/2020 10:05:10 AM ******/
CREATE NONCLUSTERED INDEX [FoodItem_has_Supplies_FKIndex2] ON [dbo].[Ingredients_for_FoodItem]
(
	[Ingredients_IngredientsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Orders_FKIndex1]    Script Date: 12/7/2020 10:05:10 AM ******/
CREATE NONCLUSTERED INDEX [Orders_FKIndex1] ON [dbo].[Orders]
(
	[Customers_CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Orders_FKIndex2]    Script Date: 12/7/2020 10:05:10 AM ******/
CREATE NONCLUSTERED INDEX [Orders_FKIndex2] ON [dbo].[Orders]
(
	[Rider_RiderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Orders_FKIndex3]    Script Date: 12/7/2020 10:05:10 AM ******/
CREATE NONCLUSTERED INDEX [Orders_FKIndex3] ON [dbo].[Orders]
(
	[Region_RegionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Orders_FKIndex4]    Script Date: 12/7/2020 10:05:10 AM ******/
CREATE NONCLUSTERED INDEX [Orders_FKIndex4] ON [dbo].[Orders]
(
	[Payment_PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [WeeklyMenu_FKIndex1]    Script Date: 12/7/2020 10:05:10 AM ******/
CREATE NONCLUSTERED INDEX [WeeklyMenu_FKIndex1] ON [dbo].[WeeklyMenuItems]
(
	[FoodItem_FoodItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[deleteCustomerAndOrder]    Script Date: 12/7/2020 10:05:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[deleteCustomerAndOrder] @customer int as
delete from Payment where PaymentID = (select payment_paymentID from orders where orderID = (select orderID from orders where Customers_CustomerID = @customer and (OrderStatus = 'In Process' or OrderStatus = 'Dispatched') ))
delete from OrderbyItem where OrderID = (select orderID from orders where Customers_CustomerID = @customer and (OrderStatus = 'In Process' or OrderStatus = 'Dispatched'))
delete from Orders where Customers_CustomerID = @customer
delete from Customers where CustomerID = @customer
GO
/****** Object:  StoredProcedure [dbo].[displayItems]    Script Date: 12/7/2020 10:05:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[displayItems] @CategoryName varchar(30)
as 
Select itemname as 'Item', unitprice as 'Price/unit' ,unitquantity 'Serving Size',measuredin as 'Measured In' from fooditem f inner join categories c on f.categories_categoriesid = c.categoriesid where categoryname = @CategoryName
GO
/****** Object:  StoredProcedure [dbo].[displayTodaysSpecial]    Script Date: 12/7/2020 10:05:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[displayTodaysSpecial] @WeekDay varchar(25), @today date as
Select itemname as 'Item', unitprice as 'Price/unit' ,unitquantity 'Serving Size',measuredin as 'Measured In' from fooditem f inner join categories c on f.categories_categoriesid = c.categoriesid where FoodItemID = (select FoodItem_FoodItemID from WeeklyMenu w inner join WeeklyMenuItems wi on w.WeeklyMenuID = wi.WeeklyMenuID where [WeekDay] = @WeekDay and ValidFrom <= @today and ValidTill >= @today) 
GO
/****** Object:  StoredProcedure [dbo].[GetIngrQtyInItem]    Script Date: 12/7/2020 10:05:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetIngrQtyInItem] @ItemName varchar(30)
as
select ItemName, UnitQuantity, IngredientsID, IngredientName, Quantity_grams, QtyInStock_kg from Ingredients i inner join Ingredients_for_FoodItem fi on i.IngredientsID = fi.Ingredients_IngredientsID inner join FoodItem f on f.FoodItemID = fi.FoodItem_FoodItemID where ItemName = @ItemName
GO
/****** Object:  StoredProcedure [dbo].[MostFrequentCustomer]    Script Date: 12/7/2020 10:05:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[MostFrequentCustomer] @Datefrom date, @DateTo date
as
select CustomerID, CustomerFName + ' ' + CustomerLName from customers c inner join orders o on c.CustomerID =  o.Customers_CustomerID where CustomerID = (select top(1) CustomerID from Customers full outer join Orders on Orders.Customers_CustomerID=Customers.CustomerID Group by CustomerID,CustomerFName,CustomerLName Order by count(Customers_CustomerID) desc) and OrderDate >= @Datefrom and OrderDate <= @DateTo
GO
/****** Object:  StoredProcedure [dbo].[MostPopularItem]    Script Date: 12/7/2020 10:05:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[MostPopularItem] @Datefrom date, @DateTo date
as
select FoodItemID, ItemName from FoodItem f inner join OrderbyItem oi on f.FoodItemID = oi.FoodItem_FoodItemID inner join Orders o on o.OrderID = oi.FoodItem_FoodItemID where FoodItemID = (select top(1) FoodItemID from FoodItem f inner join OrderbyItem oi on f.FoodItemID = oi.FoodItem_FoodItemID inner join Orders o on o.OrderID = oi.FoodItem_FoodItemID Group by FoodItemID Order by count(FoodItemID) desc) and OrderDate >= @Datefrom and OrderDate <= @DateTo 
GO
/****** Object:  StoredProcedure [dbo].[RegionMostOrders]    Script Date: 12/7/2020 10:05:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[RegionMostOrders] @Datefrom date, @DateTo date
as
select regionID, regionDescription from Region r inner join orders o on r.RegionID =  o.Region_RegionID where RegionID = (select top(1) RegionID from Region r inner join orders o on r.RegionID =  o.Region_RegionID Group by RegionID Order by count(RegionID) desc) and OrderDate >= @Datefrom and OrderDate <= @DateTo
GO
/****** Object:  StoredProcedure [dbo].[viewOrdersByItem]    Script Date: 12/7/2020 10:05:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[viewOrdersByItem] @ItemName varchar(30) as
select o.orderID as 'ID',customers_customerID as 'Customer ID', paymentType as 'Payment Type', region_regionID as 'Region ID', rider_riderID as 'Rider ID', orderDate as 'Order Date', requiredDate as 'Required Date', shippedDate as 'Shipped Date', OrderStatus as 'Order Status', totalPrice as 'Total Price/Rs.', CashReceived as 'Cash Received', CashReturned as 'Cash Returned'  from payment p inner join orders o on p.paymentid = o.payment_paymentid inner join orderbyitem oi on o.orderid = oi.orderid where fooditem_fooditemid = (select fooditemid from fooditem where itemname = @ItemName)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[72] 4[3] 2[6] 3) )"
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
         Begin Table = "f"
            Begin Extent = 
               Top = 80
               Left = 662
               Bottom = 277
               Right = 959
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "fi"
            Begin Extent = 
               Top = 169
               Left = 65
               Bottom = 367
               Right = 372
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "i"
            Begin Extent = 
               Top = 303
               Left = 675
               Bottom = 500
               Right = 907
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
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'showFoodItemIngredients'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'showFoodItemIngredients'
GO
USE [master]
GO
ALTER DATABASE [cateringSystemDatabase] SET  READ_WRITE 
GO
