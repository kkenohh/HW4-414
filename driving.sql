CREATE TABLE Vehicle (
    licensePlate VARCHAR(7) PRIMARY KEY,
    year INT,
    ownedBy INT REFERENCES Person,
    iName VARCHAR(100) REFERENCES InsuranceCo,
    maxLiability FLOAT
);

CREATE TABLE Car (
    licensePlate VARCHAR(7) PRIMARY KEY REFERENCES Vehicle,
    make VARCHAR(100)
);

CREATE TABLE Truck (
    licensePlate VARCHAR(7) PRIMARY KEY REFERENCES Vehicle,
    capacity INT,
    operatedBy INT REFERENCES ProfessionDriver
);

CREATE TABLE InsuranceCo (
    name VARCHAR(100) PRIMARY KEY,
    phone INT
);

CREATE TABLE Person (
    ssn INT PRIMARY KEY,
    name VARCHAR
);

CREATE TABLE Drives (
    driverID INT REFERENCES Driver,
    licensePlate VARCHAR(7) REFERENCES Car
);

CREATE TABLE Driver (
    ssn INT REFERENCES Person,
    driverID INT PRIMARY KEY
);

CREATE TABLE NonProfessionalDriver (
    ssn INT PRIMARY KEY REFERENCES Driver
);

CREATE TABLE ProfessionalDriver (
    ssn INT PRIMARY KEY REFERENCES Driver,
    medicalHistory VARCHAR(100)
);

-- 2b The insures relationship is a many-to-one relationship meaning it can have many vehicles under the same insurance company so I added an insurance company name column to the Vehicles table. I chose to do it this way because each vehicle will have its own insurance company and since there will never be an instance where an insurance company will be by itself outside of the InsuranceCo table, it would reduce redundancy to add it to the Vehicle table.

-- 2c "drives" is a many-to-many relationship, meaning different people can drive the same car and multiple cars can be driven by the same person, so I need to use a separate table to reduce redundancy. "Operates" is a many-to-one relationship so one driver can have many trucks, but no truck can have more than one driver, so I don't need another table, but rather I add a column under the "many" table.