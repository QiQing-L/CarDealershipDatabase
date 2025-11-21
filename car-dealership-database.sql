-- The Car Dealership Database 

DROP DATABASE IF EXISTS CarDealershipDatabase;

CREATE DATABASE CarDealershipDatabase;

USE CarDealershipDatabase; 

DROP TABLE IF EXISTS dealership; 
DROP TABLE IF EXISTS sales_contracts; 
DROP TABLE IF EXISTS lease_contracts; 
DROP TABLE IF EXISTS inventory; 
DROP TABLE IF EXISTS vehicles;

CREATE TABLE vehicles (
	VIN VARCHAR(17) NOT NULL PRIMARY KEY,
	make VARCHAR(50) NOT NULL, 
	model VARCHAR(50) NOT NULL,
	`year` INT NOT NULL,
	SOLD BOOLEAN DEFAULT 0,
	color VARCHAR(50) NOT NULL,
	vehicleType VARCHAR(50),
	odometer INT,
	price DOUBLE NOT NULL
);

CREATE TABLE dealership (
	dealership_id INT AUTO_INCREMENT PRIMARY KEY,
	`name` VARCHAR(50) NOT NULL, 
	address VARCHAR(50) NOT NULL, 
	phone VARCHAR(12) NOT NULL
); 

CREATE TABLE sales_contracts (
contract_id INT AUTO_INCREMENT PRIMARY KEY,
VIN VARCHAR(17) NOT NULL,
sale_date DATE NOT NULL,
price DECIMAL(10.2) NOT NULL,
FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
); 

CREATE TABLE lease_contracts (
contract_id INT AUTO_INCREMENT PRIMARY KEY,
VIN VARCHAR(17) NOT NULL,
lease_start DATE NOT NULL,
lease_end DATE NOT NULL,
monthly_payment DECIMAL(10.2) NOT NULL,
FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
); 

CREATE TABLE inventory (
VIN VARCHAR(17) NOT NULL,
dealership_id INT NOT NULL,
FOREIGN KEY (VIN) REFERENCES vehicles(VIN),
FOREIGN KEY (dealership_id) REFERENCES dealership(dealership_id)
); 

INSERT INTO vehicles (VIN, make, model, `year`, SOLD, color, vehicleType, odometer, price)
VALUES 
('1HGCM82633A004352','Honda','Accord',2018,0,'Silver','Sedan',45210,18950.00),
('2FTRX18W1XCA12345','Ford','F-150',2020,1,'Blue','Truck',30200,32900.00),
('3FAHP0HA4AR259876','Ford','Fusion',2017,0,'White','Sedan',61000,14500.00),
('5YJ3E1EA7JF012345','Tesla','Model 3',2021,0,'Red','Electric',15800,37900.00),
('1N4AL3AP9GN356789','Nissan','Altima',2019,1,'Black','Sedan',38750,17990.00),
('WDDGF4HB2DA789012','Mercedes-Benz','C300',2016,0,'Gray','Sedan',72400,21500.00),
('JN8AS5MT9CW658321','Nissan','Rogue',2018,0,'Blue','SUV',49800,16950.00),
('1FTFW1EF1EKE54321','Ford','F-150',2015,1,'Red','Truck',87500,24900.00),
('JHMGE8H59DC123987','Honda','Fit',2017,0,'Yellow','Hatchback',54000,12900.00),
('4T1BF1FK5GU298765','Toyota','Camry',2020,0,'White','Sedan',22100,23450.00),
-- vehicles that are leased:
('3HGCM56457A789654','Honda','Civic',2020,0,'Blue','Sedan',22500,15000.00),
('5FNYF4H59EB012678','Honda','Pilot',2019,0,'Black','SUV',40200,18000.00),
('1GNEK13ZX3R298721','Chevrolet','Tahoe',2021,0,'White','SUV',19800,22000.00),
('4S4BSBLC8G3301298','Subaru','Outback',2022,0,'Green','Wagon',12500,27000.00),
('WAUEFAFL1DN045763','Audi','A4',2020,0,'Silver','Sedan',31000,32000.00);

INSERT INTO dealership (`name`, address, phone)
VALUES 
('Prime Auto Mall','4820 Sunset Blvd, Los Angeles, CA','310-555-8293'),
('NorthStar Motors','2158 Lakeview Rd, Chicago, IL','773-555-1942'),
('Highway 9 Auto Center','901 Route 9, Freehold, NJ','732-555-6671'),
('Evergreen Car Exchange','1442 Pinecrest Dr, Seattle, WA','206-555-4820');

INSERT INTO sales_contracts (VIN, sale_date, price)
VALUES 
('2FTRX18W1XCA12345','2024-08-12',34940.00),
('1N4AL3AP9GN356789','2024-06-28',19284.50),
('1FTFW1EF1EKE54321','2024-09-15',26540.00);

INSERT INTO lease_contracts (VIN, lease_start, lease_end, monthly_payment)
VALUES 
('3HGCM56457A789654','2024-01-15','2027-01-15',252.43),
('5FNYF4H59EB012678','2024-03-10','2027-03-10',302.92),
('1GNEK13ZX3R298721','2024-05-22','2027-05-22',370.23),
('4S4BSBLC8G3301298','2024-07-08','2027-07-08',454.37),
('WAUEFAFL1DN045763','2024-09-30','2027-09-30',538.52);

INSERT INTO inventory(VIN, dealership_id) 
VALUES 
('1HGCM82633A004352',1),
('3FAHP0HA4AR259876',2),
('5YJ3E1EA7JF012345',3),
('WDDGF4HB2DA789012',1),
('JN8AS5MT9CW658321',4),
('JHMGE8H59DC123987',3),
('4T1BF1FK5GU298765',2);
