

insert into Customers (CustomerID, CustomerName, CustomerContactNo, CustomerAddress, AlternatePhone, Email) 
values (1, 'Artemis Fowl', 88744822,'Defense, Lahore',NULL,'artemisfowl@gmail.com')
--update Customers set CustomerName = 'Magnus Chase' where CustomerID = 1
select * from Customers

insert into Categories (idCategories, CategoryName) values (4, 'Frozen')
select * from Categories

insert into FoodItem (FoodItemID, ItemName, Categories_idCategories) values (5, 'Chicken Tikka Roll', 3)
select * from FoodItem

insert into deal (DealID, DealPrice, ValidTill) values (3, 500, '2020-12-10')
select * from Deal

insert into Deal_has_FoodItem(Deal_DealID, FoodItem_FoodItemID) values (3, 5)
select * from Deal_has_FoodItem

insert into orders (orderid,Payment_PaymentID, Region_RegionID,Rider_RiderID,Customers_CustomerID, OrderDate, RequiredDate, OrderStatus) values (2,2,1,1,1, '2020-11-12','2020-11-12','In Process')
select * from orders

update FoodItem set UnitQuantity = 0.5 where FoodItemID = 2
select * from FoodItem

insert into region (regionID, regionDescription) values (1, 'Malir')
select * from region






insert into Customers (CustomerID, CustomerName, CustomerContactNo, CustomerAddress, alternatePhone, Email, creditCardNo) 
values ((select max(CustomerID) from Customers)+1, 'Nancy Drew', '0974828373', 'Defense, Karachi', null, 'nancydrew@gmail.com', null) 
where not exists (select * from Customers where CustomerName = 'Nancy Drew' and CustomerContactNo = '0974828373' and Email = 'nancydrew@gmail.com' and CustomerAddress = 'Defense, Karachi' and CreditCardNo = null) 

select * from Customers

