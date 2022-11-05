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
    capacity INT
);

CREATE TABLE InsuranceCo (
    name VARCHAR(100) PRIMARY KEY,
    phone INT
);

CREATE TABLE Person (
    ssn INT PRIMARY KEY,
    name VARCHAR
);

CREATE TABLE Driver (
    ssn INT PRIMARY KEY REFERENCES Person,
    driverID INT
);

CREATE TABLE NonProfessionalDriver (
    ssn INT PRIMARY KEY REFERENCES Driver,
    drives VARCHAR(7) REFERENCES Car
);

CREATE TABLE ProfessionalDriver (
    ssn INT PRIMARY KEY REFERENCES Driver,
    operates VARCHAR(7) REFERENCES Truck,
    medicalHistory VARCHAR(MAX)
);

-- 2b The insures relationship is a separate table because it has it's own attribute

-- 2c "drives" is a many-to-many relationship, meaning multiple different people can drive the same car and multiple cars can be driven by the same person. "Operates" is a many-to-one relationship so one driver can have many trucks, but no truck can have more than one driver.