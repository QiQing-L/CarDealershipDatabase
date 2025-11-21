-- 5. Find all Dealerships that have a certain car type (i.e. Red Ford Mustang) 

SELECT d.*
FROM dealership d
LEFT JOIN inventory i on i.dealership_id = d.dealership_id
LEFT JOIN vehicles v on v.VIN = i.VIN
WHERE color = 'Yellow' AND make = 'Honda' AND vehicleType = 'Hatchback';