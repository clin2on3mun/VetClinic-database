/* Populate database with sample data. */

INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Agumon', 'feb-3-2020', 0, true, 10.23),
 ('Gabumon', 'Nov-15-2018', 2, true, 8),
('Pikachu', 'Jan-7-2021', 1, false, 15.04),
('Devimon', 'May-12-2017', 5, true, 11),
('Charmander', 'FEB-8-2020', 0,false, -11),('Plantmon', 'NOV-15-2021',2,true,-5.7),
('Squirtle', 'APR-2-1993', 3, false,-12.13),('Angemon', 'jun-12-2005',1,true, -45),
('Boarmon', 'jun-7-2005', 7, true, 20.4),('Blossom', 'OCT-13-1998', 3, true, 17),
('Ditto', 'May-14-2022', 4, true, 22);

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

INSERT INTO vets(name, age, date_of_graduation)
VALUES('William Tatcher', 45, 'APR-23-2000'),('Maisy Smith', 26, 'jan-17-2019'),
('Stephanie Mendez', 64, 'may-4-1981'),('Jack Harkness', 38, 'jun-8-2008');

INSERT INTO specialization(vet,species)
VALUES(1,1),(3,2),(3,1),(4,2);

INSERT INTO visits(animal,vet,visit_date)
VALUES(1,1, 'may-24-2020'),(1,3, 'Jul-22-2020'),(2,4,'feb-2-2021'),(3,2,'jan-5-2020'),
(3,2,'Mar-8-2020'),(3,2,'May-14-2020'),(4,3,'May-4-2021'),(5,4,'feb-24-2021'),
(6,2,'DEC-21-2019'),(6,1,'Aug-10-2020'),(6,2, 'APR-7-2021'),(7,3,'SEP-29-2019'),
(8,4,'OCT-3-2020'),(8,4,'NOV-4-2020'),(9,2,'JAN-24-2019'),(9,2,'MAY-15-2019'),
(9,2,'FEB-27-2020'),(9,2,'Aug-3-2020'),(10,3,'MAY-24-2020'),(10,1,'JAN-11-2021');

