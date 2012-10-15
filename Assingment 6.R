setwd("/Users/art/Movies/Study/Statistics/R")
library(psych)
library(car)
source(file="eta_squared.R")

d <- read.table("DAA.05.txt", header=T)

# SR - spatial reasoning, DV
# 
aov.d = aov(d$SR ~ (d$time*d$condition) + Error(factor(d$subject)/d$condition))
summary(aov.d)
#aov.e1sr = aov(e1sr$recall ~ (e1sr$task*e1sr$stim) + Error(factor(e1sr$subject)/e1sr$stim))
#summary(aov.e1sr)

# Levene's test
leveneTest(d$SR, d$cond, center="mean")
#leveneTest(e1sr$recall, e1sr$task, center="mean")

# Simple effect for WM
aov.d_wm = aov(d$SR[d$cond=="WM"] ~ d$time[d$cond=="WM"] +Error(factor(d$subject[d$cond=="WM"])/d$time[d$cond=="WM"]))
#aov.e1srw = aov(e1sr$recall[e1sr$task=="W"] ~ e1sr$stim[e1sr$task=="W"] +Error(factor(e1sr$subject[e1sr$task=="W"])/e1sr$stim[e1sr$task=="W"]))
summary(aov.d_wm)

# Simple effect for PM
aov.d_pe = aov(d$SR[d$cond=="PE"] ~ d$time[d$cond=="PE"] +Error(factor(d$subject[d$cond=="PE"])/d$time[d$cond=="PE"]))
summary(aov.d_pe)

# Simple effect for DS
aov.d_ds = aov(d$SR[d$cond=="DS"] ~ d$time[d$cond=="DS"] +Error(factor(d$subject[d$cond=="DS"])/d$time[d$cond=="DS"]))
summary(aov.d_ds)
