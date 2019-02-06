# Load all the necessary R code from the last sessions
source("Source/session_3.R")

library(tidyverse)

# Load the ggplot2 package
library(ggplot2)

# Scatter plots -----------------------------------------------------------
# 
# We are going to build up a scatter plot one layer at a time:

# Initialize a blank canvas
ggplot()

# Define the coordinate system
ggplot(data = issp.df,
       mapping = aes(x = log10(age), y = log10(total)))

# Add the points to the plot
ggplot(data = issp.df,
       mapping = aes(x = log10(age), y = log10(total))) +
  geom_point()

# Add a loess smooth
ggplot(data = issp.df,
       mapping = aes(x = log10(age), y = log10(total))) +
  geom_point() +
  geom_smooth()

# Add a trend line (instead of a loess smooth)
ggplot(data = issp.df,
       mapping = aes(x = log10(age), y = log10(total))) +
  geom_point() +
  geom_smooth(method = "lm")

# Group the data using colour
ggplot(data = issp.df,
       mapping = aes(x = log10(age), 
                     y = log10(total),
                     color = gender)) +
  geom_point() +
  geom_smooth(method = "lm")

# Change the labels
ggplot(data = issp.df,
       mapping = aes(x = log10(age), 
                     y = log10(total),
                     color = gender)) +
  geom_point() +
  geom_smooth(method = "lm") +
  labs(x = "Log age",
       y = "Log total score",
       colour = "Gender",
       title = "Log total score vs log age")

# Change the text size
ggplot(data = issp.df,
       mapping = aes(x = log10(age), 
                     y = log10(total),
                     color = gender)) +
  geom_point() +
  geom_smooth(method = "lm") +
  labs(x = "Log age",
       y = "Log total score",
       colour = "Gender",
       title = "Log total score vs log age") +
  theme(text = element_text(size = 14))

# Boxplots ----------------------------------------------------------------

# Simple boxplot
ggplot(data = issp.df,
       mapping = aes(x = gender, y = total)) +
  geom_boxplot()


# Include meaningful labels
ggplot(data = issp.df,
       mapping = aes(x = gender, y = total)) +
  geom_boxplot() +
  labs(title = "total score for Female and Male",
       x = "Gender",
       y = "total score")

# Side-by-side boxplots
ggplot(data = issp.df,
       mapping = aes(x = gender, y = total, colour = age_group)) +
  geom_boxplot() +
  labs(title = "total score for Female and Male",
       x = "Gender",
       y = "total score",
       colour = "Age group") +
  theme(text = element_text(size = 14))

# Histograms --------------------------------------------------------------

# Histogram with labels and larger text
ggplot(issp.df, aes(x = age)) +
  geom_histogram(binwidth = 5) +
  labs(x = "Age") +
  theme(text = element_text(size = 14))

# Black and white theme
ggplot(issp.df, aes(x = age)) +
  geom_histogram(binwidth = 5) +
  labs(x = "Age") +
  theme_bw() +
  theme(text = element_text(size = 14))

# Bar plots for 1 variable ------------------------------------------------

# Simple bar plot for 1 variable (display a 1-way frequency table)
ggplot(issp.df,
       aes(x = age_group)) +
  geom_bar()

# Bar plot with labels, larger text and a black and white theme
ggplot(issp.df,
       aes(x = age_group)) +
  geom_bar() + 
  labs(x = "Age group",
       y = "Frequency") +
  theme_bw() +
  theme(text = element_text(size = 14))

# Add percentages on the y axis (display a 1-way table of proportions)
ggplot(issp.df,
       aes(x = age_group, y = ..prop.., group = 1)) +
  geom_bar() + 
  labs(x = "Age group",
       y = "Proportion") +
  theme_bw() +
  theme(text = element_text(size = 14)) +
  scale_y_continuous(labels = scales::percent)

# Bar plot for 2 variables ------------------------------------------------

# Simple (stacked) bar plot displaying a 2-way frequency table
ggplot(issp.df,
       aes(x = age_group, fill = ethnicity)) +
  geom_bar()

# Side-by-side bar plot
ggplot(issp.df,
       aes(x = age_group, fill = ethnicity)) +
  geom_bar(position = "dodge")

# ggplot2 with dplyr
issp.df %>% 
  count(age_group, ethnicity) %>%
  complete(age_group, ethnicity)  %>% 
  ggplot(aes(x = age_group, y= n, fill = ethnicity)) +
  geom_col(position = "dodge") 

# Transparency (the bars are 70% opaque)
issp.df %>% 
  count(age_group, ethnicity) %>%
  complete(age_group, ethnicity)  %>% 
  ggplot(aes(x = age_group, y= n, fill = ethnicity)) +
  geom_col(position = "dodge", alpha = .7) +
  labs(title = "Ethnicity comparison",
       x = "Gender",
       y = "Frequency") +
  theme(text = element_text(size = 14)) 
