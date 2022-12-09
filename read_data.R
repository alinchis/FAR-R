# load libraries
# readODS, not included in standard package, needs install
library(readODS)

# read data from ODS file
df <- readODS::read_ods(
  path="./data/EU_FAR_database_2016-2021.ods",
  sheet="Database",
  col_names=TRUE
)

# view summary of data
print(summary(df))

# ------------------------------------------------------------------------------
# create list of total fund absorbtion by year, divide by 1mil
funds.total <- c(sum(df['SUM_2016_cst']),
                 sum(df['SUM_2017_cst']),
                 sum(df['SUM_2018_cst']),
                 sum(df['SUM_2019_cst']),
                 sum(df['SUM_2020_cst']),
                 sum(df['SUM_2021_cst'])) / 1000000

# barchart for total
barplot(
  funds.total,
  main = "Total Funds Absorbtion",
  xlab = "Year",
  ylab = "Funds (Mil EURO)",
  names.arg = c("2016", "2017", "2018", "2019", "2020", "2021"),
  horiz = FALSE,
  border="red",
  col="blue",
  density=10
)

# ------------------------------------------------------------------------------
# create list of mean values, mean absorbtion funds by locality (remove 0 values), divide by 1mil
funds.mean <- c(mean(df$SUM_2016_cst[df$SUM_2016_cst > 0]),
                mean(df$SUM_2017_cst[df$SUM_2017_cst > 0]),
                mean(df$SUM_2018_cst[df$SUM_2018_cst > 0]),
                mean(df$SUM_2019_cst[df$SUM_2019_cst > 0]),
                mean(df$SUM_2020_cst[df$SUM_2020_cst > 0]),
                mean(df$SUM_2021_cst[df$SUM_2021_cst > 0])) / 1000000

# barchart for mean
barplot(
  funds.mean,
  main = "Mean Funds Absorbtion",
  xlab = "Year",
  ylab = "Funds (Mil EURO)",
  names.arg = c("2016", "2017", "2018", "2019", "2020", "2021"),
  horiz = FALSE,
  border="green",
  col="orange",
  density=10
)
