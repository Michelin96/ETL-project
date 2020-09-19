--Create the tables, primary, and foreign keys
--Create the imdb_rts table first because it is the reference for the other table foreign keys
CREATE TABLE IF NOT EXISTS imdb_rts (
    titleType VARCHAR(255),
    primaryTitle VARCHAR (255) NOT NULL,
    originalTitle VARCHAR (255),
    startYear INTEGER NOT NULL,
    runtimeMinutes INTEGER,
    genres VARCHAR (255),
    averageRating FLOAT,
    numVotes FLOAT,
    PRIMARY KEY (primaryTitle, startYear, runtimeMinutes)
);

-- Create the Netflix/Rotten Tomatoes table
CREATE TABLE IF NOT EXISTS netflix_rts (
	title VARCHAR(255) NOT NULL,
	year INTEGER NOT NULL,
	age INTEGER, 
	rotten_tomatoes_prcnt FLOAT,
	netflix integer NOT NULL,
	directors varchar(255),
	genres varchar(255),
	country varchar(255),
	language varchar(255),
	runtime INTEGER,	
	PRIMARY KEY (title,year,runtime)
	
);
--Create junction table to identify movies in both and create a composite key
CREATE TABLE IF NOT EXISTS junction(
	title VARCHAR(255) NOT NULL,
	year INTEGER NOT NULL,
	runtime FLOAT NOT NULL,
	PRIMARY KEY (title,year,runtime),
	FOREIGN KEY (title,year,runtime) REFERENCES netflix_rts(title, year, runtime),
	FOREIGN KEY (title,year,runtime) REFERENCES imdb_rts(primaryTitle, startYear, runtimeMinutes)
);