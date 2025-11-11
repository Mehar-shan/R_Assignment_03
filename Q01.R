# Load required libraries
library(DBI)
library(RMariaDB)

# Create a connection to MySQL
con <- dbConnect(
  RMariaDB::MariaDB(),
  user = "root",
  password = "mysql@576",   # Replace with your MySQL root password
  dbname = "sakila",                 # The database name you want to use
  host = "localhost",
  port = 3306
)

# Check if the connection is successful
print("✅ Connected to MySQL successfully!")

# List all tables in the sakila database
tables <- dbListTables(con)
print("Available Tables in Sakila:")
print(tables)

# Example: Read data from the 'film' table
film_data <- dbReadTable(con, "film")
print(head(film_data))

# Optional: Write this table to CSV
write.csv(film_data, "film.csv", row.names = FALSE)
print("✅ 'film.csv' exported successfully!")

# Disconnect after done
dbDisconnect(con)
print("🔌 Connection closed.")
