CREATE TABLE Ingredients (
  IngredientsID INTEGER NOT NULL,
  IngredientName VARCHAR(50) NULL,
  ItemsInStock INTEGER NULL,
  PRIMARY KEY(IngredientsID)
);

CREATE TABLE Payment (
  PaymentID INTEGER NOT NULL,
  PaymentType VARCHAR(25) NULL,
  CashReceived INTEGER NULL,
  CashReturned INTEGER NULL,
  PRIMARY KEY(PaymentID)
);

CREATE TABLE Region (
  RegionID INTEGER  NOT NULL ,
  RegionDescription VARCHAR(100) NULL,
  PRIMARY KEY(RegionID)
);

CREATE TABLE Deal (
  DealID INTEGER NOT NULL ,
  DealPrice INTEGER NOT NULL,
  ValidFrom DATE NULL,
  ValidTill DATE NULL,
  PRIMARY KEY(DealID)
);

CREATE TABLE Customers (
  CustomerID INTEGER  NOT NULL ,
  CustomerName VARCHAR(50) NOT NULL,
  CustomerContactNo INTEGER  NOT NULL,
  CustomerAddress VARCHAR(100) NOT NULL,
  AlternatePhone INTEGER  NULL,
  Email VARCHAR(100) NULL,
  CreditCardNo INTEGER  NULL,
  PRIMARY KEY(CustomerID)
);

CREATE TABLE Admin (
  AdminID INTEGER  NOT NULL ,
  Name VARCHAR(25) NULL,
  Email VARCHAR(100) NULL,
  Password_2 VARCHAR(50) NULL,
  DateAdded DATE NULL,
  PRIMARY KEY(AdminID)
);

CREATE TABLE Categories (
  CategoriesID INTEGER  NOT NULL ,
  CategoryName VARCHAR(30) NULL,
  MeasuredIn VARCHAR(20) NULL,
  PRIMARY KEY(CategoriesID)
);

CREATE TABLE Rider (
  RiderID INTEGER  NOT NULL ,
  Region_RegionID INTEGER  NOT NULL,
  RiderName VARCHAR(50) NOT NULL,
  RiderPhoneNo INTEGER  NOT NULL,
  RiderCNIC INTEGER  NOT NULL,
  RiderCompany VARCHAR(50) NULL,
  RiderEmail VARCHAR(100) NULL,
  RiderPassword VARCHAR(50) NULL,
  PRIMARY KEY(RiderID),
  INDEX Rider_FKIndex1(Region_RegionID)
);

CREATE TABLE FoodItem (
  FoodItemID INTEGER  NOT NULL ,
  Categories_CategoriesID INTEGER  NOT NULL,
  ItemName VARCHAR(30) NULL,
  UnitPrice INTEGER  NULL,
  PRIMARY KEY(FoodItemID),
  INDEX FoodItem_FKIndex1(Categories_CategoriesID)
);

CREATE TABLE Deal_has_FoodItem (
  Deal_DealID INTEGER NOT NULL,
  FoodItem_FoodItemID INTEGER  NOT NULL,
  PRIMARY KEY(Deal_DealID, FoodItem_FoodItemID),
  INDEX Deal_has_FoodItem_FKIndex1(Deal_DealID),
  INDEX Deal_has_FoodItem_FKIndex2(FoodItem_FoodItemID)
);

CREATE TABLE Ingredients_for_FoodItem (
  FoodItem_FoodItemID INTEGER  NOT NULL,
  Ingredients_IngredientsID INTEGER NOT NULL,
  Quantity INTEGER NULL,
  PRIMARY KEY(FoodItem_FoodItemID, Ingredients_IngredientsID),
  INDEX FoodItem_has_Supplies_FKIndex1(FoodItem_FoodItemID),
  INDEX FoodItem_has_Supplies_FKIndex2(Ingredients_IngredientsID)
);

CREATE TABLE Orders (
  OrderID INTEGER NOT NULL ,
  Payment_PaymentID INTEGER NOT NULL,
  Region_RegionID INTEGER  NOT NULL,
  Rider_RiderID INTEGER  NULL,
  Customers_CustomerID INTEGER  NOT NULL,
  OrderDate DATE NOT NULL,
  RequiredDate DATE NOT NULL,
  ShippedDate DATE NULL,
  OrderStatus VARCHAR(50) NOT NULL,
  TotalPrice INTEGER NULL,
  PRIMARY KEY(OrderID),
  INDEX Orders_FKIndex1(Customers_CustomerID),
  INDEX Orders_FKIndex2(Rider_RiderID),
  INDEX Orders_FKIndex3(Region_RegionID),
  INDEX Orders_FKIndex4(Payment_PaymentID)
);

CREATE TABLE WeeklyMenu (
  WeeklyMenuID INTEGER  NOT NULL ,
  WeekDay VARCHAR(25) NOT NULL,
  FoodItem_FoodItemID INTEGER  NOT NULL,
  Date DATE NULL,
  PRIMARY KEY(WeeklyMenuID, WeekDay),
  INDEX WeeklyMenu_FKIndex1(FoodItem_FoodItemID)
);

CREATE TABLE WeeklyMenu_has_Orders (
  WeeklyMenu_WeeklyMenuID INTEGER  NOT NULL,
  Orders_OrderID INTEGER NOT NULL,
  WeeklyMenu_WeekDay VARCHAR(25) NOT NULL,
  Quantity INTEGER  NULL,
  Discount INTEGER  NULL,
  UnitPrice INTEGER  NULL,
  PRIMARY KEY(WeeklyMenu_WeeklyMenuID, Orders_OrderID, WeeklyMenu_WeekDay),
  INDEX WeeklyMenu_has_Orders_FKIndex1(WeeklyMenu_WeeklyMenuID, WeeklyMenu_WeekDay),
  INDEX WeeklyMenu_has_Orders_FKIndex2(Orders_OrderID)
);

CREATE TABLE Deal_has_Orders (
  Deal_DealID INTEGER NOT NULL,
  Orders_OrderID INTEGER NOT NULL,
  NoOfDeals INTEGER NULL,
  UnitPrice INTEGER NULL,
  PRIMARY KEY(Deal_DealID, Orders_OrderID),
  INDEX Deal_has_Orders_FKIndex1(Deal_DealID),
  INDEX Deal_has_Orders_FKIndex2(Orders_OrderID)
);

CREATE TABLE OrderbyItem (
  Orders_OrderID INTEGER NOT NULL,
  FoodItem_FoodItemID INTEGER  NOT NULL,
  Quantity INTEGER NULL,
  Discount INTEGER NULL,
  UnitPrice INTEGER NOT NULL,
  Weight INTEGER NULL,
  PRIMARY KEY(Orders_OrderID),
  INDEX Items_has_Orders_FKIndex2(Orders_OrderID),
  INDEX OrderbyItem_FKIndex2(FoodItem_FoodItemID)
);


