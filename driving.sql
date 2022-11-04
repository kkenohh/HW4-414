-- vType has to be either a truck or a car
CREATE TABLE Vehicle (
    licensePlate VARCHAR(7) PRIMARY KEY,
    year INT,
    vType VARCHAR(5),
    ownedBy INT REFERENCES Person
);

CREATE TABLE Car (
    licensePlate VARCHAR(7) REFERENCES Vehicle,
    make VARCHAR(100)
);

CREATE TABLE Insures (
    licensePlate VARCHAR(7) REFERENCES Vehicle,
    iName VARCHAR(100) REFERENCES InsuranceCo,
    maxLiability FLOAT
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
    ssn INT REFERENCES Person,
    driverID INT
);

CREATE TABLE NonProfessionalDriver (

);

CREATE TABLE ProfessionalDriver (

    medicalHistory VARCHAR(MAX)
);

-- 2b The insures relationship is a separate table because it has it's own attribute

-- 2c 