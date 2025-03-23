--Task 2: Select,Where

--1. List all customers:
	SELECT * FROM [USER];

--2. List all orders for a specific customer:
	sp_help	courier
	SELECT * FROM Courier WHERE SenderName = 'Amit Sharma';

--3. List all couriers:
	SELECT * FROM Courier;

--4. List all packages for a specific order:
	