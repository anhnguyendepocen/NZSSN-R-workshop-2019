# Load all the R code from the last sessions
source("Source/session_4.R")

# Histograms --------------------------------------------------------------

# Create a histogram of the total variable
hist(issp.df$total)

# Change the number of breaks
hist(issp.df$total, breaks = 20)

# Change the label of the x axis
hist(issp.df$total, 
     breaks = 20, xlab = "total score")

# Change the main title
hist(issp.df$total, 
     breaks = 20, xlab = "total score",
     main = "Histogram of total score")

# Boxplots ----------------------------------------------------------------

# Create a boxplot. Note the continuous variable (y) is on the left, and the 
# grouping variable is on the right hand side of the '~':
# 
# boxplot(y ~ group):
boxplot(total ~ gender, data = issp.df) # y ~ group

# Include labels
boxplot(total ~ gender, data = issp.df, 
        xlab = "Gender", ylab = "Total score",
        main = "Total score versus Gender")

# Outliers
# 
# Subset the data frame to only include the rows where total is greater 
# than 16 and smaller than 6:
subset(issp.df, total > 16)

subset(issp.df, total < 6)

# Remove outlier in boxplot
boxplot(total ~ gender, data = issp.df, 
        xlab = "Gender", ylab = "Total score",
        main = "Total score versus Gender",
        outline = FALSE)

# Rotate text on y axis
boxplot(total ~ gender, data = issp.df, 
        xlab = "Gender", ylab = "Total score",
        main = "Total score versus Gender",
        outline = FALSE, las = 1)

# Bar plots ---------------------------------------------------------------

# 1-way frequency table ---------------------------------------------------

# First create a frequency table:
age_table = with(issp.df, table(age_group))
age_table

# Then plot it using 'barplot':
barplot(age_table)

# Include a main title, y axis label and rotate text
barplot(age_table, main = "Age Group",
        ylab = "Frequency", las = 1)

# 1-way table of proportions ----------------------------------------------

# First create a table of proportions:
age_prop_table = with(issp.df, prop.table(table(age_group)))
age_prop_table

# Then plot it using 'barplot':
barplot(age_prop_table, main = "Age Group",
        ylab = "Proportion", las = 1)

# Plot the percentages instead:
barplot(age_prop_table * 100, main = "Climate classifications",
        ylab = "Percent", las = 1)

# 2-way frequency table ---------------------------------------------------

# First create a 2-way frequency table:
age_table_2 = with(issp.df, table(q5, age_group))
age_table_2

# Then plot it using 'barplot':
barplot(age_table_2)

# Use 'beside = TRUE' for a side-by-side bar plot:
barplot(age_table_2, beside = TRUE)

# Include a legend:
barplot(age_table_2, beside = TRUE, legend.text = TRUE)

# Include extra arguments:
barplot(age_table_2, beside = TRUE, legend.text = TRUE,
        xlab = "Age group",
        las = 1, ylab = "Frequency")

# 2-way table of proportions ----------------------------------------------

# First create a 2-way table of proportions
age_prop_table_2 = with(issp.df, 
                        prop.table(table(q5, age_group), margin = 2))
age_prop_table_2

# Then plot:
barplot(age_prop_table_2, beside = TRUE, legend.text = TRUE)

# Extend the limits of the y axis from 0 to 1:
barplot(age_prop_table_2, beside = TRUE, legend.text = TRUE, 
        ylim = c(0, 1))

# Finalize bar plot:
barplot(age_prop_table_2 * 100, beside = TRUE, legend.text = TRUE,
        xlab = "Age group", ylab = "Percent", ylim = c(0, 100), las = 1)

# Scatter plots -----------------------------------------------------------

# Plot a scatter plot between total nitrogen and river water clarity:
with(issp.df, plot(age, total))

# Plot the axes on the log scale:
with(issp.df, plot(age, total, log = "xy"))

# Estimate the a and b parameters of the trend line using 'lm'.
trend_line = lm(log10(total) ~ log10(age), data = issp.df)
trend_line
# Note that you have just fitted a simple linear regression! :o

# Add the trend line to the scatter plot
abline(trend_line)

# Note it is called "a" "b" "line" as it requires the estimates of a (intercept) 
# and b (slope).

# Final version of the scatter plot with a trend line:
with(issp.df, plot(age, total, log = "xy", las = 1,
                   main = "Total Score vs Age in NZ rivers",
                   ylab = "Total Score", xlab = "Age"))
abline(trend_line)

