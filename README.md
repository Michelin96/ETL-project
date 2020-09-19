# ETL-project

This project takes movies that have been rated by two different sources and compares those ratings.

## Extraction

We decided to evaluate movies that have been rated by two popular sources, IMDB and Rotten Tomatoes. Our data set for IMDB ratings came from <a href="https://data.world/eng/imdb-movies">data.world</a> and the data set for Rotten Tomatoes ratings from <a href="https://www.kaggle.com/ruchi798/movies-on-netflix-prime-video-hulu-and-disney?select=MoviesOnStreamingPlatforms_updated.csv">www.kaggle.com.</a>

The Rotten Tomatoes dataset also had columns with ratings from other movie review sites. We cleaned up the data so that only the scores from movies were displayed with scores from Rotten Tomatoes. After this step, we dropped any rows that had NaN values which dropped the number of rows from around 3300 to 1000. The Rotten Tomatoes scores were displated as percentages so we changed the daya types from string values to integers. Lastly, the 'Age' column in the table had special characters which had to be removed which also converted those valued from strings to integers. After this was completed, the cleaned dataframe was exported as a csv file that was used in the next step in the ETL process.

## Transformation

### IMDB Data 
The IMDB data was in an SQLite file and downloaded from Data World (https://data.world/eng/imdb-movies). I used a jupyter notebook to extract the existing tables and create dataframes. I identified the two tables needed ('movies' and 'ratings') that provide the main information and keys between our two sources. After identifing the keys, I removed rows that where there was blank data for keys or other major fields. Then because the SQLite file was to large to move to our Master on Github, I saved the dataframe to a csv.

## Loading

Use the db_schema.sql file in postgreSQL (pgAdmin4) to creat the tables. Load the csv's into the tables. The imdb.csv should be loaded first.

Loading the tables in to the database presented some challenges. First, there were duplicate rows in the IMDB csv that needed to be dropped, so the file was loaded back in to jupyter notebook to removed those rows. So some of the titles sill showed as duplicates when using a primary composite key of the title and release year. Further investigation reveald that at least one title had a different runtime. The runtime was added to the composite key.

Second, the data types in the age and runtime colums were not consistatnt. "Age" in the Netflixs table included a vaule of "all", so the datatype had to be changed to a string. Ratings were formated and decimals in one table, so both were changed to a float to accomodate the composite key. 

Third, titles in the IMDB csv used single quotes, which posgreSQL interpreted as end of strings. The csv was edited to add two single quotes to create an escape character for correct SQL data interpretation.

## How To Use The Database

Use the db_schema.sql file in postgreSQL (pgAdmin4) to creat the tables. Load the csv's into the tables. The imdb.csv should be loaded first.

Datbase Queries

* Filter the rows with Netfilx ratings
* Sort by highest Netflix or RT rating
* Sort by hightest IMDB Rating
* Filter/aggregate the top 10 genres by both ratings (which genres have the highest average in both rating scales )
* Show average difference (percentage basis) for ratings between imdb and netflix
