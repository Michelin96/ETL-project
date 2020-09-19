# ETL-project

This project takes movies that have been rated by two different sources and compares those ratings.

## Extraction

We decided to evaluate movies that have been rated by two popular sources, IMDB and Rotten Tomatoes. Our data set for IMDB ratings came from <a href="https://data.world/eng/imdb-movies">data.world</a> and the data set for Rotten Tomatoes ratings from <a href="https://www.kaggle.com/ruchi798/movies-on-netflix-prime-video-hulu-and-disney?select=MoviesOnStreamingPlatforms_updated.csv">www.kaggle.com.</a>

The Rotten Tomatoes dataset also had columns with ratings from other movie review sites. We cleaned up the data so that only the scores from movies were displayed with scores from Rotten Tomatoes. After this step, we dropped any rows that had NaN values which dropped the number of rows from around 3300 to 1000. The Rotten Tomatoes scores were displated as percentages so we changed the daya types from string values to integers. Lastly, the 'Age' column in the table had special characters which had to be removed which also converted those valued from strings to integers. After this was completed, the cleaned dataframe was exported as a csv file that was used in the next step in the ETL process.

## Transformation

### IMDB Data 
The IMDB data was in an SQLite file and downloaded from Data World (https://data.world/eng/imdb-movies). I used a jupyter notebook to extract the existing tables and create dataframes. I identified the two tables needed ('movies' and 'ratings') that provide the main information and keys between our two sources. After identifing the keys, I removed rows that where there was blank data for keys or other major fields. Then because the SQLite file was to large to move to our Master on Github, I saved the dataframe to a csv.

## Loading

Loading the tables in to the database presented some challenges. First, there were duplicate rows in the IMDB csv that needed to be dropped, so the file was loaded back in to jupyter notebook to removed those rows. So some of the titles still showed as duplicates when using a primary composite key of the title and release year. Further investigation reveald that at least one title had a different runtime. The runtime was added to the composite key.

Second, the data types in the age and runtime colums were not consistatnt. "Age" in the Netflix table included a vaule of "all", so the datatype had to be changed to a string. Ratings were formated and decimals in one table, so both were changed to a float to accomodate the composite key. 

Third, titles in the IMDB csv used single quotes, which posgreSQL interpreted as end of strings. The csv was edited to add two single quotes to create an escape character for correct SQL data interpretation.

## How To Use The Database

You will need to have installed postreSQL (pgAdmin4). This can be found at <a href= "https://www.postgresql.org/download>postgresql.org">postgresql.org</a>.

The ETL_ERD.jpeg is a diagram that shows the table columns, data types, primary keys and relationship for this database.

Create a new postgreSQL database. In the Tables Query Tool, run the code from the db_schema.sql file. This will create the table schema for the three tables that correspond to the data CSV files (see the ETL_ERD.jpeg for visual reference). Import the CSV's in to the tables in the following order: imdb_rts.csv, netflix_rts.csv, junction.csv.

### Datbase Queries

Note: The primary key in each table is a composite of the three data columns for title, year, and runtime.

The queries.sql file contains a sample query to run on the database.
