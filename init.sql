CREATE TABLE IF NOT EXISTS Genres (
id SERIAL PRIMARY KEY,
genre_name VARCHAR(60) UNIQUE NOT NULL
);


CREATE TABLE IF NOT EXISTS Artists (
id SERIAL PRIMARY KEY,
artist_name VARCHAR(60) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS Artists_Genres (
genre_id INTEGER REFERENCES Genres(id),
artist_id INTEGER REFERENCES Artists(id),
CONSTRAINT pk PRIMARY KEY (genre_id, artist_id)
);

CREATE TABLE IF NOT EXISTS Albums (
id SERIAL PRIMARY KEY,
album_name VARCHAR(60) NOT NULL,
release_year INTEGER NOT NULL,
CHECK (release_year > 1900)
);

CREATE TABLE IF NOT EXISTS Albums_Artists (
album_id INTEGER REFERENCES Albums(id),
artist_id INTEGER REFERENCES Artists(id),
CONSTRAINT pk2 PRIMARY KEY (album_id, artist_id)
);

CREATE TABLE IF NOT EXISTS Tracks (
id SERIAL PRIMARY KEY,
track_name VARCHAR(60) NOT NULL,
duration_in_sec INTEGER NOT NULL,
album_id INTEGER NOT NULL REFERENCES Albums(id)
);

CREATE TABLE IF NOT EXISTS Collections (
id SERIAL PRIMARY KEY,
collection_name VARCHAR(60) NOT NULL,
release_year INTEGER NOT NULL,
CHECK (release_year > 1900)
);

CREATE TABLE IF NOT EXISTS Collections_Tracks (
collection_id INTEGER REFERENCES Collections(id),
track_id INTEGER REFERENCES Tracks(id),
CONSTRAINT pk3 PRIMARY KEY (collection_id, track_id)
);