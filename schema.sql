/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id INT,
    name VARCHAR,
    date_of_birth DATE,
    escape_attempt INT,
    neutered BOOL,
    weight_kg DECIMAL,
    PRIMARY KEY(id)
);
