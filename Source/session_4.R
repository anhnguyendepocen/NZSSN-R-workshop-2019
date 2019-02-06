# Load all the R code from the last session
source("Source/session_3.R")

# Pipe operator --- An example --------------------------------------------
# 
# Remember that the RStudio shortcut for the pipe operator is Ctrl-Shift-M.

#' “With my issp.df dataset,
#' I want to group by the gender variable and
#' summarize age 
#' by calculating its mean and standard deviation.”

issp.df %>% 
  group_by(gender) %>% 
  summarize(Mean = mean(age),
            SD = sd(total)) 


# Summary tables ----------------------------------------------------------
# 
# Measure of centre summaries:

#' “With my issp.df dataset,
#'  I want to group by the  age.group (Under 35, 36 to 60 and Over 61) and
#'  summarize Total score 
#'  by calculating its mean and median.”

issp.df %>% 
  group_by(age_group) %>% 
  summarise(Avg = mean(total),
            Median = median(total))

# Measure of variability summaries:

#' “With my issp.df dataset, 
#' I want to group by ethnicity (Asian, Euro, Maori, Other and Pacific) and 
#' summarize the variability of Total score”

issp.df %>% 
  group_by(ethnicity) %>% 
  summarise(Freq = n(),
            Var = var(total),
            SD = sd(total),
            Min = min(total),
            Max = max(total),
            Range = Max - Min,
            IQR = IQR(total))

# Grouping by more than 1 variable:

#' “With my issp.df dataset, 
#' I want to group by gender and age.group and
#' summarise working_hours_per_week by calculating the mean.”

issp.df %>% 
  group_by(gender, age_group) %>% 
  summarise(Avg = mean(working_hours_per_week))


# Frequency tables --------------------------------------------------------
# 
# Frequency tables in base **R** (no package needed):

# 1-way frequency table of the gender
with(issp.df, table(gender))


# 2-way frequency table of the gender for each ethnicity category
with(issp.df, table(ethnicity, gender))

# Table of proportions:

# 1-way table of proportions
with(issp.df, prop.table(table(gender)))

# 2-way table of proportions (no 'margin')
with(issp.df, prop.table(table(ethnicity, gender)))

# Row-wise 2-way table of proportions (margin = 1)
with(issp.df, prop.table(table(ethnicity, gender), margin = 1))

# Column-wise 2-way table of proportions (margin = 2)
with(issp.df, prop.table(table(ethnicity, gender), margin = 2))

# 2-way frequency table with the pipe operator:

issp.df %>% 
  group_by(gender, ethnicity) %>% 
  summarize(Freq = n())

# Larger summary tables ---------------------------------------------------
# 
# All the previous examples have been either:
# 
#     + multiple summaries with a single grouping variable, or
#     + one summary with up to 2 grouping variables.

# Summary table with 3 grouping variables and 4 summaries:

issp.df%>% 
  group_by(age_group, gender, income) %>%
  summarize(Freq = n(),
            avg_age = mean(age),
            avg_Total = mean(total)) 

# Arrange (sort) the table by average age:
issp.df%>% 
  group_by(age_group, gender, income) %>%
  summarize(Freq = n(),
            avg_age = mean(age),
            avg_Total = mean(total)) %>% 
  arrange(avg_age)

# Note that we could have used arrange(desc(avg_age)) for decreasing values.


