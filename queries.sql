
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
EXPLAIN ANALYSE SELECT COUNT(animals.name), species.name FROM animals INNER JOIN species on animals.species_id = species.id WHERE species.name = 'Pokemon' or species.name = 'Digimon' GROUP BY species.name;

-- List all Digimon owned by Jennifer Orwell.

SELECT animals.id, animals.name, owners.full_name, species.name FROM animals INNER JOIN owners on animals.owner_id = owners.id INNER JOIN species on animals.species_id = species.id WHERE owners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon';

-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT animals.id, animals.name, owners.full_name FROM animals INNER JOIN owners on animals.owner_id = owners.id WHERE animals.escape_attempts = 0 AND owners.full_name = 'Dean Winchester';

-- Who owns the most animals?
SELECT owners.full_name, COUNT(*) AS max_count FROM animals INNER JOIN owners on animals.owner_id = owners.id GROUP BY owners.full_name ORDER BY max_count DESC LIMIT 1;

/*  DATABASE PERFORMANCE OPTIMIZATION */
EXPLAIN ANALYSE SELECT COUNT(*) FROM visits where animal_id = 4;

EXPLAIN ANALYSE SELECT * FROM visits where vet_id = 2;


EXPLAIN ANALYSE SELECT id, visit_date, vet_id, animal_id FROM visits where vet_id = 2 LIMIT 100;



/* 
Finalize Aggregate  (cost=116755.03..116755.04 rows=1 width=8) (actual time=23798.658..23935.017 rows=1 loops=1)
   ->  Gather  (cost=116754.81..116755.02 rows=2 width=8) (actual time=23798.050..23934.990 rows=3 loops=1)
         Workers Planned: 2
         Workers Launched: 2
         ->  Partial Aggregate  (cost=115754.81..115754.82 rows=1 width=8) (actual time=23573.824..23573.826 rows=1 loops=3)
               ->  Parallel Seq Scan on visits  (cost=0.00..114621.71 rows=453240 width=0) (actual time=1749.819..23530.598 rows=359428 loops=3)
                     Filter: (animal_id = 4)
                     Rows Removed by Filter: 3234852
 Planning Time: 15.166 ms
 JIT:
   Functions: 14
   Options: Inlining false, Optimization false, Expressions true, Deforming true
   Timing: Generation 50.022 ms, Inlining 0.000 ms, Optimization 569.032 ms, Emission 4487.899 ms, Total 5106.953 ms
 Execution Time: 25750.432 ms

 */