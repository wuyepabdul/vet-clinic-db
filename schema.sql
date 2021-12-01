DROP TABLE IF EXISTS animals;

CREATE TABLE animals (id INT SERIAL NOT NULL PRIMARY KEY, name VARCHAR(100), date_of_birth DATE, escape_attempts INT, neutered BIT, weight_kg DECIMAL, species_id INT references species(id), owner_id INT references owners(id));

CREATE TABLE owners (id SERIAL NOT NULL PRIMARY KEY, full_name VARCHAR(100), age INT);

CREATE TABLE species (id SERIAL NOT NULL PRIMARY KEY, name VARCHAR(100));