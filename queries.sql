
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


-- MILESTONE 4
-- Who was the last animal seen by William Tatcher?
SELECT MAX(visits.visit_date) AS last_visited, animals.name, vets.name FROM animals INNER JOIN visits on visits.animal_id = animals.id INNER JOIN vets on vets.id = visits.vet_id WHERE vets.name = 'William Tatcher' GROUP BY vets.name, animals.name ORDER BY last_visited DESC LIMIT 1;

--How many different animals did Stephanie Mendez see?
SELECT vets.name, COUNT(*) AS number_animals FROM animals INNER JOIN visits on visits.animal_id = animals.id INNER JOIN vets on vets.id = visits.vet_id WHERE vets.name = 'Stephanie Mendez' GROUP BY vets.name ORDER BY number_animals;

-- List all vets and their specialties, including vets with no specialties.
SELECT vets.name, species.name FROM vets LEFT JOIN specializations on vets.id = specializations.vet_id LEFT JOIN species on species.id = specializations.species_id;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT animals.name, vets.name, visits.visit_date FROM animals INNER JOIN visits on animals.id = visits.animal_id INNER JOIN vets on visits.vet_id = vets.id WHERE visits.visit_date BETWEEN '2020-04-01' AND '2020-08-30' AND vets.name = 'Stephanie Mendez';

-- What animal has the most visits to vets?
SELECT animals.name, COUNT(*) AS num_of_visits FROM animals INNER JOIN visits on animals.id =visits.animal_id INNER JOIN vets on visits.vet_id = vets.id GROUP BY animals.name ORDER BY num_of_visits DESC LIMIT 1;

-- Who was Maisy Smith's first visit?
SELECT animals.name, vets.name, MIN(visits.visit_date) AS first_visit FROM animals INNER JOIN visits on visits.animal_id = animals.id INNER JOIN vets on vets.id = visits.vet_id WHERE vets.name = 'Maisy Smith' GROUP BY vets.name, animals.name ORDER BY first_visit ASC LIMIT 1;

-- Details for most recent visit: animal information, vet information, and date of visit.
SELECT animals.name, animals.date_of_birth, animals.escape_attempts, animals.neutered, animals.weight_kg, vets.name AS vet_name, vets.age AS vet_age, MAX(visits.visit_date) AS visit_date FROM animals INNER JOIN visits on animals.id = visits.animal_id INNER JOIN vets on vets.id = visits.vet_id GROUP BY animals.name, animals.date_of_birth, animals.escape_attempts, animals.neutered, animals.weight_kg, vets.name, vets.age ORDER BY visit_date DESC LIMIT 1;

-- How many visits were with a vet that did not specialize in that animal's species?
SELECT COUNT(*) as wrong_speciality FROM visits INNER JOIN vets ON vets.id = visits.vet_id INNER JOIN animals ON animals.id = visits.animal_id INNER JOIN specializations ON specializations.vet_id = visits.vet_id WHERE specializations.species_id <> animals.species_id;

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT vets.name, species.name, COUNT(*) AS most_gotten_specie FROM animals INNER JOIN visits on animals.id = visits.animal_id INNER JOIN vets on visits.vet_id = vets.id INNER JOIN species on species.id = animals.species_id WHERE vets.name = 'Maisy Smith' GROUP BY vets.name, species.name ORDER BY most_gotten_specie DESC limit 1;