DROP TABLE IF EXISTS animals;

CREATE TABLE animals (id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, name VARCHAR(100), date_of_birth DATE, escape_attempts INT, neutered BIT, weight_kg DECIMAL, species TEXT);

--Create a table named owners with the following columns:
CREATE TABLE owners (id SERIAL NOT NULL PRIMARY KEY, full_name VARCHAR(100), age INT);

CREATE TABLE visits (id SERIAL NOT NULL PRIMARY KEY, visit_date DATE, vet_id INT, animal_id INT);

-- Create a table named species with the following columns
CREATE TABLE species (id SERIAL NOT NULL PRIMARY KEY, name VARCHAR(100));

/* 
Modify animals table:
Make sure that id is set as autoincremented PRIMARY KEY
Remove column species
Add column species_id which is a foreign key referencing species table
Add column owner_id which is a foreign key referencing the owners table
*/
ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD COLUMN species_id INT;
ALTER TABLE animals ADD COLUMN owner_id INT;
ALTER TABLE animals ADD FOREIGN KEY (species_id) REFERENCES species(id);
ALTER TABLE animals ADD FOREIGN KEY (owner_id) REFERENCES owners(id);

/* 
Create a table named vets with the following columns:
id: integer (set it as autoincremented PRIMARY KEY)
name: string
age: integer
date_of_graduation: date
*/
CREATE TABLE vets (id SERIAL NOT NULL PRIMARY KEY, name VARCHAR(100), age INT, date_of_graduation DATE);

/* 
Create a "join table" called specializations to handle many-to-many relationship
between vets and species
*/
CREATE TABLE specializations (id SERIAL NOT NULL PRIMARY KEY, species_id INT, vet_id INT, FOREIGN KEY(species_id) REFERENCES species(id),  FOREIGN KEY(vet_id) REFERENCES vets(id));

/* 
Create a "join table" called visits to handle many-to-many relationship
between vets and animals
*/
CREATE TABLE visits (id SERIAL NOT NULL PRIMARY KEY, visit_date DATE, vet_id INT, animal_id INT, CONSTRAINT fk_vet FOREIGN KEY(vet_id) REFERENCES vets(id), CONSTRAINT fk_animal FOREIGN KEY(animal_id) REFERENCES animals(id));
