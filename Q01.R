# Load libraries
library(DBI)
library(RMariaDB)

# Connect to MySQL
con <- dbConnect(
  RMariaDB::MariaDB(),
  user = "root",
  password = "mysql@576",  # your MySQL password
  dbname = "sakila",
  host = "localhost",
  port = 3306
)

# Q1: Films with rating 'PG' and rental_duration > 5
query <- "
SELECT film_id, title, rating, rental_duration
FROM film
WHERE rating = 'PG' AND rental_duration > 5;
"

# Execute query
result <- dbGetQuery(con, query)

# Show result
print(result)

# Close connection
dbDisconnect(con)
