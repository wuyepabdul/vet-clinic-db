DROP TABLE IF EXISTS animals;

CREATE TABLE animals (id INT GENERATED ALWAYS AS IDENTITY, name VARCHAR(100), date_of_birth DATE, escape_attempts INT, neutered BIT, weight_kg DECIMAL, species TEXT);


CREATE TABLE owners (id SERIAL NOT NULL PRIMARY KEY, full_name VARCHAR(100), age INT);
CREATE TABLE species (id SERIAL NOT NULL PRIMARY KEY, name VARCHAR(100));

ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD COLUMN species_id INT;
ALTER TABLE animals ADD COLUMN owner_id INT;
ALTER TABLE animals ADD FOREIGN KEY (species_id) REFERENCES species(id);
ALTER TABLE animals ADD FOREIGN KEY (owner_id) REFERENCES owners(id);


