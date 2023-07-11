/*Queries that provide answers to the questions from all projects.*/

SELECT name FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth >= '2016-01-01' AND date_of_birth <= '2019-12-31';
SELECT name FROM animals WHERE neutered=true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name='Pikachu';
SELECT * FROM animals WHERE neutered=true;
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;
SELECT * FROM animals WHERE name NOT IN('Gabumon');

/*transaction queries*/
BEGIN; 
UPDATE animals SET species='unspecified';
SELECT * as animals FROM animals;
ROLLBACK;

BEGIN;
UPDATE animals
SET species='digimon'
WHERE name LIKE '%mon';
UPDATE animals SET species='pokemon'
WHERE species IS NULL;
SELECT * as animals FROM animals;
COMMIT;

BEGIN;
vet_clinic=*# DELETE FROM ANIMALS;
SELECT * as animals FROM animals;
ROLLBACK;

BEGIN;
DELETE FROM animals
WHERE date_of_birth='jan-1-2022';

SAVEPOINT update;
UPDATE animals
SET weight_kg= weight_kg*-1;
SELECT * as animals FROM animals;
ROLLBACK;

UPDATE animals
SET weight_kg=weight_kg* -1
WHERE weight_kg<0;
SELECT * as animals FROM animals;
COMMIT;

/*aggregate queries*/
SELECT COUNT(*) as animals FROM animals;
SELECT COUNT(*) as Never_escaped FROM animals WHERE escape_attempts=0;
SELECT AVG(weight_kg) as Average_animal_weight FROM animals;
SELECT neutered,MAX(escape_attempts) as most_escaped_attempts FROM animals
GROUP BY neutered;
SELECT species, AVG(weight_kg) AS average_weight FROM animals
GROUP BY species;

SELECT species, AVG(escape_attempts) AS average_escape_attempts
FROM animals
WHERE date_of_birth BETWEEN 'jan-1-1990' AND 'jan-1-2000'
GROUP BY species;