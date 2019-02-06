# Load all the R code from the last session
source(textConnection(readLines("Source/session_1.R")[70]))

# Packages in R -------------------------------------------------------
# 
# The ggplot2 package will be used for data visualization in session 6.
# Once the package has been installed, you must load it to be able to use
# its functions.
# 
# Load the ggplot2 package
library(ggplot2)

# Subsetting ----------------------------------------------------------

# Extract the genders for all subjects
issp.df$gender

# Extract the gender of the tenth subject
issp.df$gender[10]

# Extract the genders for the first 5 subjects
issp.df$gender[1:5]

# Extract the genders for all but the first 5 subjects
issp.df$gender[-(1:5)]

# Extract the genders from the third, through to the eighth subject
issp.df$gender[3:8]

# Extract the genders from the third and the eighth subject
issp.df$gender[c(3, 8)]

# Extract the element in the 4th row down and 4th column across
issp.df[4, 4]

# Extract all data (all columns) for the first row
issp.df[1, ]

# Extract all data (all rows) for the 2nd column ()
issp.df[, 2]

# Extract the elements from rows 4 to 6, and from columns 4 to 8
issp.df[4:6, 4:8]

# Subsetting using logical expressions --------------------------------

# Show the marital Status of first 10 subjects
issp.df$marital_status[1:10]

# Return a logical vector for the expression 'marital_status' equals (==) divorced
issp.df$marital_status == "divorced"

# Return the genders of subjects who are divorced
issp.df$gender[issp.df$marital_status == "divorced"]
# (Or, do the same thing with less typing)
with(issp.df, gender[marital_status == "divorced"])

# Assign the genders of subjects who are divorced
divorced_gender = with(issp.df, gender[marital_status == "divorced"])
divorced_gender

# Count how many elements there are in the vector...
length(divorced_gender)
# ... which tells you how subjects are divorced

# A more complex example:
# 
# Return genders for marital_status == "single,nev marr" AND age > 70
with(issp.df, gender[marital_status == "single,nev marr" & age > 70])

# Data cleaning with ifelse -----------------------------------------------
# 
# A simple test using the ifelse() function
gender = c(0, 1)

ifelse(gender == 0, "Female", "Male")

# Clean up the gender variable
table(issp.df$gender)

# Convert from "NA, refused" to NA
issp.df$gender = 
  with(issp.df, ifelse(gender == "NA, refused",
                       NA, gender))
issp.df$gender[1:10]

# Missing value
is.na(issp.df$gender)

#which are missing?
which(is.na(issp.df$gender))

# Other variables
issp.df$marital_status = 
  with(issp.df, ifelse(marital_status == "NA, refused",
                       NA, marital_status))

issp.df$income = 
  with(issp.df, ifelse(income == "NAV; NAP No own income", 
                       NA, income))

issp.df$working_hours_per_week = 
  with(issp.df,
       ifelse(working_hours_per_week == "DK,cant say" |
                working_hours_per_week == "NAV;NAP", 
              NA, working_hours_per_week))


# Coerce to numeric vector from character vector
issp.df$working_hours_per_week = 
  as.numeric(issp.df$working_hours_per_week)

mean(issp.df$working_hours_per_week)


# ethnicity variable
issp.df$ethnicity =
  with(issp.df, 
       ifelse(ethnicity == "Chinese", "Asian", 
              ifelse(ethnicity == "European/Pakeha", "Euro", 
                     ifelse(ethnicity == "NAV", NA, 
                            ifelse(ethnicity == "New Zealand Maori", "Maori", 
                                   ifelse(ethnicity == "Other", "Other",
                                          "Pacific"))))))

table(issp.df$ethnicity)

