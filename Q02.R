# Load the DBI package, which provides a common interface for database access in R
library(DBI)

# Load RMariaDB package, which allows R to connect to MySQL/MariaDB databases
library(RMariaDB)

# Establish a connection to the MySQL Workbench database
con <- dbConnect(
  RMariaDB::MariaDB(),       # Specify the driver to use (MariaDB/MySQL)
  user = "root",             # MySQL username
  password = "mysql@576",    # MySQL password (replace with your actual password)
  dbname = "sakila",         # Name of the database to connect to
  host = "localhost",        # Host where MySQL is running
  port = 3306                # Port number (default MySQL port)
)

# Define the SQL query as a string
# This query calculates the average rental rate for each film rating
query <- "
SELECT rating, ROUND(AVG(rental_rate),2) AS avg_rental_rate
FROM film
GROUP BY rating;
"

# Execute the SQL query on the connected database
# dbGetQuery sends the query and returns the result as a data frame in R
result <- dbGetQuery(con, query)

# Print the result in the R console
# This will display the rating and its corresponding average rental rate
print(result)

# Close the database connection after finishing
# Always close connections to free resources and avoid potential issues
dbDisconnect(con)
