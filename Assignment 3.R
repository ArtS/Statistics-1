library(psych)

setwd('/Users/art/Movies/Study/Statistics/R')

d <- read.table('DAA.03.txt', header=T)

layout(matrix(c(1, 2, 3, 4), 2, 2, byrow=TRUE))

# Correlation between age and endurance
cor(d$age, d$endurance) 

# Unstandardized regression coefficient for age, predicting endurance
summary(lm(d$endurance ~ d$age))

#Standardized regression coefficient for age, predicting endurance
summary(lm(scale(d$endurance) ~ scale(d$age))) 

# Unstandardized regression coefficient for age, predicting endurance (while also using activeyears to predict endurance)
summary(lm(d$endurance ~ d$age + d$activeyears)) 

# Standardized regression coefficient for age, predicting endurance (while also using activeyears to predict endurance)
summary(lm(scale(d$endurance) ~ scale(d$age) + scale(d$activeyears))) 

# Correlation between activeyears and endurance
cor(d$activeyears, d$endurance)

# Unstandardized regression coefficient for activeyears, predicting endurance
summary(lm(d$endurance ~ d$activeyears))

# Standardized regression coefficient for activeyears, predicting endurance
summary(lm(scale(d$endurance) ~ scale(d$activeyears))) 

# Unstandardized regression coefficient for activeyears, predicting endurance (while also using age to predict endurance)
summary(lm(d$endurance ~ d$activeyears + d$age)) 

# Standardized regression coefficient for activeyears, predicting endurance (while also using age to predict endurance)
summary(lm(scale(d$endurance) ~ scale(d$activeyears) + scale(d$age))) 
