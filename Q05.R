# Q5: Load libraries
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

# Load payment and staff tables
payment <- as.data.table(dbReadTable(con, "payment"))
staff   <- as.data.table(dbReadTable(con, "staff"))

# Close connection
dbDisconnect(con)

# Q5 query using data.table
payment_staff <- merge(payment, staff, by = "staff_id", all.x = TRUE)
payment_info <- payment_staff[, .(
  payment_id,
  amount,
  payment_date,
  staff_name = paste(first_name, last_name)
)]
print(payment_info)
