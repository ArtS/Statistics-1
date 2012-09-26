library(psych)

setwd('/Users/art/Movies/Study/Statistics/R')

d <- read.table('STATS1.EX.04.txt', header=T)

layout(matrix(c(1, 2, 3, 4), 2, 2, byrow=TRUE))

plot(d$endurance ~ d$age, main="Endurance vs Age", ylab="Endurance", xlab="Age")
abline(lm(d$endurance ~ d$age), col="blue")

plot(d$endurance ~ d$activeyears, main="Endurance vs Active years", ylab="Endurance", xlab="Active years")
abline(lm(d$endurance ~ d$activeyears), col="blue")

# 1.1 Simple regression
# using age to predict endurance
model1 = lm(d$endurance~d$age)
summary(model1)

# 1.2 Simple regression: using active years of exercise to predict endurance
model2 = lm(d$endurance ~ d$activeyears)
summary(model2)

# 2. Multiple regression, age+active years
model3 = lm(d$endurance ~ d$age + d$activeyears)
summary(model3)