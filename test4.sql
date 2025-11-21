-- 4. Find the dealership where a certain car is located, by VIN 

SELECT d.*
FROM dealership d
JOIN inventory i on i.dealership_id = d.dealership_id
JOIN vehicles v on v.VIN = i.VIN
where v.VIN = '1HGCM82633A004352'; 
