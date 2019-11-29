DROP TABLE IF EXISTS yoga_experiences;
DROP TABLE IF EXISTS yogas;
DROP TABLE IF EXISTS attractions;
DROP TABLE IF EXISTS cities;
DROP TABLE IF EXISTS countries;
DROP TABLE IF EXISTS continents;

CREATE TABLE continents(
  id SERIAL PRIMARY KEY,
  name VARCHAR,
  visited BOOLEAN,
  size INT
);

CREATE TABLE countries(
  id SERIAL PRIMARY KEY,
  name VARCHAR,
  visited BOOLEAN,
  continent_id INT REFERENCES continents(id) ON DELETE CASCADE
);

CREATE TABLE cities(
  id SERIAL PRIMARY KEY,
  name VARCHAR,
  visited BOOLEAN,
  country_id INT REFERENCES countries(id) ON DELETE CASCADE,
  map_url VARCHAR,
  distance INT
);

CREATE TABLE yogas(
  id SERIAL PRIMARY KEY,
  type VARCHAR,
  description TEXT,
  practises INT
);

CREATE TABLE yoga_experiences(
  id SERIAL PRIMARY KEY,
  studio_name VARCHAR,
  city_id INT REFERENCES cities(id) ON DELETE CASCADE,
  yoga_id INT REFERENCES yogas(id) ON DELETE CASCADE,
  review TEXT
);

CREATE TABLE attractions(
  id SERIAL PRIMARY KEY,
  name VARCHAR,
  visited BOOLEAN,
  city_id INT REFERENCES cities(id) ON DELETE CASCADE,
  rating INT
);
