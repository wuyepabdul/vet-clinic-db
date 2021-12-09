
INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Agumon', '2020-02-03', 0, '1', 10.23);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Gabumon', '2018-11-15', 2, '1', 8);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Pikachu', '2021-01-07', 1, '0', 15.04);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Devimon', '2017-05-12', 5, '1', 11);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Charmander', '2020-02-08', 0, '0', -11);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Plantmon', '2022-11-15', 2, '1', -5.7);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Squirtle', '1993-04-02', 3, '0', -12.13);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Angemon', '2005-06-12', 1, '1', -45);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Boarmon', '2005-06-07', 7, '1', 20.4);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Blossom', '1998-10-13', 3, '1', 17);

BEGIN TRANSACTION;
UPDATE animals SET species = 'unspecified';
UPDATE animals SET species = NULL;
ROLLBACK;

BEGIN TRANSACTION;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon'; --id -> 2
UPDATE animals SET species = 'pokemon' WHERE name NOT LIKE '%mon'; -- id -> 1
COMMIT TRANSACTION;

BEGIN TRANSACTION;
DELETE FROM animals;
ROLLBACK;

BEGIN TRANSACTION;
DELETE FROM animals WHERE date_of_birth > CAST('2022-01-01' AS DATE);
SAVEPOINT SP1;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO SP1;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;

-- Insert data into the owners table:

INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34);
INSERT INTO owners (full_name, age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners (full_name, age) VALUES ('Bob', 45);
INSERT INTO owners (full_name, age) VALUES ('Melody Pond', 77);
INSERT INTO owners (full_name, age) VALUES ('Dean Winchester', 14);
INSERT INTO owners (full_name, age) VALUES ('Jodie Whittaker', 38);

-- Insert data into the species table:

INSERT INTO species (name) VALUES ('Pokemon');
INSERT INTO species (name) VALUES ('Digimon');

-- Modify inserted animals so it includes the species_id value:

BEGIN TRANSACTION;
UPDATE animals SET species_id = 2 WHERE name LIKE '%mon'; 
UPDATE animals SET species_id = 1 WHERE name NOT LIKE '%mon';
COMMIT TRANSACTION;

-- Modify inserted animals to include owner information (owner_id):
BEGIN TRANSACTION;
UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owner_id = 2 WHERE name ='Gabumon' OR name ='Pikachu';
UPDATE animals SET owner_id = 3 WHERE name ='Devimon' OR name ='Plantmon';
UPDATE animals SET owner_id = 4 WHERE name ='Charmander' OR name = 'Squirtle' OR name ='Blossom';
UPDATE animals SET owner_id = 5 WHERE name ='Angemon' OR name='Boarmon';
COMMIT TRANSACTION;

-- insert the data in vets table:
INSERT INTO vets (name, age, date_of_graduation) VALUES ('William Tatcher', 45, '2000-04-03');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Maisy Smith', 26, '2019-01-17');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Stephanie Mendez', 64, '1981-05-04');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Jack Harkness', 38, '2008-06-08');

-- insert the data in specializations table:
INSERT INTO specializations (species_id, vet_id) VALUES (1,1);
INSERT INTO specializations (species_id, vet_id) VALUES (2,3);
INSERT INTO specializations (species_id, vet_id) VALUES (1,3);
INSERT INTO specializations (species_id, vet_id) VALUES (2,4);


-- insert the data in visits table:
INSERT INTO visits (visit_date, vet_id, animal_id) VALUES ('2020-05-24', 1, 1);
INSERT INTO visits (visit_date, vet_id, animal_id) VALUES ('2020-07-22', 3, 1);
INSERT INTO visits (visit_date, vet_id, animal_id) VALUES ('2021-02-02', 4, 2);
INSERT INTO visits (visit_date, vet_id, animal_id) VALUES ('2020-01-05', 2, 3);
INSERT INTO visits (visit_date, vet_id, animal_id) VALUES ('2020-03-08', 2, 3);
INSERT INTO visits (visit_date, vet_id, animal_id) VALUES ('2020-05-14', 2, 3);
INSERT INTO visits (visit_date, vet_id, animal_id) VALUES ('2021-05-04', 3, 4);
INSERT INTO visits (visit_date, vet_id, animal_id) VALUES ('2021-02-24', 4, 5);
INSERT INTO visits (visit_date, vet_id, animal_id) VALUES ('2019-12-21', 2, 11);
INSERT INTO visits (visit_date, vet_id, animal_id) VALUES ('2020-08-10', 1, 11);
INSERT INTO visits (visit_date, vet_id, animal_id) VALUES ('2021-04-07', 2, 11);
INSERT INTO visits (visit_date, vet_id, animal_id) VALUES ('2019-09-29', 3, 7);
INSERT INTO visits (visit_date, vet_id, animal_id) VALUES ('2020-10-03', 4, 8);
INSERT INTO visits (visit_date, vet_id, animal_id) VALUES ('2020-11-04', 4, 8);
INSERT INTO visits (visit_date, vet_id, animal_id) VALUES ('2019-01-24', 2, 9);
INSERT INTO visits (visit_date, vet_id, animal_id) VALUES ('2019-05-15', 2, 9);
INSERT INTO visits (visit_date, vet_id, animal_id) VALUES ('2020-02-27', 2, 9);
INSERT INTO visits (visit_date, vet_id, animal_id) VALUES ('2020-08-03', 2, 9);
INSERT INTO visits (visit_date, vet_id, animal_id) VALUES ('2020-05-24', 3, 10);
INSERT INTO visits (visit_date, vet_id, animal_id) VALUES ('2021-01-11', 1, 10);
