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


-- Insert Sample data into the table

-- User
INSERT INTO [USER] (UserID, Name, Email, Password, ContactNumber, Address) VALUES
(1001, 'Rajesh Kumar', 'rajesh.kumar@gmail.com', 'f3x9pd2t*', '9876543210', '123 MG Road, Bangalore, Karnataka, India, 560001'),
(1002, 'Amit Sharma', 'amit.sharma@hotmail.com', '5b7qNcL#', '9876543211', 'B-10, Shastri Nagar, Delhi, Delhi, India, 110052'),
(1003, 'Anjali Patel', 'anjali.patel@outlook.com', 't!fE93z@', '9876543212', 'Flat 2B, Sagar Apartments, Linking Road, Mumbai, Maharashtra, India, 400050'),
(1004, 'Emily Davis', 'emily.davis@gmail.com', 'Pa$sw0rd123', '2025550189', '456 Broadway St, New York, NY, USA, 10013'),
(1005, 'John Smith', 'john.smith@hotmail.com', 'jOhn@007', '2025550190', '742 Evergreen Terrace, Los Angeles, CA, USA, 90001'),
(1006, 'Olivia Johnson', 'olivia.johnson@outlook.com', 'XyZ!4567', '2025550191', '1234 Lakeside Ave, Chicago, IL, USA, 60601'),
(1007, 'Sophia Williams', 'sophia.williams@gmail.com', 'W!lL3n89*', '2025550192', '789 Ocean Drive, Miami Beach, FL, USA, 33139'),
(1008, 'Liam Brown', 'liam.brown@hotmail.com', 'bR!ghT$56', '2025550193', '101 Pine Street, Houston, TX, USA, 77002'),
(1009, 'Chloe Evans', 'chloe.evans@outlook.com', 'ChL0e@987', '2025550194', '2020 Mission Street, San Francisco, CA, USA, 94110'),
(1010, 'Mia Taylor', 'mia.taylor@gmail.com', 'mI@0jRs3', '2025550195', '123 Main St, Dallas, TX, USA, 75201'),
(1011, 'Luca Rossi', 'luca.rossi@hotmail.com', 'lUc@1234', '+39 02 1234567', 'Piazza del Duomo 1, Milan, Italy, 20122'),
(1012, 'Sofia Ferrari', 'sofia.ferrari@outlook.com', 'F3rr@!2pa', '+39 02 2345678', 'Via Nazionale 45, Rome, Italy, 00184'),
(1013, 'Hannah Müller', 'hannah.mueller@gmail.com', 'MuElL3r@!1', '+49 30 1234567', 'Kurfuerstendamm 10, Berlin, Germany, 10719'),
(1014, 'Maximilian Schmidt', 'maximilian.schmidt@hotmail.com', 'M@xim12345', '+49 89 2345678', 'Marienplatz 8, Munich, Germany, 80331'),
(1015, 'Sophie Dupont', 'sophie.dupont@outlook.com', 'DupOnT!r', '+33 1 23456789', '12 Rue de Rivoli, Paris, France, 75001'),
(1016, 'Julien Martin', 'julien.martin@gmail.com', 'J@l!nM88', '+33 4 23456789', '19 Boulevard Saint-Germain, Lyon, France, 69005'),
(1017, 'Mia Johansson', 'mia.johansson@hotmail.com', 'M!@1Joh2', '+46 8 1234567', 'Sveavägen 45, Stockholm, Sweden, 11134'),
(1018, 'Oscar Lindgren', 'oscar.lindgren@outlook.com', 'Osc@r456', '+46 31 2345678', 'Kungsportsavenyn 20, Gothenburg, Sweden, 41136'),
(1019, 'Charlotte Miller', 'charlotte.miller@gmail.com', 'C#harl3tT@!9', '+44 20 71234567', '221B Baker Street, London, UK, NW1 6XE'),
(1020, 'William Taylor', 'william.taylor@hotmail.com', 'W!llT@l3r98', '+44 161 1234567', 'Flat 2, 10 Downing Street, Manchester, UK, M1 2AG'),
(1021, 'Ahmed Al-Farsi', 'ahmed.alfarsi@gmail.com', 'Ahm@d1234', '+966 11 2345678', 'King Fahd Road, Riyadh, Saudi Arabia, 11421'),
(1022, 'Fatima Al-Mansoori', 'fatima.almansoori@hotmail.com', 'F@tima4567', '+971 4 1234567', 'Sheikh Zayed Road, Dubai, UAE, 00001'),
(1023, 'Sara Al-Dosari', 'sara.aldosari@outlook.com', 'S@r@!4567', '+966 50 2345678', 'Al Khobar, Eastern Province, Saudi Arabia, 34435'),
(1024, 'Mohammed Al-Hassan', 'mohammed.alhassan@gmail.com', 'M0h@dd7#', '+966 55 1234567', 'Al Haram, Mecca, Saudi Arabia, 24231'),
(1025, 'Noah King', 'noah.king@hotmail.com', 'K!nGnoah89', '2025550196', '1600 Pennsylvania Avenue, Washington, DC, USA, 20500'),
(1026, 'Lucas Garcia', 'lucas.garcia@outlook.com', 'LuC@!23Gar', '2025550197', '24 Beacon Street, Boston, MA, USA, 02108'),
(1027, 'Isabella Martinez', 'isabella.martinez@gmail.com', 'I$ab3llA!8', '2025550198', '400 E Van Buren St, Phoenix, AZ, USA, 85004'),
(1028, 'David Harris', 'david.harris@hotmail.com', 'Dav1d#123', '2025550199', '600 N Griffin St, Dallas, TX, USA, 75202'),
(1029, 'Ethan Clark', 'ethan.clark@outlook.com', 'Eth@1234Cl', '2025550200', '700 W 6th St, Austin, TX, USA, 78701'),
(1030, 'Ava Lewis', 'ava.lewis@gmail.com', 'Av@L3w123', '2025550201', '1001 Colorado Blvd, Denver, CO, USA, 80206');

-- Courier
INSERT INTO Courier (CourierID, SenderName, SenderAddress, ReceiverName, ReceiverAddress, Weight, Status, TrackingNumber, DeliveryDate) VALUES
(1, 'Rajesh Kumar', '123 MG Road, Bangalore, Karnataka, India, 560001', 'John Smith', '742 Evergreen Terrace, Los Angeles, CA, USA, 90001', 5.50, 'In Transit', 'TRK1234', '2025-03-20'),
(2, 'Amit Sharma', 'B-10, Shastri Nagar, Delhi, Delhi, India, 110052', 'Olivia Johnson', '1234 Lakeside Ave, Chicago, IL, USA, 60601', 2.30, 'Delivered', 'TRK1235', '2025-03-18'),
(3, 'Anjali Patel', 'Flat 2B, Sagar Apartments, Linking Road, Mumbai, Maharashtra, India, 400050', 'Sophia Williams', '789 Ocean Drive, Miami Beach, FL, USA, 33139', 8.00, 'Pending', 'TRK1236', '2025-03-25'),
(4, 'Emily Davis', '456 Broadway St, New York, NY, USA, 10013', 'Chloe Evans', '2020 Mission Street, San Francisco, CA, USA, 94110', 3.75, 'Delivered', 'TRK1237', '2025-03-22'),
(5, 'John Smith', '742 Evergreen Terrace, Los Angeles, CA, USA, 90001', 'Rajesh Kumar', '123 MG Road, Bangalore, Karnataka, India, 560001', 6.00, 'In Transit', 'TRK1238', '2025-03-15'),
(6, 'Olivia Johnson', '1234 Lakeside Ave, Chicago, IL, USA, 60601', 'Luca Rossi', 'Piazza del Duomo 1, Milan, Italy, 20122', 9.50, 'Cancelled', 'TRK1239', '2025-04-01'),
(7, 'Sophia Williams', '789 Ocean Drive, Miami Beach, FL, USA, 33139', 'Mia Johansson', 'Sveavägen 45, Stockholm, Sweden, 11134', 4.20, 'Delivered', 'TRK1240', '2025-03-17'),
(8, 'Liam Brown', '101 Pine Street, Houston, TX, USA, 77002', 'Charlotte Miller', '221B Baker Street, London, UK, NW1 6XE', 7.25, 'In Transit', 'TRK1241', '2025-03-19'),
(9, 'Chloe Evans', '2020 Mission Street, San Francisco, CA, USA, 94110', 'Lucas Garcia', '24 Beacon Street, Boston, MA, USA, 02108', 3.50, 'Delivered', 'TRK1242', '2025-03-20'),
(10, 'Mia Taylor', '123 Main St, Dallas, TX, USA, 75201', 'David Harris', '600 N Griffin St, Dallas, TX, USA, 75202', 6.75, 'Pending', 'TRK1243', '2025-03-30'),
(11, 'Luca Rossi', 'Piazza del Duomo 1, Milan, Italy, 20122', 'Sophie Dupont', '12 Rue de Rivoli, Paris, France, 75001', 4.10, 'Delivered', 'TRK1244', '2025-03-10'),
(12, 'Sofia Ferrari', 'Via Nazionale 45, Rome, Italy, 00184', 'Hannah Müller', 'Kurfuerstendamm 10, Berlin, Germany, 10719', 5.90, 'Cancelled', 'TRK1245', '2025-04-03'),
(13, 'Hannah Müller', 'Kurfuerstendamm 10, Berlin, Germany, 10719', 'Maximilian Schmidt', 'Marienplatz 8, Munich, Germany, 80331', 8.50, 'In Transit', 'TRK1246', '2025-03-14'),
(14, 'Maximilian Schmidt', 'Marienplatz 8, Munich, Germany, 80331', 'Mia Johansson', 'Sveavägen 45, Stockholm, Sweden, 11134', 3.60, 'Delivered', 'TRK1247', '2025-03-23'),
(15, 'Sophie Dupont', '12 Rue de Rivoli, Paris, France, 75001', 'Julien Martin', '19 Boulevard Saint-Germain, Lyon, France, 69005', 7.80, 'Pending', 'TRK1248', '2025-03-28'),
(16, 'Julien Martin', '19 Boulevard Saint-Germain, Lyon, France, 69005', 'Oscar Lindgren', 'Kungsportsavenyn 20, Gothenburg, Sweden, 41136', 4.90, 'Delivered', 'TRK1249', '2025-03-21'),
(17, 'Mia Johansson', 'Sveavägen 45, Stockholm, Sweden, 11134', 'Charlotte Miller', '221B Baker Street, London, UK, NW1 6XE', 2.70, 'Delivered', 'TRK1250', '2025-03-13'),
(18, 'Oscar Lindgren', 'Kungsportsavenyn 20, Gothenburg, Sweden, 41136', 'David Harris', '600 N Griffin St, Dallas, TX, USA, 75202', 6.20, 'In Transit', 'TRK1251', '2025-04-02'),
(19, 'Charlotte Miller', '221B Baker Street, London, UK, NW1 6XE', 'Ethan Clark', '700 W 6th St, Austin, TX, USA, 78701', 3.10, 'Pending', 'TRK1252', '2025-03-18'),
(20, 'William Taylor', 'Flat 2, 10 Downing Street, Manchester, UK, M1 2AG', 'Ava Lewis', '1001 Colorado Blvd, Denver, CO, USA, 80206', 5.10, 'Delivered', 'TRK1253', '2025-03-27'),
(21, 'Ahmed Al-Farsi', 'King Fahd Road, Riyadh, Saudi Arabia, 11421', 'Fatima Al-Mansoori', 'Sheikh Zayed Road, Dubai, UAE, 00001', 9.30, 'In Transit', 'TRK1254', '2025-04-05'),
(22, 'Fatima Al-Mansoori', 'Sheikh Zayed Road, Dubai, UAE, 00001', 'Sara Al-Dosari', 'Al Khobar, Eastern Province, Saudi Arabia, 34435', 7.60, 'Delivered', 'TRK1255', '2025-03-29'),
(23, 'Sara Al-Dosari', 'Al Khobar, Eastern Province, Saudi Arabia, 34435', 'Mohammed Al-Hassan', 'Al Haram, Mecca, Saudi Arabia, 24231', 4.80, 'Cancelled', 'TRK1256', '2025-03-16'),
(24, 'Mohammed Al-Hassan', 'Al Haram, Mecca, Saudi Arabia, 24231', 'John Smith', '742 Evergreen Terrace, Los Angeles, CA, USA, 90001', 6.40, 'In Transit', 'TRK1257', '2025-03-19'),
(25, 'Noah King', '1600 Pennsylvania Avenue, Washington, DC, USA, 20500', 'Liam Brown', '101 Pine Street, Houston, TX, USA, 77002', 3.00, 'Delivered', 'TRK1258', '2025-03-24'),
(26, 'Lucas Garcia', '24 Beacon Street, Boston, MA, USA, 02108', 'Chloe Evans', '2020 Mission Street, San Francisco, CA, USA, 94110', 4.50, 'Pending', 'TRK1259', '2025-03-22'),
(27, 'Isabella Martinez', '400 E Van Buren St, Phoenix, AZ, USA, 85004', 'Amit Sharma', 'B-10, Shastri Nagar, Delhi, Delhi, India, 110052', 7.20, 'Delivered', 'TRK1260', '2025-03-12'),
(28, 'David Harris', '600 N Griffin St, Dallas, TX, USA, 75202', 'Rajesh Kumar', '123 MG Road, Bangalore, Karnataka, India, 560001', 5.40, 'Delivered', 'TRK1261', '2025-03-11'),
(29, 'Ethan Clark', '700 W 6th St, Austin, TX, USA, 78701', 'Sophia Williams', '789 Ocean Drive, Miami Beach, FL, USA, 33139', 3.85, 'Cancelled', 'TRK1262', '2025-03-06'),
(30, 'Ava Lewis', '1001 Colorado Blvd, Denver, CO, USA, 80206', 'Luca Rossi', 'Piazza del Duomo 1, Milan, Italy, 20122', 6.10, 'In Transit', 'TRK1263', '2025-04-04'),
(31, 'Rajesh Kumar', '123 MG Road, Bangalore, Karnataka, India, 560001', 'Mia Taylor', '123 Main St, Dallas, TX, USA, 75201', 8.20, 'Delivered', 'TRK1264', '2025-03-10'),
(32, 'Amit Sharma', 'B-10, Shastri Nagar, Delhi, Delhi, India, 110052', 'Olivia Johnson', '1234 Lakeside Ave, Chicago, IL, USA, 60601', 9.00, 'In Transit', 'TRK1265', '2025-04-06'),
(33, 'Anjali Patel', 'Flat 2B, Sagar Apartments, Linking Road, Mumbai, Maharashtra, India, 400050', 'Sophie Dupont', '12 Rue de Rivoli, Paris, France, 75001', 5.90, 'Delivered', 'TRK1266', '2025-03-07'),
(34, 'Emily Davis', '456 Broadway St, New York, NY, USA, 10013', 'Ava Lewis', '1001 Colorado Blvd, Denver, CO, USA, 80206', 3.60, 'Pending', 'TRK1267', '2025-03-26'),
(35, 'John Smith', '742 Evergreen Terrace, Los Angeles, CA, USA, 90001', 'Mia Johansson', 'Sveavägen 45, Stockholm, Sweden, 11134', 6.80, 'Delivered', 'TRK1268', '2025-03-09');
