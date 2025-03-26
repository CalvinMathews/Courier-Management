--Task 4: Inner Join,Full Outer Join, Cross Join, Left Outer Join,Right Outer Join



--23. Retrieve Payments with Courier Information

	SELECT P.AMOUNT , P.PAYMENTID , C.* FROM Payment AS P JOIN Courier AS C ON P.CourierID = C.CourierID

--24. Retrieve Payments with Location Information
	
	SELECT P.AMOUNT , P.PAYMENTID , L.* FROM Payment AS P JOIN Location AS L ON P.LocationID = L.LocationID

--25. Retrieve Payments with Courier and Location Information

	SELECT C.*,L.*, P.AMOUNT , P.PAYMENTID FROM Payment P JOIN Location L ON P.LocationID = L.LocationID JOIN Courier C ON P.CourierID=C.CourierID

--26. List all payments with courier details
	SELECT P.PaymentID, P.Amount, P.PaymentDate, C.SenderName, C.ReceiverName, C.Status FROM Payment P JOIN Courier C ON P.CourierID = C.CourierID;

--27. Total payments received for each courier
	
	SELECT P.COURIERID, SUM(P.AMOUNT) AS TOTAL,  C.SenderName, C.ReceiverName FROM Payment P JOIN Courier C ON P.CourierID=C.CourierID GROUP BY P.CourierID,C.SenderName, C.ReceiverName;

--28. List payments made on a specific date
	
	SELECT * FROM Payment WHERE PaymentDate = '2025-03-18';

--29. Get Courier Information for Each Payment
	
	SELECT C.*, P.PaymentID, P.AMOUNT FROM Payment P JOIN Courier C ON P.CourierID=C.CourierID 


--30. Get Payment Details with Location
		
	SELECT P.* , L.* FROM Payment AS P JOIN Location AS L ON P.LocationID = L.LocationID

--31. Calculating Total Payments for Each Courier
	
	SELECT P.CourierID, SUM(P.Amount) AS TotalPayments FROM Payment P GROUP BY P.CourierID;

		
--32. List Payments Within a Date Range

	SELECT * FROM Payment WHERE PaymentDate BETWEEN CAST('2025-03-01' AS date) AND CAST('2025-03-31' AS date)

--33. Retrieve a list of all users and their corresponding courier records, including cases where there are no matches on either side
	
	SELECT U.UserID, U.Name, C.CourierID, C.SenderName, C.ReceiverName FROM [USER] JOIN Courier C ON U.UserID = C.UserID;

--34. Retrieve a list of all couriers and their corresponding services, including cases where there are no matches on either side
	


--35. Retrieve a list of all employees and their corresponding payments, including cases where there are
--no matches on either side

	SELECT EmployeeID, NAME, Salary FROM Employee

--36. List all users and all courier services, showing all possible combinations.
	
	SELECT U.UserID ,U.Name, C.ServiceName FROM [USER] U CROSS JOIN CourierServices C GROUP BY U.UserID ,U.Name, C.ServiceName ;

--37. List all employees and all locations, showing all possible combinations:
	
	SELECT E.Name, L.LocationName FROM Employee E CROSS JOIN Location L GROUP BY E.Name, L.LocationName;


--38. Retrieve a list of couriers and their corresponding sender information (if available)
	
	SELECT C.CourierID, U.UserID, C.SenderName, U.Email, U.Address,  U.ContactNumber FROM Courier C LEFT JOIN [USER] U ON C.SenderName = U.Name;

--39. Retrieve a list of couriers and their corresponding receiver information (if available):
	
	SELECT C.CourierID, C.ReceiverName, U.Email, U.Address,  U.ContactNumber FROM Courier C LEFT JOIN [USER] U ON C.ReceiverName = U.Name;


--40. Retrieve a list of couriers along with the courier service details (if available)

	SELECT C.CourierID, C.SenderName, CS.ServiceName FROM Courier C CROSS JOIN  CourierServices CS;

--41. Retrieve a list of employees and the number of couriers assigned to each employee:

	SELECT E.EmployeeID, E.Name, COUNT(C.CourierID) AS NumberOfCouriers FROM Employee E LEFT JOIN Courier C ON E.EmployeeID = C.EmployeeID GROUP BY E.EmployeeID, E.Name;

--42. Retrieve a list of locations and the total payment amount received at each location:
	
	SELECT L.LocationID, L.LocationName, SUM(P.Amount) AS TotalAmount from Location L LEFT JOIN Payment P ON L.LocationID = P.LocationID GROUP BY L.LocationID, L.LocationName

--43. Retrieve all couriers sent by the same sender (based on SenderName).

	SELECT DISTINCT SenderName, CourierID FROM Courier WHERE SenderName IN ( SELECT SenderName FROM Courier GROUP BY SenderName HAVING COUNT(*) >1)

--44. List all employees who share the same role.

	SELECT ROLE, EmployeeID , Name FROM Employee WHERE ROLE IN (SELECT Role FROM Employee GROUP BY Role HAVING COUNT(*) > 1) 

--45. Retrieve all payments made for couriers sent from the same location.

	SELECT C.SenderAddress, SUM(P.Amount), C.CourierID, COUNT(P.PaymentID) AS NumberOfPayments FROM Payment P JOIN Courier C ON P.CourierID = C.CourierID GROUP BY  C.SenderAddress

--46. Retrieve all couriers sent from the same location (based on SenderAddress).
	
	SELECT SenderAddress, COUNT(*) FROM Courier GROUP BY SenderAddress

--47. List employees and the number of couriers they have delivered:
	
	SELECT E.EmployeeID, E.NAME, COUNT(C.CourierID) AS TOTAL_COURIERS  FROM Employee AS E JOIN Courier C ON E.EmployeeID = C.EmployeeID WHERE C.Status= 'DELIVERED' GROUP BY E.EmployeeID,E.Name

--48. Find couriers that were paid an amount greater than the cost of their respective courier services
		
	SELECT e.EmployeeID, e.Name, COUNT(c.CourierID) AS TotalCouriersDelivered FROM Employee e LEFT JOIN Courier c ON e.EmployeeID = c.EmployeeID GROUP BY e.EmployeeID, e.Name;

--SCOPE

--49. Find couriers that have a weight greater than the average weight of all couriers

	SELECT * FROM Courier WHERE Weight > (SELECT AVG(Weight) FROM Courier)

--50. Find the names of all employees who have a salary greater than the average salary:

	SELECT Name from Employee where Salary>(SELECT AVG(Salary) from Employee)

--51. Find the total cost of all courier services where the cost is less than the maximum cost
	
	SELECT ServiceName from CourierServices WHERE Cost < (SELECT MAX(Cost) from CourierServices)

--52. Find all couriers that have been paid for
	
	Select * From Payment WHERE PaymentDate IS NOT NULL

--53. Find the locations where the maximum payment amount was made
	
	SELECT l.* FROM Location l JOIN ( SELECT LocationID, MAX(Amount) AS MaxPayment FROM Payment_Details GROUP BY LocationID) p ON l.Location_ID = p.LocationID WHERE p.MaxPayment = (SELECT MAX(Amount) FROM Payment_Details)
	
--54. Find all couriers whose weight is greater than the weight of all couriers sent by a specific sender(e.g., 'SenderName'):	SELECT * FROM Courier WHERE Weight > (SELECT MAX(c2.Weight) FROM Courier c1 JOIN Courier c2 ON c1.SenderName = c2.SenderName WHERE c1.SenderName = 'Rajesh Kumar')