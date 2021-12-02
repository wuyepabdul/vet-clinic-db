
SELECT * FROM animals WHERE name LIKE '%mon';

SELECT name FROM animals WHERE date_of_birth BETWEEN '2017-01-01' AND '2019-12-31';

SELECT date_of_birth FROM animals WHERE neutered = '1' AND escape_attempts < 3;

SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

SELECT * FROM animals WHERE neutered = '1';

SELECT * FROM animals WHERE NOT name = 'Gabumon'; 

SELECT * FROM animals WHERE weight_kg >= 10.4 and weight_kg <= 17.3;

SELECT COUNT(*) FROM animals;

SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;

SELECT AVG(weight_kg) FROM animals;

SELECT neutered, MAX(escape_attempts) FROM animals GROUP BY neutered;

SELECT species, MAX(weight_kg), MIN(weight_kg) FROM animals GROUP BY species;

SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;

-- What animals belong to Melody Pond?
SELECT animals.id, animals.name, owners.full_name FROM animals INNER JOIN owners on animals.owner_id = owners.id WHERE owners.full_name = 'Melody Pond';

-- List of all animals that are pokemon (their type is Pokemon).
SELECT animals.id, animals.name, species.name FROM animals INNER JOIN species on animals.species_id = species.id WHERE species.name = 'Pokemon';

-- List all owners and their animals, remember to include those that don't own any animal.
SELECT owners.full_name, animals.name FROM owners LEFT JOIN animals on owners.id = animals.owner_id;

-- How many animals are there per species?
SELECT COUNT(animals.name), species.name FROM animals INNER JOIN species on animals.species_id = species.id WHERE species.name = 'Pokemon' or species.name = 'Digimon' GROUP BY species.name;

-- List all Digimon owned by Jennifer Orwell.

SELECT animals.id, animals.name, owners.full_name, species.name FROM animals INNER JOIN owners on animals.owner_id = owners.id INNER JOIN species on animals.species_id = species.id WHERE owners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon';

-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT animals.id, animals.name, owners.full_name FROM animals INNER JOIN owners on animals.owner_id = owners.id WHERE animals.escape_attempts = 0 AND owners.full_name = 'Dean Winchester';

-- Who owns the most animals?
SELECT owners.full_name, COUNT(*) AS max_count FROM animals INNER JOIN owners on animals.owner_id = owners.id GROUP BY owners.full_name ORDER BY max_count DESC LIMIT 1;
