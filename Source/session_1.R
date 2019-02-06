
# Using R as a calculator -------------------------------------------------

1 + 2

1 + 3^2

log(15) - sqrt(3.4)

pnorm(1.96)

# This is a comment and is not evaluated

# Assigning variables -----------------------------------------------------

x = 2
y = 3

x^2 - 3 * y + 5

# Note that R is case-sensitive.

# The 6 different data types in R -----------------------------------------

# Character
"Hello world"

# Numeric
3.14159

# Integer
256

# Logical
TRUE
FALSE

# Factor
factor("smoker")

# Complex number
3i

# Vectors -----------------------------------------------------------------

# A character vector contains strings
c("hello", "world")

# A numeric vector contains numbers
c(1, 2, 3, 4, 5, 6)

# We can easily produce sequences using ':'
1:6

# Creating a dataframe (data set) within R --------------------------------
# 
# Use the data.frame() function to create a dataframe within R.

# Assign the dataframe to an object called 'smoker.df'
smoker.df = data.frame(
  name = c("Chris", "Jane", "Jo", "Zoe", "Bill"),
  age = c(38, 49, 21, 40, 32),
  smoker = c(TRUE, FALSE, FALSE, TRUE, FALSE))

smoker.df

# Read CSV file into R ----------------------------------------------------
# 
# Use the read.csv() function to read CSV files into R.
issp.df = read.csv("Data/issp demographic.csv", stringsAsFactors = FALSE)

# Check the data ----------------------------------------------------------

# Show the entire data set.
issp.df

# Return the dimensions (rows and columns) of the data set
dim(issp.df)

# Return the first 6 rows
head(issp.df, 6)

# Return the last 4 rows
tail(issp.df, 4)

# Return the names of the variables in the data set
names(issp.df)

# Return information on the structure of the data set (combines all the above 
# functions)
str(issp.df)

# Calculate statistical summaries -----------------------------------------

# Average (mean)
mean(age)

# R can't find the object 'clarity'. We have to specify that 'clarity' is a 
# variable inside the data set 'river.df':
mean(issp.df$age)

# Missing values
mean(issp.df$age, na.rm = TRUE)

# Standard deviation (sd)
sd(issp.df$age, na.rm = TRUE)

# Median
median(issp.df$age, na.rm = TRUE)

# Standard devation
sd(issp.df$age, na.rm = TRUE)

# Variance
var(issp.df$age, na.rm = TRUE)

# Minimum and maximum
min(issp.df$age, na.rm = TRUE) 
max(issp.df$age, na.rm = TRUE)

# 25th and 75th quantile
quantile(issp.df$age, 
         probs = c(.25, .75),
         na.rm = TRUE)

# Interquartile range
IQR(issp.df$age,  na.rm = TRUE)

