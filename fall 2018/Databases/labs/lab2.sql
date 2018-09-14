CREATE DATABASE lab2;

CREATE TABLE countries(
  country_id  SERIAL PRIMARY KEY,
  country_name CHAR(50),
  region_id INTEGER,
  population INTEGER
);


INSERT INTO countries(country_name, region_id, population)
VALUES('Russia', 500, 10000);

INSERT INTO countries(country_name)
VALUES('England');

INSERT INTO countries(region_id)
VALUES(NULL);

INSERT INTO countries(country_name, region_id, population)
VALUES('China', 327, 999999), ('Italy', 286, 500000), ('Spain', 517, 48000);

ALTER TABLE countries ALTER COLUMN country_name SET DEFAULT 'Kazakhstan';

INSERT INTO countries VALUES (DEFAULT, DEFAULT, 407, 170000);

INSERT INTO countries DEFAULT VALUES;

CREATE TABLE countries_new (
  LIKE countries
);

INSERT INTO countries_new SELECT * FROM countries RETURNING *;

UPDATE countries SET region_id = 1 WHERE region_id IS NULL;

UPDATE countries SET population = population * 1.1 RETURNING country_name, population as "New Population";

DELETE FROM countries WHERE population < 100000;

DELETE FROM countries AS c USING countries_new AS n WHERE c.country_id = n.country_id RETURNING *;

DELETE FROM countries;

SELECT * FROM countries;
SELECT * FROM countries_new;

/*DROP TABLE countries;
DROP TABLE countries_new;*/
