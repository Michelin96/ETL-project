# ETL-project

This project takes movies that have been rated by two different sources and compares those ratings.

## Extraction

We decided to evaluate movies that have been rated by two popular sources, IMDB and Rotten Tomatoes. Our data set for IMDB ratings came from <a href="https://data.world/eng/imdb-movies">data.world</a> and the data set for Rotten Tomatoes ratings from <a href="https://www.kaggle.com/ruchi798/movies-on-netflix-prime-video-hulu-and-disney?select=MoviesOnStreamingPlatforms_updated.csv">www.kaggle.com.</a>

The Rotten Tomatoes dataset also had columns with ratings from other movie review sites. We cleaned up the data so that only the scores from movies were displayed with scores from Rotten Tomatoes. After this step, we dropped any rows that had NaN values which dropped the number of rows from around 3300 to 1000. The Rotten Tomatoes scores were displated as percentages so we changed the daya types from string values to integers. Lastly, the 'Age' column in the table had special characters which had to be removed which also converted those valued from strings to integers. After this was completed, the cleaned dataframe was exported as a csv file that was used in the next step in the ETL process.

## Transformation


## Loading

Use the db_schema.sql file in postgreSQL (pgAdmin4) to creat the tables. Load the csv's into the tables. The imdb.csv should be loaded first. 

## How To Use The Database

Datbase Queries

* Filter the rows with Netfilx ratings
* Sort by highest Netflix or RT rating
* Sort by hightest IMDB Rating
* Filter/aggregate the top 10 genres by both ratings (which genres have the highest average in both rating scales )
