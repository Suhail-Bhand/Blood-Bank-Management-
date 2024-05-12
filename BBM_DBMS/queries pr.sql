use blood;
 -- How many donors do we have in our database?
SELECT COUNT(*) AS total_donors FROM Donor;
 
-- What is the distribution of blood types among our donors?
SELECT blood_type, COUNT(*) AS count
FROM Donor
GROUP BY blood_type; 


-- Blood Bag 
-- How many blood bags of each blood type do we have in stock?
SELECT blood_type, COUNT(*) AS count
FROM Blood_Bag
GROUP BY blood_type; 

-- What is the total volume of all blood bags collected in the current month? 
 SELECT SUM(volume) AS total_volume
FROM Blood_Bag
WHERE MONTH(collection_date) = MONTH(CURRENT_DATE());


-- How many blood bags are expiring within the next week?
SELECT COUNT(*) AS expiring_bags
FROM Blood_Bag
WHERE expiration_date BETWEEN CURDATE() AND CURDATE() + INTERVAL 7 DAY;

-- blood storage 
-- How many blood bags are currently stored at each location?
SELECT location, COUNT(blood_bag_id) AS stored_bags
FROM Blood_Storage
GROUP BY location;

-- What is the average temperature of blood storage across all locations?
SELECT AVG(temperature) AS average_temperature
FROM Blood_Storage;

-- hospital info
-- How many hospitals are located in each city?
SELECT location, COUNT(*) AS hospital_count
FROM Hospital_Info
GROUP BY location;

-- What are the contact details of hospitals with names starting with 'A'?
SELECT hospital_name, contact_info
FROM Hospital_Info
WHERE hospital_name LIKE 'S%';
-- : Which hospital has the highest hospital_id?
SELECT *
FROM Hospital_Info
WHERE hospital_id = (SELECT MAX(hospital_id) FROM Hospital_Info);

-- DR  
-- How many disease recognizers are there for each disease type?
SELECT disease_type, COUNT(*) AS recognizer_count
FROM Disease_Recognizer
GROUP BY disease_type;

-- Which blood bags are associated with disease recognizers?
SELECT blood_bag_id
FROM Disease_Recognizer;

-- blood camp
-- How many donors participated in each blood donation camp?
SELECT camp_name, number_of_donors
FROM Blood_Camp;

-- Which blood donation camp had the highest number of donors?
SELECT camp_name, number_of_donors
FROM Blood_Camp
ORDER BY number_of_donors DESC
LIMIT 1; 

-- employee
-- What is the average salary of employees by position
SELECT position, AVG(salary) AS average_salary
FROM Employee
GROUP BY position; 

-- Who are the employees working at each blood donation camp
SELECT c.camp_name, e.first_name, e.last_name, e.position
FROM Employee e
JOIN Blood_Camp c ON e.camp_id = c.camp_id;

-- accounts 
-- Which account type had the highest total expenses
SELECT account_type, SUM(expenses) AS total_expenses
FROM Accounts
GROUP BY account_type
ORDER BY total_expenses DESC
LIMIT 1;

-- Blood Request 
 -- What are the blood requests made by each hospital
SELECT hospital_id, COUNT(*) AS request_count
FROM Blood_Request
GROUP BY hospital_id;

-- What is the average quantity of blood requested per request date
SELECT request_date, AVG(quantity) AS average_quantity_requested
FROM Blood_Request
GROUP BY request_date;

-- joing  
-- Retrieve the employees working at each blood donation camp along with their positions
SELECT e.first_name, e.last_name, e.position, bc.camp_name
FROM Employee e
JOIN Blood_Camp bc ON e.camp_id = bc.camp_id; 

-- Display the details of hospitals along with the names of employees working there
SELECT h.hospital_name, h.location, e.first_name, e.last_name
FROM Hospital_Info h
LEFT JOIN Employee e ON h.camp_id = e.camp_id;