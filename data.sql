/* Populate database with sample data. */

INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Agumon', 'feb-3-2020', 0, true, 10.23),
( 'Gabumon', 'Nov-15-2018', 2, true, 8),
( 'Pikachu', 'Jan-7-2021', 1, false, 15.04),
('Devimon', 'May-12-2017', 5, true, 11),
('Charmander', 'FEB-8-2020', 0,false, -11),( 'Plantmon', 'NOV-15-2021',2,true,-5.7),
('Squirtle', 'APR-2-1993', 3, false,-12.13),('Angemon', 'jun-12-2005',1,true, -45),
('Boarmon', 'jun-7-2005', 7, true, 20.4),('Blossom', 'OCT-13-1998', 3, true, 17),
( 'Ditto', 'May-14-2022', 4, true, 22);

INSERT INTO owners(full_name, age)
VALUES('Sam Smith', 34),('Jennifer Orwell', 19),('Bob', 45),('Melody Pond', 77),('Dean Winchester', 14),
('Jodie Whittaker', 38);
INSERT INTO species (name) values('Pokemon'),('Digimon');

-- Insert Digimon records
UPDATE animals
SET species_id = (SELECT id FROM species WHERE name = 'Digimon')
WHERE name LIKE '%mon';

-- Insert Pokemon records
UPDATE animals
SET species_id = (SELECT id FROM species WHERE name = 'Pokemon')
WHERE species_id IS NULL;


UPDATE animals
SET owner_id = (SELECT id from owners WHERE full_name='Sam Smith')
WHERE name = 'Agumon';

UPDATE animals
SET owner_id = (SELECT id from owners WHERE full_name='Jennifer Orwell')
WHERE name = 'Gabumon' OR name= 'Pikachu';

UPDATE animals
SET owner_id = (SELECT id from owners WHERE full_name='Bob')
WHERE name = 'Devimon' OR name= 'Plantmon';

UPDATE animals
SET owner_id = (SELECT id from owners WHERE full_name='Melody Pond')
WHERE name = 'Charmander' OR name= 'Squirtle' OR name='Blossom';

UPDATE animals
SET owner_id = (SELECT id from owners WHERE full_name='Dean Winchester')
WHERE name = 'Angemon' OR name= 'Boarmon';

SELECT name from animals
JOIN owners ON owner_id = owners.id
WHERE owners.full_name='Melody Pond';

SELECT animals.name as Animals_name from animals
JOIN species ON species_id = species.id
WHERE species.name='Pokemon';

SELECT full_name,name from animals
FULL OUTER JOIN owners ON owner_id = owners.id;

SELECT species.name,COUNT(animals.id) as animalsCount from animals
jOIN species ON species_id = species.id
GROUP BY species.name;

SELECT animals.name, owners.full_name from animals 
JOIN owners ON owner_id = owners.id
WHERE full_name='Jennifer Orwell';

SELECT animals.name, owners.full_name from animals 
JOIN owners ON owner_id = owners.id
WHERE full_name='Dean Winchester' AND escape_attempts is NULL;

SELECT owners.full_name, COUNT(animals.id) AS count
FROM animals
JOIN owners ON owners.id = animals.owner_id
GROUP BY owners.full_name;
