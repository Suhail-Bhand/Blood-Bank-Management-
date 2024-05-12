create database if not exists Blood;

 
CREATE TABLE Donor (
    donor_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    gender CHAR(1),
    blood_type CHAR(3),
    address VARCHAR(255),
    phone_number VARCHAR(20),
    email VARCHAR(100),
    medical_history TEXT,
    last_donation_date DATE
);

INSERT INTO Donor (donor_id, first_name, last_name, date_of_birth, gender, blood_type, address, phone_number, email, medical_history, last_donation_date)
VALUES 
(1, 'John', 'Doe', '1990-01-15', 'M', 'O+', '123 Main St, City', '123-456-7890', 'john.doe@example.com', 'None', '2023-06-15'),
(2, 'Jane', 'Smith', '1985-03-22', 'F', 'A+', '456 Oak Ave, City', '987-654-3210', 'jane.smith@example.com', 'None', '2023-07-10'),
(3, 'Emily', 'Johnson', '1978-07-30', 'F', 'B+', '789 Pine Rd, City', '555-123-4567', 'emily.johnson@example.com', 'Asthma', '2023-05-22'),
(4, 'Michael', 'Brown', '1982-12-11', 'M', 'AB-', '101 Maple St, City', '555-789-0123', 'michael.brown@example.com', 'None', '2023-04-01'),
(5, 'Sarah', 'Wilson', '1995-09-09', 'F', 'O-', '202 Birch St, City', '555-456-7891', 'sarah.wilson@example.com', 'Diabetes', '2023-03-18'),
(6, 'David', 'Taylor', '1970-02-02', 'M', 'A-', '303 Cedar St, City', '555-123-7890', 'david.taylor@example.com', 'High Blood Pressure', '2023-02-14'),
(7, 'Olivia', 'Martinez', '1992-10-10', 'F', 'B-', '404 Elm St, City', '555-654-1234', 'olivia.martinez@example.com', 'None', '2023-01-30'),
(8, 'William', 'Lee', '1988-04-04', 'M', 'O+', '505 Walnut St, City', '555-987-6543', 'william.lee@example.com', 'Heart Condition', '2023-08-20'),
(9, 'Sophia', 'Anderson', '1999-06-06', 'F', 'AB+', '606 Spruce St, City', '555-123-4568', 'sophia.anderson@example.com', 'None', '2023-07-28'),
(10, 'James', 'Walker', '1965-05-05', 'M', 'A+', '707 Ash St, City', '555-456-1234', 'james.walker@example.com', 'None', '2023-04-10');


CREATE TABLE Blood_Bag (
    blood_bag_id INT PRIMARY KEY,
    blood_type CHAR(3),
    component_type VARCHAR(20), -- whole blood, plasma, platelets, etc.
    volume INT, -- volume in milliliters
    collection_date DATE,
    expiration_date DATE,
    donor_id INT,
    FOREIGN KEY (donor_id) REFERENCES Donor(donor_id),
      camp_id INT,
    FOREIGN KEY (camp_id) REFERENCES blood_camp(camp_id)
);



INSERT INTO Blood_Bag (blood_bag_id, blood_type, component_type, volume, collection_date, expiration_date, donor_id)
VALUES 
(1, 'O+', 'Whole Blood', 500, '2023-06-15', '2024-06-15', 1),
(2, 'A+', 'Plasma', 300, '2023-07-10', '2024-07-10', 2),
(3, 'B+', 'Platelets', 250, '2023-05-22', '2024-05-22', 3),
(4, 'AB-', 'Whole Blood', 500, '2023-04-01', '2024-04-01', 4),
(5, 'O-', 'Plasma', 300, '2023-03-18', '2024-03-18', 5),
(6, 'A-', 'Platelets', 250, '2023-02-14', '2024-02-14', 6),
(7, 'B-', 'Whole Blood', 500, '2023-01-30', '2024-01-30', 7),
(8, 'O+', 'Plasma', 300, '2023-08-20', '2024-08-20', 8),
(9, 'AB+', 'Platelets', 250, '2023-07-28', '2024-07-28', 9),
(10, 'A+', 'Whole Blood', 500, '2023-04-10', '2024-04-10', 10);


CREATE TABLE Blood_Storage (
    storage_id INT PRIMARY KEY,
    location VARCHAR(255),
    temperature FLOAT, -- temperature in degrees Celsius
    capacity INT, -- capacity in units (blood bags)
    blood_bag_id INT,
    FOREIGN KEY (blood_bag_id) REFERENCES Blood_Bag(blood_bag_id)
);

INSERT INTO Blood_Storage (storage_id, location, temperature, capacity, blood_bag_id)
VALUES 
(1, 'Main Facility', 4.0, 1000, 1),
(2, 'Main Facility', 4.0, 1000, 2),
(3, 'Main Facility', 4.0, 1000, 3),
(4, 'Secondary Facility', 4.0, 500, 4),
(5, 'Secondary Facility', 4.0, 500, 5),
(6, 'Secondary Facility', 4.0, 500, 6),
(7, 'Main Facility', 4.0, 1000, 7),
(8, 'Main Facility', 4.0, 1000, 8),
(9, 'Main Facility', 4.0, 1000, 9),
(10, 'Secondary Facility', 4.0, 500, 10);


CREATE TABLE Hospital_Info (
    hospital_id INT PRIMARY KEY,
    hospital_name VARCHAR(100),
    location VARCHAR(255),
    contact_info VARCHAR(255)
);

INSERT INTO Hospital_Info (hospital_id, hospital_name, location, contact_info)
VALUES 
(1, 'City Hospital', '123 Health St, City', 'contact@cityhospital.com'),
(2, 'Regional Clinic', '456 Wellness Rd, City', 'contact@regionalclinic.com'),
(3, 'Community Hospital', '789 Care Ave, City', 'contact@communityhospital.com'),
(4, 'Specialty Clinic', '101 Rehab St, City', 'contact@specialtyclinic.com'),
(5, 'Veterans Hospital', '202 Patriot Rd, City', 'contact@veteranshospital.com'),
(6, 'Children Hospital', '303 Playland St, City', 'contact@childrenhospital.com'),
(7, 'Maternity Hospital', '404 Nursery St, City', 'contact@maternityhospital.com'),
(8, 'Trauma Center', '505 Recovery Rd, City', 'contact@traumacenter.com'),
(9, 'Oncology Center', '606 Chemotherapy St, City', 'contact@oncologycenter.com'),
(10, 'Geriatric Hospital', '707 Retirement Rd, City', 'contact@geriatrichospital.com');



CREATE TABLE Disease_Recognizer (
  disease_id INT PRIMARY KEY,
  disease_type VARCHAR(255) NOT NULL,
  remarks VARCHAR(255),
  diagnosis_date DATE,
  blood_bag_id INT,
  FOREIGN KEY (blood_bag_id) REFERENCES Blood_Bag(blood_bag_id)
);
INSERT INTO Disease_Recognizer (disease_id, disease_type, remarks, diagnosis_date, blood_bag_id)
VALUES 
    (1, 'HIV', 'Positive', '2024-04-01', 1),
    (2, 'Hepatitis B', 'Negative', '2024-04-02', 2),
    (3, 'Malaria', 'Negative', '2024-04-03', 3),
    (4, 'Syphilis', 'Negative', '2024-04-04', 4),
    (5, 'Hepatitis C', 'Positive', '2024-04-05', 5),
    (6, 'HIV', 'Negative', '2024-04-06', 6),
    (7, 'Hepatitis B', 'Positive', '2024-04-07', 7),
    (8, 'Malaria', 'Positive', '2024-04-08', 8),
    (9, 'Syphilis', 'Positive', '2024-04-09', 9),
    (10, 'Hepatitis C', 'Negative', '2024-04-10',10);
    

CREATE TABLE Blood_Camp (
    camp_id INT PRIMARY KEY,
    camp_name VARCHAR(100),
    location VARCHAR(255),
    organizer VARCHAR(100),
    start_date DATE,
    end_date DATE,
    number_of_donors INT
);
INSERT INTO Blood_Camp (camp_id, camp_name, location, organizer, start_date, end_date, number_of_donors)
VALUES 
(1, 'City Blood Drive', 'Central Park, City', 'Red Cross', '2023-01-01', '2023-01-05', 100),
(2, 'Regional Blood Camp', 'Community Center, City', 'Local Charity', '2023-02-10', '2023-02-15', 80),
(3, 'University Blood Camp', 'University Campus, City', 'Student Council', '2023-03-20', '2023-03-25', 150),
(4, 'Corporate Blood Drive', 'Tech Park, City', 'Tech Company', '2023-04-05', '2023-04-10', 70),
(5, 'Health Fair Blood Camp', 'Convention Center, City', 'Health Organization', '2023-05-15', '2023-05-20', 200),
(6, 'Veterans Blood Camp', 'Veterans Center, City', 'Veterans Association', '2023-06-01', '2023-06-05', 60),
(7, 'Children Hospital Blood Camp', 'Children Hospital, City', 'Pediatric Association', '2023-07-15', '2023-07-20', 50),
(8, 'Trauma Center Blood Camp', 'Trauma Center, City', 'Trauma Relief', '2023-08-25', '2023-08-30', 120),
(9, 'Oncology Blood Camp', 'Oncology Center, City', 'Cancer Society', '2023-09-10', '2023-09-15', 180),
(10, 'Maternity Hospital Blood Camp', 'Maternity Hospital, City', 'Maternity Support', '2023-10-05', '2023-10-10', 90);

CREATE TABLE Employee (

 employee_id INT PRIMARY KEY,
 first_name VARCHAR(255) NOT NULL,
 last_name VARCHAR(255) NOT NULL,
 position VARCHAR(255) NOT NULL,
 salary DOUBLE NOT NULL,
  camp_id INT,
 FOREIGN KEY (camp_id) REFERENCES blood_camp(camp_id),
  account_id  INT,
 FOREIGN KEY (account_id ) REFERENCES accounts( account_id )
);

INSERT INTO Employee (employee_id, first_name, last_name, position, salary, camp_id, account_id)
VALUES 
    (1, 'John', 'Doe', 'Manager', 60000.00, 1, 1),
    (2, 'Jane', 'Smith', 'Assistant', 45000.00, 2, 2),
    (3, 'Mary', 'Johnson', 'Technician', 50000.00, 3, 3),
    (4, 'James', 'Brown', 'Nurse', 40000.00, 1, 4),
    (5, 'Emily', 'Davis', 'Supervisor', 55000.00, 2, 5),
    (6, 'Michael', 'Wilson', 'Technician', 48000.00, 3, 6),
    (7, 'Jessica', 'Martinez', 'Manager', 62000.00, 1, 7),
    (8, 'Daniel', 'Garcia', 'Technician', 47000.00, 2, 8),
    (9, 'Patricia', 'Rodriguez', 'Assistant', 43000.00, 3, 9),
    (10, 'Robert', 'Lopez', 'Supervisor', 56000.00, 1, 10);

CREATE TABLE Accounts (
    account_id INT PRIMARY KEY,
    account_type VARCHAR(50), -- HR, blood bank operations, camp costs, etc.
    expenses DECIMAL(10, 2),
    revenues DECIMAL(10, 2),
    transaction_date DATE
);

INSERT INTO Accounts (account_id, account_type, expenses, revenues, transaction_date)
VALUES 
    (1, 'HR', 1500.00, 0.00, '2024-05-01'),
    (2, 'Blood Bank Operations', 10000.00, 2000.00, '2024-05-02'),
    (3, 'Camp Costs', 5000.00, 0.00, '2024-05-03'),
    (4, 'Equipment Maintenance', 2500.00, 0.00, '2024-05-04'),
    (5, 'HR', 2000.00, 500.00, '2024-05-05'),
    (6, 'Donor Outreach', 3000.00, 1000.00, '2024-05-06'),
    (7, 'Blood Bank Operations', 15000.00, 3000.00, '2024-05-07'),
    (8, 'Camp Costs', 4500.00, 500.00, '2024-05-08'),
    (9, 'Equipment Maintenance', 2700.00, 200.00, '2024-05-09'),
    (10, 'HR', 1800.00, 300.00, '2024-05-10');

CREATE TABLE Blood_Request (
    request_id INT PRIMARY KEY,
    request_date DATE,
    blood_type CHAR(3),
    quantity INT, -- quantity in units (blood bags)
    hospital_id INT,
    fulfilled_date DATE,
    FOREIGN KEY (hospital_id) REFERENCES Hospital_Info(hospital_id)
  
);

INSERT INTO Blood_Request (request_id, request_date, blood_type, quantity, hospital_id, fulfilled_date)
VALUES 
(1, '2023-01-15', 'O+', 10, 1, '2023-01-16'),
(2, '2023-02-20', 'A+', 8, 2, '2023-02-21'),
(3, '2023-03-25', 'B+', 7, 3, '2023-03-26'),
(4, '2023-04-30', 'AB-', 6, 4, '2023-05-01'),
(5, '2023-05-10', 'O-', 5, 5, '2023-05-11'),
(6, '2023-06-20', 'A-', 9, 6, '2023-06-21'),
(7, '2023-07-15', 'B-', 12, 7, '2023-07-16'),
(8, '2023-08-25', 'O+', 15, 8, '2023-08-26'),
(9, '2023-09-30', 'AB+', 11, 9, '2023-10-01'),
(10, '2023-10-05', 'A+', 14, 10, '2023-10-06');

DELIMITER //

CREATE PROCEDURE GetBloodBankData (
    IN donor_start_date DATE,
    IN donor_end_date DATE,
    IN blood_bag_type CHAR(3),
    IN component_type VARCHAR(20),
    IN hospital_id INT,
    IN request_start_date DATE,
    IN request_end_date DATE,
    IN disease_blood_bag_id INT
)
BEGIN
    -- Get donors who donated within a specific timeframe
    SELECT donor_id, first_name, last_name, blood_type, last_donation_date
    FROM Donor
    WHERE last_donation_date BETWEEN donor_start_date AND donor_end_date;

    -- Get blood bags based on type and component
    SELECT blood_bag_id, blood_type, component_type, volume, collection_date, expiration_date
    FROM Blood_Bag
    WHERE (blood_type = blood_bag_type OR blood_bag_type IS NULL)
      AND (component_type = component_type OR component_type IS NULL);

    -- Get blood requests fulfilled by a specific hospital within a timeframe
    SELECT br.request_id, br.request_date, br.blood_type, br.quantity, br.fulfilled_date, hi.hospital_name
    FROM Blood_Request br
    JOIN Hospital_Info hi ON br.hospital_id = hi.hospital_id
    WHERE br.hospital_id = hospital_id
      AND br.request_date BETWEEN request_start_date AND request_end_date;

    -- Get disease recognizer results for a specific blood bag
    SELECT dr.disease_id, dr.disease_type, dr.remarks, dr.diagnosis_date, bb.blood_bag_id, bb.blood_type
    FROM Disease_Recognizer dr
    JOIN Blood_Bag bb ON dr.blood_bag_id = bb.blood_bag_id
    WHERE dr.blood_bag_id = disease_blood_bag_id;

END //

DELIMITER ;


CALL GetBloodBankData('2024-01-01', '2024-12-31', 'AB', 'Plasma', 1, '2024-01-4', '2024-12-31', 1);
