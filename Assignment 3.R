library(psych)

setwd('/Users/art/Movies/Study/Statistics/R')

d <- read.table('DAA.03.txt', header=T)

layout(matrix(c(1, 2, 3, 4), 2, 2, byrow=TRUE))

# Correlation between age and endurance
cor(d$age, d$endurance) # [1] -0.1258528 => -0.13

# Unstandardized regression coefficient for age, predicting endurance
summary(lm(d$endurance ~ d$age)) # -0.13472 => -0.13

#Standardized regression coefficient for age, predicting endurance
summary(lm(scale(d$endurance) ~ scale(d$age))) # -1.259e-01 => -0.1259 => -0.13

# Unstandardized regression coefficient for age, predicting endurance (while also using activeyears to predict endurance)
summary(lm(d$endurance ~ d$age + d$activeyears)) # -0.2571 => -0.26

# Standardized regression coefficient for age, predicting endurance (while also using activeyears to predict endurance)
summary(lm(scale(d$endurance) ~ scale(d$age) + scale(d$activeyears))) # -2.402e-01 => -0.2402 => -0.24

# Correlation between activeyears and endurance
cor(d$activeyears, d$endurance) # 0.3365433 => 0.34

# Unstandardized regression coefficient for activeyears, predicting endurance
summary(lm(d$endurance ~ d$activeyears)) #  0.7625 =>  0.76

# Standardized regression coefficient for activeyears, predicting endurance
summary(lm(scale(d$endurance) ~ scale(d$activeyears))) #  3.365e-01 => 0.3365 => 0.34

# Unstandardized regression coefficient for activeyears, predicting endurance (while also using age to predict endurance)
summary(lm(d$endurance ~ d$activeyears + d$age)) # 0.9163 => 0.92

# Standardized regression coefficient for activeyears, predicting endurance (while also using age to predict endurance)
summary(lm(scale(d$endurance) ~ scale(d$activeyears) + scale(d$age))) # 4.044e-01 => 0.40
