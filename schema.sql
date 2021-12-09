DROP TABLE IF EXISTS animals;

CREATE TABLE animals (id INT GENERATED ALWAYS AS IDENTITY, name VARCHAR(100), date_of_birth DATE, escape_attempts INT, neutered BIT, weight_kg DECIMAL, species TEXT);

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
database performance audit
*/
-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);


CREATE INDEX visit_id_asc ON visits(id ASC);
CREATE INDEX visit_date_dsc ON visits(visit_date DESC);
