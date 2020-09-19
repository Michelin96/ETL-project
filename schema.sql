-- Create new table
CREATE TABLE netflix_rts (
	title VARCHAR(255) NOT NULL,
	year INTEGER NOT NULL,
	age INTEGER, 
	rotten_tomatoes_prcnt DOUBLE NOT NULL,
	netflix integer NOT NULL,
	directors varchar(255),
	genres varchar(255),
	country varchar(255),
	language varchar(255),
	runtime INTEGER	
	PRIMARY KEY (title,year)
	--,
-- 	FOREIGN KEY(dept_no) REFERENCES departments(dept_no),
-- 	FOREIGN KEY(emp_no) REFERENCES employees(emp_no)
);

-- -- View table columns and datatypes
-- SELECT * FROM netflix_rts;