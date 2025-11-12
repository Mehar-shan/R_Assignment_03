# Q6: Load libraries
library(DBI)
library(RMariaDB)
library(data.table)

# Connect to MySQL
con <- dbConnect(
  RMariaDB::MariaDB(),
  user = "root",
  password = "mysql@576",
  dbname = "sakila",
  host = "localhost",
  port = 3306
)

# Load film and rental tables
film   <- as.data.table(dbReadTable(con, "film"))
rental <- as.data.table(dbReadTable(con, "rental"))

# Close connection
dbDisconnect(con)

# Find films not rented
rented_films <- unique(rental$film_id)
not_rented <- film[!film_id %in% rented_films, .(film_id, title)]
print(not_rented)
