/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (id INT GENERATED ALWAYS AS IDENTITY, animal_name VARCHAR(100), date_of_birth DATE, escape_attempts INT, neutered BIT, weight_kg DECIMAL)