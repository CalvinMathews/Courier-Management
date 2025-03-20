-- TO create the Database
CREATE database CourierServiceSystem
-- Execute Queries in a particular database
Use CourierServiceSystem

GO
-- Create the following tables
CREATE TABLE [USER](UserID INT PRIMARY KEY, 
					Name VARCHAR(255), 
					Email VARCHAR(255) UNIQUE,
					Password VARCHAR(255),
					ContactNumber VARCHAR(20),
					Address TEXT);

--(to batch seperate the sql statements GO is used)
GO
CREATE TABLE Courier (
    CourierID INT PRIMARY KEY,
    SenderName VARCHAR(255) NOT NULL,
    SenderAddress TEXT NOT NULL,
    ReceiverName VARCHAR(255) NOT NULL,
    ReceiverAddress TEXT NOT NULL,
    Weight DECIMAL(5, 2) NOT NULL,
    Status VARCHAR(50) NOT NULL,
    TrackingNumber VARCHAR(20) UNIQUE NOT NULL,
    DeliveryDate DATE);
GO
CREATE TABLE CourierServices(
	ServiceID INT PRIMARY KEY,
	ServiceName VARCHAR(100),
	Cost DECIMAL(8,2));
GO
CREATE TABLE Employee(
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(255),
    Email VARCHAR(255) UNIQUE,
    ContactNumber VARCHAR(20),
    Role VARCHAR(50)NOT NULL,
    Salary DECIMAL(10, 2) NOT NULL);
GO
CREATE TABLE Location(
    LocationID INT PRIMARY KEY,
    LocationName VARCHAR(100),
    Address TEXT);
GO
CREATE TABLE Payment(
    PaymentID INT PRIMARY KEY,
    CourierID INT,
    LocationID INT,
    Amount DECIMAL(10, 2),
    PaymentDate DATE,
    FOREIGN KEY (CourierID) REFERENCES Courier(CourierID) ON DELETE CASCADE,
    FOREIGN KEY (LocationID) REFERENCES Location(LocationID) ON DELETE CASCADE
);


--ON DELETE or ON UPDATE CASCADE - Query of delete or update is executed on primary key table, the child rows are deleted or updated.
