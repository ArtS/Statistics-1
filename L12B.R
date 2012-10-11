# Lecture 12B: Moderation in R
library(psych)
library(multilevel)

setwd("/Users/art/Movies/Study/Statistics/R")
d <- read.table("STATS1.EX.06.txt", header=T)

# Two regression analyses:
# Hapiness = Extraversion + SES, or lm(Y ~ X+Z)
# Happines = Extraversion + SES + Product, or lm(Y ~ X+Z+(X*Z))
#
# Moderator is Socio-economic status
#

# All the tests for assumptions for normal distribution, linear relationship and no homoscedasticity
# are left out. We should do those normally

# First model: no moderator
no.mod.model = lm(d$happy ~ d$extra + d$ses)
summary(no.mod.model)

# Second model: with moderator
mod.model = lm(d$happy ~ d$extra + d$ses + d$mod)
summary(mod.model)

# Compare models
anova(no.mod.model, mod.model)
#Analysis of Variance Table

#Model 1: d$happy ~ d$extra + d$ses
#Model 2: d$happy ~ d$extra + d$ses + d$mod
#Res.Df    RSS Df Sum of Sq      F   Pr(>F)   
#1    373 346.15                                
#2    372 336.59  1    9.5582 10.564 0.001258 ** <- #2 accounts for more variance than #1 model
