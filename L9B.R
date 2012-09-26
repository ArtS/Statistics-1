library(psych)

setwd('/Users/art/Movies/Study/Statistics/R')

d <- read.table('STATS1.EX.04.txt', header=T)

layout(matrix(c(1, 2, 3, 4), 2, 2, byrow=TRUE))

plot(d$endurance ~ d$age, main="Endurance vs Age", xlab="Age", ylab="Endurance")
abline(lm(d$endurance ~ d$age), col="blue")

plot(d$endurance ~ d$activeyears, main="Endurance vs Active years", xlab="Active years", ylab="Endurance")
abline(lm(d$endurance ~ d$activeyears), col="blue")

model1 = lm(d$endurance ~ d$age)
summary(model1)

model2 = lm(d$endurance ~ d$activeyears)
summary(model2)

model3 = lm(d$endurance ~ d$age + d$activeyears)
summary(model3)

# Regression analysis, standardised
model1.z = lm(scale(d$endurance) ~ scale(d$age))
summary(model1.z)

model2.z = lm(scale(d$endurance) ~ scale(d$activeyears))
summary(model2.z)

model3.z = lm(scale(d$endurance) ~ scale(d$age) + scale(d$activeyears))
summary(model3.z)