

insert into Customers (CustomerID, CustomerName, CustomerContactNo, CustomerAddress, AlternatePhone, Email) 
values (3, 'Artemis Fowl', 88744822,'Defense, Lahore',NULL,'artemisfowl@gmail.com')
--update Customers set CustomerName = 'Magnus Chase' where CustomerID = 1
select * from Customers

insert into Categories (idCategories, CategoryName) values (4, 'Frozen')
select * from Categories

insert into FoodItem (FoodItemID, ItemName, Categories_idCategories) values (5, 'Chicken Tikka Roll', 3)
select * from FoodItem

insert into deal (DealID, DealPrice, ValidTill) values (3, 500, '2020-12-10')
select * from Deal


