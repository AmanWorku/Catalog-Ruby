CREATE TABLE books (
  id SERIAL PRIMARY KEY,
  publisher VARCHAR,
  cover_state VARCHAR,
  genre_id INT NULL REFERENCES genres(id), -- To be created later
  author_id INT NULL REFERENCES authors(id),-- To be created later
  label_id INT NULL REFERENCES labels(id),-- To be created later
  publish_date DATE NOT NULL,
  archived BOOLEAN NOT NULL
);

CREATE TABLE labels (
  id SERIAL PRIMARY KEY,
  title VARCHAR(50) NOT NULL,
  color VARCHAR(50) NOT NULL
);