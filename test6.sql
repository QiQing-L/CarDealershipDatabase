-- 6. Get all sales information for a specific dealer for a specific date range 

SELECT s.*, v.color, v.make, v.model, v.vehicleType, v.`year` AS manufactured_year
FROM sales_contracts s
LEFT JOIN vehicles v ON v.VIN = s.VIN
JOIN inventory i ON v.VIN = i.VIN
JOIN dealership d ON i.dealership_id = d.dealership_id
where d.`name` = 'Evergreen Car Exchange' 
	AND (s.sale_date BETWEEN '2024-07-01' AND '2024-10-30');
