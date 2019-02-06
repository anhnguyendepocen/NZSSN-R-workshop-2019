# Load all the R code from the last session
source("Source/session_2.R")

# factor ------------------------------------------
issp.df$gender = factor(issp.df$gender)
issp.df$ethnicity = factor(issp.df$ethnicity)
issp.df$marital_status = factor(issp.df$marital_status)
issp.df$income = factor(issp.df$income)

str(issp.df)

# Check the levels of factor on education of issp.df

levels(factor(issp.df$education))

# Tabulate response on education, notice the order
table(issp.df$education)

# Encode a vector as a factor
issp.df$education = factor(issp.df$education, 
                    levels = c("Primary compl", 
                               "Incpl secondary", 
                               "Secondary compl", 
                               "Incpl university,other", 
                               "University degree"))

# Re-tabulate response on education, notice the order
table(issp.df$education )


# Binning age variable into age_groups with nested ifelse functions
age_group = with(issp.df, 
                 ifelse(age <= 35, "Under 35", 
                        ifelse(age <= "60", "36 to 60", 
                               "Over 61")))

# Convert age_group to a factor with levels in ascending order.
age_group  = 
  factor(age_group, 
         levels = c("Under 35", "36 to 60", "Over 61"))

# Create a new variable age_group in issp.df
issp.df$age_group  = age_group




# Questionnaire -----------------------------------------------------------

likert.df <- read.csv("Data/issp questionnaire.csv", stringsAsFactors = FALSE)
str(likert.df)


# Ensure we don't have any duplicated ID's (make sure they are unique).
anyDuplicated(issp.df$id)
anyDuplicated(likert.df$id)

# dplyr R package -----------------------------------------------------
# If dplyr is not installed on your computer, uncomment the line below:
# install.packages("dplyr")
# 
# Load the dplyr R package
library(dplyr)

# Example data sets -------------------------------------------------------

# We will use these 2 simple 'data sets' to exemplify the four common
# joins:
x.df = data.frame(id = c(1, 2, 3),
                  x_val = c("x1", "x2", "x3"))

y.df = data.frame(id = c(1, 2, 4),
                  y_val = c("y1", "y2", "y4"))

x.df
y.df

# Left join -----------------------------------------------------------
# 
# Keep all rows in the left data set (x.df)

left_join(x.df, y.df, by = "id")

# Right join ----------------------------------------------------------
# 
# # Keep all rows in the right data set (y.df)

right_join(x.df, y.df, by = "id")

# Full join -----------------------------------------------------------
# 
# Keep all rows in both data sets

full_join(x.df, y.df, by = "id")

# Inner join ----------------------------------------------------------
# 
# Keep only rows with matching IDs in both data sets

inner_join(x.df, y.df, by = "id")

# Join issp data set ---------------------------------------
issp.df = full_join(issp.df, likert.df, by = "id")
str(issp.df)
head(issp.df)

# Sum the likert scales from q1 -- q4 to a new variable call `total`` 
total = with(issp.df, q1 + q2 + q3 + q4)

issp.df$total = total


# Finalise the dataset 

# `na.omit()` returns the object with listwise deletion of missing values.
issp.df = na.omit(issp.df)

str(issp.df)


