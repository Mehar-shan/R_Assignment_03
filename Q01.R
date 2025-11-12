# Load libraries
library(DBI)
library(RMariaDB)
library(data.table)  # for data manipulation

# Connect to MySQL database
con <- dbConnect(
  RMariaDB::MariaDB(),
  user = "root",
  password = "mysql@576",  # your MySQL password
  dbname = "sakila",
  host = "localhost",
  port = 3306
)

# Load 'film' table from MySQL into R
film <- dbReadTable(con, "film")

# Close the connection (no longer needed)
dbDisconnect(con)

# Convert to data.table (if not already)
film <- as.data.table(film)

# Q1: Films with rating 'PG' and rental_duration > 5 using data.table
pg_films <- film[rating == "PG" & rental_duration > 5, .(film_id, title, rating, rental_duration)]

# Show result
print(pg_films)
