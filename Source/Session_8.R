# Load all the necessary R code from the last sessions
source("Source/session_3.R")

# Simple linear regression ------------------------------------------------

# Visualize the relationship
plot(total ~ age, data = issp.df)


# Visualize with ggplot. 
# Note we can remove the SE region with se = FALSE, and change the colour of
# the regression/trend line to "black":
ggplot(issp.df, aes(age, total)) +
  geom_point() +
  geom_smooth(method = "lm", colour = "black", se = FALSE) +
  theme_bw() +
  theme(text = element_text(size = 14))

# Fit the regression model
my_slr = lm(total ~ age, data = issp.df)

# Print the summary for the coefficients and p-values
summary(my_slr)

# Logistic regression -----------------------------------------------------

# Response variable in a logistic regression is binary. 
# We need a variable of TRUE's and FALSE's:
issp.df$q5 == "be obedient"

# Assign it to a variable called 'be_obedient' in the data set
issp.df$be_obedient = issp.df$q5 == "be obedient"

# Fit the simple logistic regression model
my_slgr = glm(be_obedient ~ age, data = issp.df, family = binomial)

# Print the summary for the coefficients and p-values
summary(my_slgr)

# Logit scale, usually referred to as the linear predictor scale
lp <- predict(my_slgr, data.frame(age = 50))
lp

exp(lp)

#Probability scale
predict(my_slgr, data.frame(age = 50), type = "response")
