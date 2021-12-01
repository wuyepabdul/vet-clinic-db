DROP TABLE IF EXISTS animals;

CREATE TABLE animals (id INT GENERATED ALWAYS AS IDENTITY, name VARCHAR(100), date_of_birth DATE, escape_attempts INT, neutered BIT, weight_kg DECIMAL, species TEXT);