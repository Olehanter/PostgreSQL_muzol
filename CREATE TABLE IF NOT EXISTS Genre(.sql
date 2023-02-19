CREATE TABLE IF NOT EXISTS Genre(
	genre_id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL,
	text_ TEXT
);

CREATE TABLE IF NOT EXISTS Executor (
	executor_id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL,
	nickname VARCHAR(40),
	albom_list TEXT
);

CREATE TABLE IF NOT EXISTS Genre_Executor (
	executor_id INTEGER REFERENCES Executor(executor_id),
	genre_id INTEGER REFERENCES Genre(genre_id),
	CONSTRAINT ge primary key (executor_id, genre_id)
);

CREATE TABLE IF NOT EXISTS Album (
	album_id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL,
	create_at DATE NOT NULL,
	trek_list TEXT NOT NULL
	
);

CREATE TABLE IF NOT EXISTS Executor_Album (
	executor_id INTEGER REFERENCES Executor(executor_id),
	album_id INTEGER REFERENCES Album(album_id),
	CONSTRAINT exal PRIMARY KEY (executor_id, album_id)
);

CREATE TABLE IF NOT EXISTS Track (
	track_id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL,
	duration TIMESTAMP NOT NULL,
	album_id INTEGER NOT NULL REFERENCES Album(album_id),
	avtor VARCHAR(40) NOT NULL
);

CREATE TABLE IF NOT EXISTS Album_Track (
	track_id INTEGER REFERENCES Track(track_id),
	album_id INTEGER REFERENCES Album(album_id),
	CONSTRAINT altr PRIMARY KEY (track_id, album_id)
);

CREATE TABLE IF NOT EXISTS Compilation (
	compilation_id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL,
	create_at DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS Track_Compilation (
	track_id INTEGER REFERENCES Track(track_id),
	compilation_id INTEGER REFERENCES Compilation(compilation_id),
	CONSTRAINT tcom PRIMARY KEY (track_id, compilation_id)
);