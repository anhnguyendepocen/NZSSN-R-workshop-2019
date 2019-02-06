
source("Source/ex_2.R")
library(dplyr)

sports.df$gender = factor(sports.df$gender)
sports.df$partner = factor(sports.df$partner)
sports.df$ethnicity = factor(sports.df$ethnicity)

str(sports.df)


sports.df$income = factor(sports.df$income, 
                          levels = c("< 5 000$", "10 000$-15 000$", "15 000$-20 000$",
                                     "20 000$-25 000$", "25 000$-30 000$", "30 000$-40 000$",
                                     "40 000$-50 000$", "50 000$-70 000$", "70 000$-100 000$",
                                     "> 100 000$"))


age_group = 
  with(sports.df, ifelse(age <= 40, "Under 40",
                         ifelse(age > 40 &
                                  age <= 60, "41 to 60", "Over 61")))

age_group =
  factor(age_group, levels = c("Under 40", "41 to 60", "Over 61"))

sports.df$age_group = age_group


sports.df = full_join(sports.df, mean.df, by = "id")


sports.df$average = 
  with(sports.df, (q1a + q1b + q1c + q1d + q1e)/5)


sports.df = na.omit(sports.df)



