setwd("/Users/art/Movies/Study/Statistics/R")
library(psych)

d <- read.table("DAA.04.txt", header=T)

sp = subset(d, d$training == 'SP')
wm = subset(d, d$training == 'WM')

sp.out = describe(sp)
wm.out = describe(wm)

#What would be the degrees of freedom in a test measuring the training effect for the SP group?
#Give the corresponding absolute t-value, with two decimal places
t.test(sp$pre.uat, sp$post.uat, paired=T)

# Give the corresponding Cohen’s d value, with two decimal places.
sp.cohens.d = sp.out[4,3] / sp.out[4,4]
sp.cohens.d

# Suppose you now test the training effect for the WM group. What would be the degrees of freedom of the t-test?
t.test(wm$pre.uat, wm$post.uat, paired=T)

# Give the corresponding Cohen’s d value, with two decimal places.
wm.cohens.d = wm.out[4,3] / wm.out[4,4]
wm.cohens.d

# Compare SP and WM training, using group as the IV and gain score as the DV. What are the degrees of freedom of this t-test?
# Give the corresponding absolute t-value, with two decimal places.
t.test(d$gain ~ d$training, var.equal=T)

# Give the corresponding Cohen’s d value, with two decimal places.
# pooled.sd = (n1-1 / df * sd1) + (n2-1 / df * sd2 )
# dt.ct = (mean1 - mean2) / pooled.sd
# dt.ct
pooled.sd = ((20-1) / 38 * sp.out[4,4]) + ((20-1) / 38 * wm.out[4,4])
dt.ct = (sp.out[4,3] - wm.out[4,3]) / pooled.sd
dt.ct
