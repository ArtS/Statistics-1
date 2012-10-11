#
# Lecture 12A: Mediation
#
# Predicting happines from extraversion, diversity of life experiences and socio-economic status
#
# Three regression analysis:
# - Outcome = f(predictor)           lm(Y ~ X)
# - Predictor = f(Mediator)          lm(X ~ Y)
# - Outcome = f(predictor, mediator) lm (Y ~ X + M)
#
# Y - Happiness
# X - Extraversion
# M - Diversity of life experience
library('psych')
library(multilevel)
setwd('/Users/art/Movies/Study/Statistics/R')

d <- read.table("STATS1.EX.05.txt", header=T)

layout(matrix(c(1, 2, 3, 4), 2, 2, byrow=TRUE))

describe(d)
#hist(d$happy)
#hist(d$extra)
#hist(d$diverse)

# Plot scatterplots and test linear and homoscedasticity assumptions
plot(d$happy ~ d$extra)
abline(lm(d$happy ~ d$extra))

plot(d$diverse ~ d$extra)
abline(lm(d$diverse ~ d$extra), col="blue")

plot(d$happy ~ d$diverse)
abline(lm(d$happy ~ d$diverse))

#conduct three regression analyses

m1 = lm(d$happy ~ d$extra) #direct effect
summary(m1)
m2 = lm(d$diverse ~ d$extra) # proposed mediator
summary(m2)
m3 = lm(d$happy ~ d$extra + d$diverse)
summary(m3)

# Sobel z test
sobel(d$extra, d$diverse, d$happy)