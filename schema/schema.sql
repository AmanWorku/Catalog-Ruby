-- Create book table 
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

-- Create labels table 
CREATE TABLE labels (
  id SERIAL PRIMARY KEY,
  title VARCHAR(50) NOT NULL,
  color VARCHAR(50) NOT NULL
);

-- Create music album table 
CREATE TABLE music_albums (
  id SERIAL,
  publish_date DATE NOT NULL DEFAULT CURRENT_DATE,
  on_spotify boolean,
  archived boolean,
  genre_id INT,
  label_id INT,
  author_id INT,
  CONSTRAINT fk_genre FOREIGN KEY (genre_id) REFERENCES genres(genre_id)
  CONSTRAINT fk_label FOREIGN KEY (label_id) REFERENCES label(label_id)
  CONSTRAINT fk_author FOREIGN KEY (author_id) REFERENCES authors(author_id)
  PRIMARY KEY(id)
);

-- Create genre table 
CREATE TABLE genres (
  genre_id SERIAL,
  name VARCHAR(100),
  PRIMARY KEY(genre_id)
);