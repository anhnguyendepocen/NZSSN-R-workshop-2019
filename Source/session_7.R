# Load all the necessary R code from the last sessions
source("Source/session_4.R")

# 2-sample t-test -----------------------------------------------------

# Visualize with a boxplot
boxplot(total ~ gender, data = issp.df)

# Results
t.test(total ~ gender, data = issp.df)

# 1-way ANOVA ---------------------------------------------------------

# Visualize the data
boxplot(total ~ age_group, data = issp.df)

# Results
Total_age_aov = aov(total ~ age_group, data = issp.df)
summary(Total_age_aov)

# Group means
model.tables(Total_age_aov, "means")

# Post-hoc tests
post_hocs = TukeyHSD(Total_age_aov)
post_hocs

# Plot the intervals
plot(post_hocs)

# 2-way ANOVA with an interaction -------------------------------------

# Visualize the data
with(issp.df, interaction.plot(age_group, gender, total))

# Visualize the data
with(issp.df, interaction.plot(gender, age_group,  total))

# Fit the 2-way ANOVA model with an interaction term (use '*' for an 
# interaction)
total_2aov = aov(total ~ gender * age_group, data = issp.df)

# Summary ANOVA table
summary(total_2aov)

# Group means
model.tables(total_2aov, "means")

# Post-hoc multiple comparisons
post_hocs = TukeyHSD(total_2aov)
post_hocs

# Chi-square test of independence -----------------------------------------

# Frequency table
q5_table = with(issp.df, table(q5, age_group))
q5_table

# Conduct the Pearson's Chi-squared test
chisq.test(q5_table)

# Fisher's exact test -----------------------------------------------------
fisher.test(q5_table)
