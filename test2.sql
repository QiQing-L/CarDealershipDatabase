-- 2. Find all vehicles for a specific dealership

SELECT v.*
FROM vehicles v
JOIN inventory i on v.VIN = i.VIN
JOIN dealership d on i.dealership_id = d.dealership_id
where d.`name` = 'Prime Auto Mall';