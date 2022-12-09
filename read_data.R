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
# create list of total funds absorbed by year, divided by 1mil for readability
funds.total <- c(sum(df['SUM_inhab_2016']),
                 sum(df['SUM_inhab_2017']),
                 sum(df['SUM_inhab_2018']),
                 sum(df['SUM_inhab_2019']),
                 sum(df['SUM_inhab_2020']),
                 sum(df['SUM_inhab_2021']),
                 sum(df['SUM_EU_2016_2021_inhab'])
                 ) / 1000000

# barchart for total
barplot(
  funds.total,
  main = "Total sum of EU funds absorbed (in mil euro, at constant 2010 prices/ inhabitant)",
  xlab = "Year",
  ylab = "Funds (Mil EURO)",
  names.arg = c("2016", "2017", "2018", "2019", "2020", "2021", "SUM 2016-2021"),
  horiz = FALSE,
  border="red",
  col="blue",
  density=10
)

# ------------------------------------------------------------------------------
# create list of mean values, mean of funds absorbed by LAU (removed 0 values)
funds.mean <- c(mean(df$SUM_inhab_2016[df$SUM_inhab_2016 > 0]),
                mean(df$SUM_inhab_2017[df$SUM_inhab_2017 > 0]),
                mean(df$SUM_inhab_2018[df$SUM_inhab_2018 > 0]),
                mean(df$SUM_inhab_2019[df$SUM_inhab_2019 > 0]),
                mean(df$SUM_inhab_2020[df$SUM_inhab_2020 > 0]),
                mean(df$SUM_inhab_2021[df$SUM_inhab_2021 > 0]),
                mean(df$SUM_EU_2016_2021_inhab[df$SUM_EU_2016_2021_inhab > 0])
                )

# barchart for mean
barplot(
  funds.mean,
  main = "Mean of EU funds absorbed (in euro, at constant 2010 prices/ inhabitant)",
  xlab = "Year",
  ylab = "Funds (EURO)",
  names.arg = c("2016", "2017", "2018", "2019", "2020", "2021", "SUM 2016-2021"),
  horiz = FALSE,
  border="green",
  col="orange",
  density=10
)
