-- retrieve all customers
SELECT * FROM [User];

-- all couriers sent by a specific customer
SELECT * FROM Courier WHERE SenderName = 'Alice Kumar';


-- all courier records
SELECT * FROM Courier;


--  payment and location details for a specific courier
SELECT * FROM Payment WHERE CourierID = 3;

-- undelivered packages list
SELECT * FROM Courier WHERE Status != 'Delivered';

-- couriers scheduled for delivery today
SELECT * FROM Courier WHERE DeliveryDate = convert(DATE, getdate());

-- package specific status
SELECT * FROM Courier WHERE Status like '%Transit%';

-- total number of packages
SELECT SenderName, COUNT(CourierID) FROM Courier GROUP BY SenderName;

-- specific weight range
select courierID, weight from Courier where weight between 0 and 5

-- contains JOhn
SELECT * FROM Employee WHERE Name LIKE '%Mathews%';

-- courier > 50
SELECT * FROM Courier WHERE courierID in (select CourierID from payment where amount > 330);
