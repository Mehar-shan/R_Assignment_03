# Load required libraries
library(DBI)
library(RMariaDB)

# Create a connection to MySQL
con <- dbConnect(
  RMariaDB::MariaDB(),
  user = "root",          # MySQL username
  password = "mysql@576", # MySQL password
  dbname = "sakila",      # Database name
  host = "localhost",     # Server name or address
  port = 3306             # Default MySQL port
)

# Check if connection is successful
print("Connected to MySQL successfully")

# Write MySQL query
query <- "
SELECT title, rental_duration, rental_rate, length
FROM film
ORDER BY rental_duration DESC
LIMIT 5;
"

# Run the query and store result in variable
result <- dbGetQuery(con, query)

# Show the result
print(result)

# Close the connection
dbDisconnect(con)
print("Connection closed")
