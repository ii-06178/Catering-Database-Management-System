USE [cateringSystemDatabase]
GO
INSERT [dbo].[Admin] ([AdminID], [Name], [Role], [Email], [Password_2], [DateAdded]) VALUES (1, N'hana', N'TBD', N'hana@gmail.com', N'abcd1234', CAST(N'2020-11-18' AS Date))
INSERT [dbo].[Admin] ([AdminID], [Name], [Role], [Email], [Password_2], [DateAdded]) VALUES (2, N'ifrah', N'TBD', N'ifrah@gmail.com', N'1234abcd', CAST(N'2020-11-22' AS Date))
INSERT [dbo].[Admin] ([AdminID], [Name], [Role], [Email], [Password_2], [DateAdded]) VALUES (3, N'tasmiya', N'Owner', N'tas@gmail.com', N'1234abcd', CAST(N'2020-11-22' AS Date))
GO
INSERT [dbo].[Categories] ([CategoriesID], [CategoryName], [MeasuredIn]) VALUES (1, N'Rice', N'Weight (Kg)')
INSERT [dbo].[Categories] ([CategoriesID], [CategoryName], [MeasuredIn]) VALUES (2, N'Burgers', N'No. Of Units')
INSERT [dbo].[Categories] ([CategoriesID], [CategoryName], [MeasuredIn]) VALUES (3, N'Rolls', N'No. Of Units')
INSERT [dbo].[Categories] ([CategoriesID], [CategoryName], [MeasuredIn]) VALUES (4, N'Frozen', N'No. Of Units')
GO
INSERT [dbo].[Customers] ([CustomerID], [CustomerFName], [CustomerLName], [CustomerContactNo], [CustomerAddress], [AlternatePhone], [Email], [CreditCardNo]) VALUES (1, N'nancy', NULL, N'923983', N'Clifton, Karachi', N'0', N'nancydrew@gmail.com', N'1223')
INSERT [dbo].[Customers] ([CustomerID], [CustomerFName], [CustomerLName], [CustomerContactNo], [CustomerAddress], [AlternatePhone], [Email], [CreditCardNo]) VALUES (2, N'Artemis Fowl', NULL, N'124578989', N'Defense, Karachi', N'245767879', N'artemisfowl@gmail.com', N'0')
INSERT [dbo].[Customers] ([CustomerID], [CustomerFName], [CustomerLName], [CustomerContactNo], [CustomerAddress], [AlternatePhone], [Email], [CreditCardNo]) VALUES (3, N'Magnus Chase', NULL, N'0294739302', N'Malir, Karachi', N'0283890168', N'magnuschase@gmail.com', N'')
INSERT [dbo].[Customers] ([CustomerID], [CustomerFName], [CustomerLName], [CustomerContactNo], [CustomerAddress], [AlternatePhone], [Email], [CreditCardNo]) VALUES (4, N'Nancy Drew', NULL, N'0974828373', N'Defense, Karachi', NULL, N'nancydrew@gmail.com', N'')
INSERT [dbo].[Customers] ([CustomerID], [CustomerFName], [CustomerLName], [CustomerContactNo], [CustomerAddress], [AlternatePhone], [Email], [CreditCardNo]) VALUES (5, N'Tas', N'Malik', N'0309482934', N'Defense, Karachi', N'', N'tas@gmail.com', N'8371889283')
INSERT [dbo].[Customers] ([CustomerID], [CustomerFName], [CustomerLName], [CustomerContactNo], [CustomerAddress], [AlternatePhone], [Email], [CreditCardNo]) VALUES (6, N'Fifi', N'Jones', N'0088329031', N'Nazimabad, Karachi', N'', N'fifijones@gmail.com', N'')
INSERT [dbo].[Customers] ([CustomerID], [CustomerFName], [CustomerLName], [CustomerContactNo], [CustomerAddress], [AlternatePhone], [Email], [CreditCardNo]) VALUES (7, N'Ifrah', N'Ilyas', N'034058302', N'Nazimabad, Karachi', N'', N'ifrah@gmail.com', N'')
INSERT [dbo].[Customers] ([CustomerID], [CustomerFName], [CustomerLName], [CustomerContactNo], [CustomerAddress], [AlternatePhone], [Email], [CreditCardNo]) VALUES (8, N'Ifrah', N'Ilyas', N'0320308420', N'Nazimabad, karachi', N'', N'ifrah@gmail.com', N'')
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
GO
INSERT [dbo].[Ingredients] ([IngredientsID], [IngredientName], [ItemsInStock], [MeasuredIn]) VALUES (1, N'Tomatoes', 20, N'Weight (Kg)')
INSERT [dbo].[Ingredients] ([IngredientsID], [IngredientName], [ItemsInStock], [MeasuredIn]) VALUES (2, N'Rice', 20, N'Weight (Kg)')
INSERT [dbo].[Ingredients] ([IngredientsID], [IngredientName], [ItemsInStock], [MeasuredIn]) VALUES (3, N'Ginger', 20, N'Weight (Kg)')
INSERT [dbo].[Ingredients] ([IngredientsID], [IngredientName], [ItemsInStock], [MeasuredIn]) VALUES (4, N'Chicken', 20, N'Weight (Kg)')
INSERT [dbo].[Ingredients] ([IngredientsID], [IngredientName], [ItemsInStock], [MeasuredIn]) VALUES (5, N'Carrots', 20, N'Weight (Kg)')
INSERT [dbo].[Ingredients] ([IngredientsID], [IngredientName], [ItemsInStock], [MeasuredIn]) VALUES (6, N'Garlic', 20, N'Weight (Kg)')
INSERT [dbo].[Ingredients] ([IngredientsID], [IngredientName], [ItemsInStock], [MeasuredIn]) VALUES (7, N'Spices', 20, N'Weight (Kg)')
INSERT [dbo].[Ingredients] ([IngredientsID], [IngredientName], [ItemsInStock], [MeasuredIn]) VALUES (8, N'Onions', 30, N'Weight (Kg)')
INSERT [dbo].[Ingredients] ([IngredientsID], [IngredientName], [ItemsInStock], [MeasuredIn]) VALUES (9, N'Beef', 20, N'Weight (Kg)')
INSERT [dbo].[Ingredients] ([IngredientsID], [IngredientName], [ItemsInStock], [MeasuredIn]) VALUES (10, N'Flour', 20, N'Weight (Kg)')
INSERT [dbo].[Ingredients] ([IngredientsID], [IngredientName], [ItemsInStock], [MeasuredIn]) VALUES (11, N'White Bread', 20, N'No. Of Units')
INSERT [dbo].[Ingredients] ([IngredientsID], [IngredientName], [ItemsInStock], [MeasuredIn]) VALUES (12, N'Cheese', 5, N'Weight (Kg)')
INSERT [dbo].[Ingredients] ([IngredientsID], [IngredientName], [ItemsInStock], [MeasuredIn]) VALUES (13, N'Buns', 20, N'No. Of Units')
INSERT [dbo].[Ingredients] ([IngredientsID], [IngredientName], [ItemsInStock], [MeasuredIn]) VALUES (14, N'Eggs', 50, N'No. Of Units')
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
GO
INSERT [dbo].[Orders] ([OrderID], [Payment_PaymentID], [Region_RegionID], [Rider_RiderID], [Customers_CustomerID], [OrderDate], [RequiredDate], [ShippedDate], [OrderStatus], [TotalPrice]) VALUES (1, 1, 1, 1, 1, CAST(N'2020-11-12' AS Date), CAST(N'2020-11-12' AS Date), CAST(N'2020-11-30' AS Date), N'Dispatched', NULL)
INSERT [dbo].[Orders] ([OrderID], [Payment_PaymentID], [Region_RegionID], [Rider_RiderID], [Customers_CustomerID], [OrderDate], [RequiredDate], [ShippedDate], [OrderStatus], [TotalPrice]) VALUES (3, 3, 2, NULL, 7, CAST(N'2020-12-01' AS Date), CAST(N'2020-12-02' AS Date), NULL, N'In Process', 850.0000)
INSERT [dbo].[Orders] ([OrderID], [Payment_PaymentID], [Region_RegionID], [Rider_RiderID], [Customers_CustomerID], [OrderDate], [RequiredDate], [ShippedDate], [OrderStatus], [TotalPrice]) VALUES (4, 4, 2, NULL, 5, CAST(N'2020-12-05' AS Date), CAST(N'2020-12-05' AS Date), NULL, N'In Process', 700.0000)
INSERT [dbo].[Orders] ([OrderID], [Payment_PaymentID], [Region_RegionID], [Rider_RiderID], [Customers_CustomerID], [OrderDate], [RequiredDate], [ShippedDate], [OrderStatus], [TotalPrice]) VALUES (5, 5, 3, NULL, 6, CAST(N'2020-12-05' AS Date), CAST(N'2020-12-05' AS Date), NULL, N'In Process', 1140.0000)
INSERT [dbo].[Orders] ([OrderID], [Payment_PaymentID], [Region_RegionID], [Rider_RiderID], [Customers_CustomerID], [OrderDate], [RequiredDate], [ShippedDate], [OrderStatus], [TotalPrice]) VALUES (6, 6, 3, NULL, 7, CAST(N'2020-12-05' AS Date), CAST(N'2020-12-05' AS Date), NULL, N'In Process', 916.6667)
INSERT [dbo].[Orders] ([OrderID], [Payment_PaymentID], [Region_RegionID], [Rider_RiderID], [Customers_CustomerID], [OrderDate], [RequiredDate], [ShippedDate], [OrderStatus], [TotalPrice]) VALUES (7, 7, 3, NULL, 8, CAST(N'2020-12-05' AS Date), CAST(N'2020-12-05' AS Date), NULL, N'In Process', 650.0000)
GO
INSERT [dbo].[Payment] ([PaymentID], [PaymentType], [CashReceived], [CashReturned]) VALUES (1, N'COD', NULL, NULL)
INSERT [dbo].[Payment] ([PaymentID], [PaymentType], [CashReceived], [CashReturned]) VALUES (3, N'Credit Card', NULL, NULL)
INSERT [dbo].[Payment] ([PaymentID], [PaymentType], [CashReceived], [CashReturned]) VALUES (4, N'Credit Card', NULL, NULL)
INSERT [dbo].[Payment] ([PaymentID], [PaymentType], [CashReceived], [CashReturned]) VALUES (5, N'COD', NULL, NULL)
INSERT [dbo].[Payment] ([PaymentID], [PaymentType], [CashReceived], [CashReturned]) VALUES (6, N'COD', NULL, NULL)
INSERT [dbo].[Payment] ([PaymentID], [PaymentType], [CashReceived], [CashReturned]) VALUES (7, N'COD', NULL, NULL)
GO
INSERT [dbo].[Region] ([RegionID], [RegionDescription]) VALUES (1, N'Malir Cantt.')
INSERT [dbo].[Region] ([RegionID], [RegionDescription]) VALUES (2, N'Defense')
INSERT [dbo].[Region] ([RegionID], [RegionDescription]) VALUES (3, N'Nazimabad')
INSERT [dbo].[Region] ([RegionID], [RegionDescription]) VALUES (4, N'North Nazimabad')
INSERT [dbo].[Region] ([RegionID], [RegionDescription]) VALUES (5, N'Clifton')
INSERT [dbo].[Region] ([RegionID], [RegionDescription]) VALUES (6, N'Korangi')
INSERT [dbo].[Region] ([RegionID], [RegionDescription]) VALUES (7, N'Gulshan-e-Iqbal')
GO
INSERT [dbo].[Rider] ([RiderID], [RiderName], [RiderPhoneNo], [RiderCNIC], [RiderCompany], [RiderEmail], [RiderPassword]) VALUES (1, N'Ali Ahmed', N'0303032992', N'35202-939393-2', N'XYZ', N'aliahmed@gmail.com', N'kajhdkaa')
INSERT [dbo].[Rider] ([RiderID], [RiderName], [RiderPhoneNo], [RiderCNIC], [RiderCompany], [RiderEmail], [RiderPassword]) VALUES (2, N'Muhammad Umar', N'0038010012', N'35202-9384829-7', N'ABC', N'mumar@gmail.com', N'ksjadjwadh')
INSERT [dbo].[Rider] ([RiderID], [RiderName], [RiderPhoneNo], [RiderCNIC], [RiderCompany], [RiderEmail], [RiderPassword]) VALUES (3, N'Najam Kamal', N'03049783893', N'35202-45636-6', N'PQR', N'najam@gmail.com', N'kkjksklls')
INSERT [dbo].[Rider] ([RiderID], [RiderName], [RiderPhoneNo], [RiderCNIC], [RiderCompany], [RiderEmail], [RiderPassword]) VALUES (4, N'Taemoor Kamal', N'00929838902', N'35202-7938274-3', N'PQR', N'taemoor@gmail.com', N'assadasa')
INSERT [dbo].[Rider] ([RiderID], [RiderName], [RiderPhoneNo], [RiderCNIC], [RiderCompany], [RiderEmail], [RiderPassword]) VALUES (5, N'Jameel Khan', N'033458923', N'35202-882922-3', N'ABC', N'jameel@gmail.com', N'ui887oi')
INSERT [dbo].[Rider] ([RiderID], [RiderName], [RiderPhoneNo], [RiderCNIC], [RiderCompany], [RiderEmail], [RiderPassword]) VALUES (6, N'Muhammad Hasan', N'03299379234', N'35202-888833-3', N'XYZ', N'mhasan@gmail.com', N'jd73kksf')
GO
