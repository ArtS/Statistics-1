#
# L15: T-tests and ANOVA
#

setwd("/Users/art/Movies/Study/Statistics/R")
library(psych)

d <- read.table("STATS1.EX.07.txt", header=T)

# Create data subsets
d.c = subset(d, d$train == "0") # Control group
d.t = subset(d, d$train == "1") # Training groups (any of 4 conditions)

# Store some variables
d.c.out = describe(d.c)
d.c.out

d.t.out = describe(d.t)
d.t.out

# Dependent t-test
t.test(d.c$pre, d.c$post, paired=T)
#
# Output:
#
# Paired t-test
#
# data:  d.c$pre and d.c$post 
# t = -9.0089, df = 39, p-value = 4.511e-11
# alternative hypothesis: true difference in means is not equal to 0 
# 95 percent confidence interval:
#   -2.41843 -1.53157 
# sample estimates:
#   mean of the differences 
# -1.975 
#  #####
#  ^------- here we can see a difference in made up data, that demonstrates so called "training effect"
#           or people gettign better at the IQ test with practice (or any other kind of test)

t.test(d.t$pre, d.t$post, paired=T)
#
# Output:
# 
# mean of the differences 
# -3.4875
#  ######
#  ^------ this is bigger than the control group, but we need to do an independent t-test to compare that
#          to the gain for control group

# Cohen's d for dependent test
dt.c = d.c.out[4,3] / d.c.out[4,4]
dt.c
dt.t = d.t.out[4,3] / d.t.out[4,4]
dt.t

# Independent t-test
# syntax is: t.test(Dep Var ~ Indep Var, var.equal=T), var.equal=T to set that variances are equivalent
t.test(d$gain ~ d$train, var.equal=T)

# Cohen's d for independent t-test, comparing control and training
pooled.sd = (79 / 118 * d.t.out[4,4]) + (39/118 * d.c.out[4,4] )
dt.ct = (d.t.out[4,3] - d.c.out[4,3]) / pooled.sd
dt.ct
# [1] 0.7963634 <- suggests that difference is significant

# One-way ANOVA
# aov(DV ~ IV)
aov.model = aov(d.t$gain ~ d.t$cond)
aov.table = summary(aov.model)
aov.table
# Output:
#             Df Sum Sq Mean Sq F value   Pr(>F)    
#d.t$cond     3  213.0   71.01   35.29 2.16e-14 ***
#Residuals   76  152.9    2.01 
# Reseduals is error term for S/A, subjects within groups.

# Effect size for ANOVA
ss = aov.table[[1]]$"Sum Sq"
eta.sq = ss[1] / (ss[1] + ss[2])
eta.sq
# Output:
#[1] 0.5820896 <- 58% is a significant result, but we don't know where the difference is, maybe it's just
#difference between two extreme groups, like t08 and t19.
#


# Post-hoc test
# Does every parallised comparison
TukeyHSD(aov.model)

# p adj 

#Levene's test
library(car)
leveneTest(d.t$gain, d.t$cond, center="mean")