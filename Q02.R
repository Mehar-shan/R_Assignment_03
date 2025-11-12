# Q2: Load libraries
library(DBI)
library(RMariaDB)
library(data.table)

# Connect to MySQL database
con <- dbConnect(
  RMariaDB::MariaDB(),
  user = "root",
  password = "mysql@576",
  dbname = "sakila",
  host = "localhost",
  port = 3306
)

# Load only film table
film <- as.data.table(dbReadTable(con, "film"))

# Close connection
dbDisconnect(con)

# Q2 query using data.table
avg_rental <- film[, .(avg_rental_rate = round(mean(rental_rate, na.rm = TRUE),2)), by = rating]
print(avg_rental)
