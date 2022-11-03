-- vType has to be either a truck or a car
CREATE TABLE Vehicle (
    licensePlate VARCHAR(7),
    year INT,
    vType VARCHAR(5),
    vOwner VARCHAR(20) REFERENCES Person,
    insuredBy VARCHAR(20) REFERENCES InsuranceCo
);