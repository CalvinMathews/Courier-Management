--Task 2: Select,Where

--1. List all customers:
	SELECT * FROM [USER];

--2. List all orders for a specific customer:
	sp_help	courier
	SELECT * FROM Courier WHERE SenderName = 'Amit Sharma';

--3. List all couriers:
	SELECT * FROM Courier;

--4. List all packages for a specific order:
	SELECT * FROM Courier where CourierID = '12'

--5. List all deliveries for a specific courier:
	SELECT * FROM Courier WHERE CourierID = '25'

--6. List all undelivered packages:
	SELECT * FROM Courier WHERE Status NOT IN ('DELIVERED')
--7. List all packages that are scheduled for delivery today:
	SELECT * FROM Courier WHERE DeliveryDate =CAST(GETDATE() AS DATE)
--8. List all packages with a specific status:
	SELECT CourierID FROM Courier WHERE Status = 'IN TRANSIT';
--9. Calculate the total number of packages for each courier.
	SELECT COUNT(TRACKINGNUMBER) AS [COUNT OF PACKAGES] FROM Courier WHERE CourierID =15
--10. Find the average delivery time for each courier
	SELECT DATEDIFF(DAY,P.PAYMENTDATE,D.DELIVERYDATE) AS [AVERAGE DELIVERY TIME] FROM Courier AS D JOIN Payment AS P ON D.CourierID=P.CourierID
--11. List all packages with a specific weight range:
	SELECT * FROM Courier WHERE Weight BETWEEN 2 AND 6
--12. Retrieve employees whose names contain 'John'
	SELECT * FROM Employee;
	UPDATE Employee SET NAME = 'John Smith' WHERE EmployeeID = '1005'
	UPDATE Employee SET NAME = 'Calvin John' WHERE EmployeeID = '1004'
	SELECT EmployeeID, Name  FROM Employee WHERE NAME LIKE'%JOHN%'
--13. Retrieve all courier records with payments greater than $50.
	SELECT * FROM Courier JOIN Payment ON Courier.CourierID = Payment.CourierID WHERE Amount > 50


	--SOME QUERIES INNER JOIN WAS USED - WHERE MATCHING RECORDS ARE WITHDRAWN
	--DATEDDIFF - TO FIND THE DIFFERENCE BTW TWO DATES 
	--COUNT - TO COUNT THE NUMBER OF OCCURENCES 
	--SP_HELP - TO UNDERSTAND THE SCHEMA OF THE DATABASE OR TABLE 
	--like - used to filter based on characters - % for zero or multiple characters -_ for single character