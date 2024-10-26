CREATE DATABASE IF NOT EXISTS pet_database;
USE pet_database;

CREATE TABLE petPet (
                        petname VARCHAR(20),
                        owner VARCHAR(45),
                        species VARCHAR(45),
                        gender CHAR(1) CHECK (gender IN ('M', 'F')),
                        birth DATE,
                        death DATE,
                        PRIMARY KEY (petname)
);

CREATE TABLE petEvent (
                          event_id INT AUTO_INCREMENT PRIMARY KEY,
                          petname VARCHAR(20),
                          eventdate DATE,
                          eventtype VARCHAR(15),
                          remark VARCHAR(255),
                          FOREIGN KEY (petname) REFERENCES petPet(petname)
);

