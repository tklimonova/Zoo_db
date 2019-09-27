CREATE TABLE employees (
	emp_Id SERIAL PRIMARY KEY,
	emp_name varchar(255),
	emp_position varchar(255),
	emp_salary int NOT NULL
);

INSERT INTO employees(emp_name, emp_position, emp_salary)
VALUES
('Max Svensson', 'Animal Curator', 50000), 
('Viktor Larsson', 'Veterinarian', 60000),
('Eleonora Huss', 'General Curator', 45000), 
('Victoria Svytka', 'Registrar', 44000);

CREATE TABLE animals(
	animal_id SERIAL PRIMARY KEY,
	animal_name VARCHAR(255) NOT NULL,
	animal_gender CHAR(1),
	animal_type VARCHAR(20) NOT NULL,
	emp_id_fk INTEGER references employees(emp_id)
);

INSERT INTO animals(animal_name, animal_gender, animal_type, emp_id_fk)
VALUES
('lion', 'm', 'mammals', 1), 
('giraffe', 'f', 'mammals', 3), 
('panda', 'm', 'mammals', 1),
('flamingo', 'm', 'birds', 2), 
('rhinocerose', 'm', 'mammals', 1), 
('zebra', 'f', 'mammals', 3), 
('tiger', 'm', 'mammals', 1),
('penguin', 'm', 'birds', 2);

INSERT INTO employees(emp_name, emp_position, emp_salary)
VALUES
('Leyla Roos', 'Zoo keeper', 25000), 
('Nadia Koko', 'Naturalist', 30000), 
('Viktor Koko', 'Aquarist', 39000);

CREATE TABLE events(
	ev_id SERIAL PRIMARY KEY,
	ev_name VARCHAR(225) NOT NULL,
	ev_price INTEGER,
	ev_date timestamp NOT NULL,
	emp_id_fk INTEGER references employees(emp_id),
	animal_id_fk INTEGER references animals(animal_id)
);

INSERT INTO events(ev_name, ev_price, ev_date, emp_id_fk, animal_id_fk)
VALUES
('Halloween in the Zoo', 300, '2019-10-26 19:00:00', 3, 3),
('Christmas in the Zoo', 400, '2019-12-23 16:00:00', 3, 8);

CREATE TABLE customers(
	cus_id SERIAL PRIMARY KEY,
	cus_name VARCHAR(255) NOT NULL,
	cus_gender CHAR(1),
	ev_id_fk INTEGER references events(ev_id)
);

INSERT INTO customers(cus_name, cus_gender, ev_id_fk)
VALUES
('Max Cherry', 'm', 1), 
('Victor Petursson', 'm', 1),
('Maria Peterson', 'f', 2), 
('Peter Larsson', 'm', 2),
('Lisa Svennson','f', 2);

INSERT INTO animals(animal_name, animal_gender, animal_type, emp_id_fk)
VALUES('iguana', 'm', 'reptile', 7), ('snakes', 'f', 'reptile', 6);

CREATE TABLE cages(
	cage_id SERIAL PRIMARY KEY,
	cage_name VARCHAR(255) NOT NULL,
	cage_location VARCHAR(255) NOT NULL,
	emp_id_fk INTEGER references employees(emp_id),
	animal_id_fk INTEGER references animals(animal_id)
);

INSERT INTO cages
(cage_name, cage_location, emp_id_fk, animal_id_fk)
VALUES
('Pride animals', 'African Savanna', 1, 1), 
('Horse family', 'African Savanna', 1, 6),
('Tall mammals', 'African Savanna', 3, 2), 
('Reptiles World', 'Terrarium', 7, 9),
('Cold Birds', 'Antarctica', 1, 8), 
('Long tail', 'Terrarium', 7, 10), 
('Flamingo Heaven', 'African Savanna', 6, 4),
('Wild animals', 'African Savanna', 1, 7), 
('Panda embarrassment', 'African Savanna', 3, 3),
('Rhinocerose crash', 'African Savanna', 6, 5);

CREATE TABLE cleans(
	clean_date timestamp NOT NULL,
	emp_id_fk INTEGER references employees(emp_id),
	cage_id_fk INTEGER references cages(cage_id)
);

INSERT INTO cleans
(clean_date, emp_id_fk, cage_id_fk)
VALUES
('2019-09-12 07:00:00', 1, 1),
('2019-08-23 08:00:00', 3, 4),
('2019-07-21 07:00:00', 5, 2),
('2019-08-21 07:00:00', 5, 3),
('2019-08-11 06:00:00', 5, 5),
('2019-08-21 07:00:00', 5, 6),
('2019-08-21 07:00:00', 5, 7),
('2019-08-21 06:00:00', 5, 8);
