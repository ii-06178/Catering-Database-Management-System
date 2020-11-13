CREATE TABLE Region (
  idRegion INTEGER  NOT NULL ,
  RegionDescription VARCHAR NULL,
  PRIMARY KEY(idRegion)
);

CREATE TABLE Ingredients (
  idIngredients INTEGER  NOT NULL ,
  IngredientName VARCHAR NULL,
  ItemsInStock INTEGER  NULL,
  PRIMARY KEY(idIngredients)
);

CREATE TABLE ServingType (
  TypeID INTEGER  NOT NULL ,
  TypeName VARCHAR NULL,
  PRIMARY KEY(TypeID)
);

CREATE TABLE Payment (
  idPayment INTEGER NOT NULL,
  Type_2 VARCHAR NULL,
  CashReceived INTEGER NULL,
  CashReturned INTEGER NULL,
  PRIMARY KEY(idPayment)
);

CREATE TABLE Customers (
  CustomerID INTEGER  NOT NULL ,
  CustomerName VARCHAR NOT NULL,
  CustomerContactNo INTEGER  NOT NULL,
  CustomerAddress VARCHAR NOT NULL,
  AlternatePhone INTEGER  NULL,
  Email VARCHAR NULL,
  PRIMARY KEY(CustomerID)
);

CREATE TABLE Categories (
  idCategories INTEGER  NOT NULL ,
  CategoryName VARCHAR NULL,
  PRIMARY KEY(idCategories)
);

CREATE TABLE Deal (
  DealID INTEGER  NOT NULL ,
  DealPrice INTEGER  NOT NULL,
  ValidTill DATE NULL,
  PRIMARY KEY(DealID)
);

CREATE TABLE Rider (
  RiderID INTEGER  NOT NULL ,
  Region_idRegion INTEGER  NOT NULL,
  RiderName VARCHAR NOT NULL,
  RiderPhoneNo INTEGER  NOT NULL,
  RiderCNIC INTEGER  NOT NULL,
  RiderCompany VARCHAR NULL,
  PRIMARY KEY(RiderID),
  INDEX Rider_FKIndex1(Region_idRegion)
);

CREATE TABLE FoodItem (
  FoodItemID INTEGER  NOT NULL ,
  ItemName VARCHAR NULL,
  Categories_idCategories INTEGER  NOT NULL,
  PRIMARY KEY(FoodItemID),
  INDEX FoodItem_FKIndex1(Categories_idCategories)
);

CREATE TABLE Ingredients_for_FoodItem (
  Ingredients_idIngredients INTEGER  NOT NULL,
  FoodItem_FoodItemID INTEGER  NOT NULL,
  Quantity INTEGER  NULL,
  PRIMARY KEY(Ingredients_idIngredients, FoodItem_FoodItemID),
  INDEX FoodItem_has_Supplies_FKIndex1(FoodItem_FoodItemID),
  INDEX FoodItem_has_Supplies_FKIndex2(Ingredients_idIngredients)
);

CREATE TABLE Deal_has_FoodItem (
  Deal_DealID INTEGER  NOT NULL,
  FoodItem_FoodItemID INTEGER  NOT NULL,
  PRIMARY KEY(Deal_DealID, FoodItem_FoodItemID),
  INDEX Deal_has_FoodItem_FKIndex1(Deal_DealID),
  INDEX Deal_has_FoodItem_FKIndex2(FoodItem_FoodItemID)
);

CREATE TABLE ItemPriceByServing (
  ServingType_TypeID INTEGER  NOT NULL,
  FoodItem_FoodItemID INTEGER  NOT NULL,
  UnitPrice INTEGER  NULL,
  Amount INTEGER  NULL,
  PRIMARY KEY(ServingType_TypeID, FoodItem_FoodItemID),
  INDEX OrderType_has_FoodItem_FKIndex1(ServingType_TypeID),
  INDEX OrderType_has_FoodItem_FKIndex2(FoodItem_FoodItemID)
);

CREATE TABLE Orders (
  OrderID INTEGER  NOT NULL ,
  Payment_idPayment INTEGER NOT NULL,
  Region_idRegion INTEGER  NOT NULL,
  Rider_RiderID INTEGER  NULL,
  Customers_CustomerID INTEGER  NOT NULL,
  OrderDate DATE NOT NULL,
  RequiredDate DATE NOT NULL,
  ShippedDate DATE NULL,
  OrderStatus VARCHAR NOT NULL,
  TotalPrice INTEGER  NULL,
  PRIMARY KEY(OrderID),
  INDEX Orders_FKIndex1(Customers_CustomerID),
  INDEX Orders_FKIndex2(Rider_RiderID),
  INDEX Orders_FKIndex3(Region_idRegion),
  INDEX Orders_FKIndex4(Payment_idPayment)
);

CREATE TABLE WeeklyMenu (
  WeeklyMenuID INTEGER  NOT NULL ,
  FoodItem_FoodItemID INTEGER  NOT NULL,
  Day_2 VARCHAR NULL,
  Date DATE NULL,
  PRIMARY KEY(WeeklyMenuID),
  INDEX WeeklyMenu_FKIndex1(FoodItem_FoodItemID)
);

CREATE TABLE WeeklyMenu_has_Orders (
  WeeklyMenu_WeeklyMenuID INTEGER  NOT NULL,
  Orders_OrderID INTEGER  NOT NULL,
  Quantity INTEGER  NULL,
  Discount INTEGER  NULL,
  UnitPrice INTEGER  NULL,
  PRIMARY KEY(WeeklyMenu_WeeklyMenuID, Orders_OrderID),
  INDEX WeeklyMenu_has_Orders_FKIndex1(WeeklyMenu_WeeklyMenuID),
  INDEX WeeklyMenu_has_Orders_FKIndex2(Orders_OrderID)
);

CREATE TABLE Deal_has_Orders (
  Deal_DealID INTEGER  NOT NULL,
  Orders_OrderID INTEGER  NOT NULL,
  Quantity INTEGER  NULL,
  Discount INTEGER  NULL,
  UnitPrice INTEGER  NULL,
  PRIMARY KEY(Deal_DealID, Orders_OrderID),
  INDEX Deal_has_Orders_FKIndex1(Deal_DealID),
  INDEX Deal_has_Orders_FKIndex2(Orders_OrderID)
);

CREATE TABLE OrderbyItem (
  Orders_OrderID INTEGER  NOT NULL,
  ItemPriceByServing_FoodItem_FoodItemID INTEGER  NOT NULL,
  ItemPriceByServing_ServingType_TypeID INTEGER  NOT NULL,
  Quantity INTEGER  NULL,
  Discount INTEGER  NULL,
  UnitPrice INTEGER  NULL,
  PRIMARY KEY(Orders_OrderID),
  INDEX Items_has_Orders_FKIndex2(Orders_OrderID),
  INDEX OrderDetails_FKIndex2(ItemPriceByServing_ServingType_TypeID, ItemPriceByServing_FoodItem_FoodItemID)
);


