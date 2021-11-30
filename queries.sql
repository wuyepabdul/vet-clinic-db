
SELECT * FROM animals WHERE name LIKE '%mon';

SELECT name FROM animals WHERE date_of_birth BETWEEN '2017-01-01' AND '2019-12-31';

SELECT date_of_birth FROM animals WHERE neutered = '1' AND escape_attempts < 3;

SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

SELECT * FROM animals WHERE neutered = '1';

SELECT * FROM animals WHERE NOT name = 'Gabumon'; 

SELECT * FROM animals WHERE weight_kg >= 10.4 and weight_kg <= 17.3;