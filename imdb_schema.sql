--Create this table first becaurse it is the referenc for the other table foreign keys
CREATE TABLE imdb_rts (
    titleType VARCHAR(255),
    primaryTitle VARCHAR (255) NOT NULL,
    originalTitle VARCHAR (255),
    startYear INTEGER NOT NULL,
    runtimeMinutes INTEGER,
    genres VARCHAR (255),
    averageRating DOUBLE NOT NULL,
    numVotes INTEGER,
    PRIMARY KEY (primaryTitle, startYear)

--foreign keys for other table
--FOREIGN KEY (title) REFERENCES imdb_rts(primaryTitle),
--FOREIGN KEY (year) REFERENCES imdb_rts(startYear)

);