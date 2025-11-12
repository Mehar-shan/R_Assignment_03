# Q3: Load libraries
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

# Load film and language tables
film     <- as.data.table(dbReadTable(con, "film"))
language <- as.data.table(dbReadTable(con, "language"))

# Close connection
dbDisconnect(con)

# Merge tables to get language names
film_lang <- merge(film, language, by = "language_id", all.x = TRUE)

# Count total films per language
film_count <- film_lang[, .N, by = .(name)]
setnames(film_count, "N", "total_films")
print(film_count)
