# Q4: Load libraries
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

# Load only customer table
customer <- as.data.table(dbReadTable(con, "customer"))

# Close connection
dbDisconnect(con)

# Q4 query using data.table
customer_store <- customer[, .(
  customer_name = paste(first_name, last_name),
  store_id
)]
print(customer_store)
