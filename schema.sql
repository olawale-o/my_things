CREATE DATABASE my_things;

CREATE TABLE genres(
  id INT UNIQUE GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(100),
  PRIMARY KEY(id)
);

CREATE TABLE sources(
  id INT UNIQUE GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(100),
  PRIMARY KEY(id)
);

CREATE TABLE authors(
  id INT UNIQUE GENERATED ALWAYS AS IDENTITY,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  PRIMARY KEY(id)
);

CREATE TABLE labels(
  id INT UNIQUE GENERATED ALWAYS AS IDENTITY,
  title VARCHAR(100),
  color VARCHAR(100),
  PRIMARY KEY(id)
);

CREATE TABLE books(
  id INT UNIQUE GENERATED ALWAYS AS IDENTITY,
  genre_id INT,
  author_id INT,
  source_id INT,
  label_id INT,
  publish_date DATE,
  archived BOOLEAN DEFAULT false,
  publisher VARCHAR(100),
  cover_state VARCHAR(100),
  PRIMARY KEY(id),
  CONSTRAINT fk_genres
  FOREIGN KEY(genre_id)
  REFERENCES genres(id),
  CONSTRAINT fk_authors
  FOREIGN KEY(author_id)
  REFERENCES authors(id)
  CONSTRAINT fk_sources
  FOREIGN KEY(source_id)
  REFERENCES sources(id)
  CONSTRAINT fk_labels
  FOREIGN KEY(label_id)
  REFERENCES labels(id)
);

CREATE INDEX idx_books_genre_id ON books (genre_id);
CREATE INDEX idx_books_auhor_id ON books (author_id);
CREATE INDEX idx_books_source_id ON books (source_id);
CREATE INDEX idx_books_label_id ON books (label_id);

CREATE TABLE music_albums(
  id INT UNIQUE GENERATED ALWAYS AS IDENTITY,
  genre_id INT,
  author_id INT,
  source_id INT,
  label_id INT,
  publish_date DATE,
  archived BOOLEAN DEFAULT false,
  on_spotify BOOLEAN DEFAULT false,
  PRIMARY KEY(id),
  CONSTRAINT fk_genres
  FOREIGN KEY(genre_id)
  REFERENCES genres(id),
  CONSTRAINT fk_authors
  FOREIGN KEY(author_id)
  REFERENCES authors(id)
  CONSTRAINT fk_sources
  FOREIGN KEY(source_id)
  REFERENCES sources(id)
  CONSTRAINT fk_labels
  FOREIGN KEY(label_id)
  REFERENCES labels(id)
);

CREATE INDEX idx_music_albums_genre_id ON books (genre_id);
CREATE INDEX idx_music_albums_auhor_id ON books (author_id);
CREATE INDEX idx_music_albums_source_id ON books (source_id);
CREATE INDEX idx_music_albums_label_id ON books (label_id);

CREATE TABLE movies(
  id INT UNIQUE GENERATED ALWAYS AS IDENTITY,
  genre_id INT,
  author_id INT,
  source_id INT,
  label_id INT,
  publish_date DATE,
  archived BOOLEAN DEFAULT false,
  silet BOOLEAN DEFAULT false,
  PRIMARY KEY(id),
  CONSTRAINT fk_genres
  FOREIGN KEY(genre_id)
  REFERENCES genres(id),
  CONSTRAINT fk_authors
  FOREIGN KEY(author_id)
  REFERENCES authors(id)
  CONSTRAINT fk_sources
  FOREIGN KEY(source_id)
  REFERENCES sources(id)
  CONSTRAINT fk_labels
  FOREIGN KEY(label_id)
  REFERENCES labels(id)
);

CREATE INDEX idx_movies_genre_id ON books (genre_id);
CREATE INDEX idx_movies_auhor_id ON books (author_id);
CREATE INDEX idx_movies_source_id ON books (source_id);
CREATE INDEX idx_movies_label_id ON books (label_id);
