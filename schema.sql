/* Database schema to keep the structure of entire database. */
CREATE DATABASE vet_clinic;

CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR,
    date_of_birth DATE,
    escape_attempt INT,
    neutered BOOL,
    weight_kg DECIMAL,
    PRIMARY KEY(id)
);
ALTER TABLE animals RENAME escape_attempt TO escape_attempts;
ALTER TABLE animals ADD species VARCHAR;

CREATE TABLE Owners(
 ID INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
 full_name VARCHAR,
 age INT);

CREATE TABLE SPECIES(
 ID INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
 name VARCHAR);

ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals
ADD COLUMN species_id INTEGER,
ADD CONSTRAINT fk_species
FOREIGN KEY(species_id)
REFERENCES species(ID);

ALTER TABLE animals
ADD COLUMN owner_id INTEGER,
ADD CONSTRAINT fk_owners
FOREIGN KEY(owner_id)
REFERENCES owners(ID);

CREATE TABLE vets(
vet_id INT GENERATED ALWAYS AS IDENTITY,
NAME VARCHAR,
age INT,
date_of_graduation DATE,
PRIMARY KEY(vet_id));

CREATE TABLE specialization (
    ID INT GENERATED ALWAYS AS IDENTITY,
    vet INT,
    species INT,
    CONSTRAINT fk_vet FOREIGN KEY (vet) REFERENCES vets(vet_id),
    CONSTRAINT fk_species FOREIGN KEY (species) REFERENCES species(id),
    PRIMARY KEY (ID)
);

CREATE TABLE visits (
    ID INT GENERATED ALWAYS AS IDENTITY,
    animal INT,
    vet INT,
    Visit_date DATE,
    CONSTRAINT fk_animal FOREIGN KEY (animal) REFERENCES animals(id),
    CONSTRAINT fk_vet FOREIGN KEY (vet) REFERENCES vets(vet_id),
    PRIMARY KEY (ID)
);

Alter Table
visits RENAME COLUMN animal to animal_id;

Alter Table
visits RENAME COLUMN vet to vet_id;

Alter Table
visits RENAME COLUMN visit_date to date_of_visit;

-- PERFORMANCE OPTIMIZATION

ALTER TABLE owners ADD COLUMN email VARCHAR(120);

CREATE INDEX idx_animal_id ON visits(animal_id);
CREATE INDEX idx_vet_id ON visits(vet_id);
CREATE INDEX idx_email ON owners(email);