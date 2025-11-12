# Q7: Load libraries
library(DBI)
library(RMariaDB)
library(data.table)
library(ggplot2)

# Connect to MySQL
con <- dbConnect(
  RMariaDB::MariaDB(),
  user = "root",
  password = "mysql@576",
  dbname = "sakila",
  host = "localhost",
  port = 3306
)

# Load film table
film <- as.data.table(dbReadTable(con, "film"))

# Close connection
dbDisconnect(con)

# Plot histogram of film lengths
ggplot(film, aes(x = length)) +
  geom_histogram(binwidth = 10, fill = "skyblue", color = "black") +
  labs(title = "Histogram of Film Lengths", x = "Length (minutes)", y = "Count")
