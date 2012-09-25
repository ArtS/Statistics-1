setwd('/Users/art/Movies/Study/Statistics/R')

data <- read.table('DAA.02.txt', header=T)
data <- split(data, data$cond)

aer <- subset(data$aer, select = -c(cond, pid))
des <- subset(data$des, select = -c(cond, pid))

cor(aer)
cor(des)

# 1. Which measures displayed the lowest correlation pre-training, suggesting the weakest reliability?
#
#    Verbal working memory, des condition = 0.92869647
#    Spatial working memory, des condition = 0.5401403
#[x] Spatial working memory, aer condition = 0.44859589
#    Verbal working memory, aer condition = 0.924055450


# Question 2
# Which measures displayed the highest correlation pre-training, suggesting the strongest reliability?
#
# Spatial working memory, aer condition = 0.448595886
# Verbal working memory, aer condition = 0.924055450
# Spatial working memory, des condition = 0.5401403
# [x] Verbal working memory, des condition. pre.wm.v1~pre.wm.v2 = 0.92869647


# Question 3
# In the aer condition, which individual measure displayed the highest correlation 
# between pre and post training?
# [x] wm.v2 = 0.93091709
# wm.s1 = 0.661405034
# wm.s2 = 0.68329378
# wm.v1 = 0.694754675


# Question 4
# In the des condition, which individual measure displayed the highest c
# orrelation between pre and post training?
# [x] wm.v2 = 0.92462271
# wm.s1 = 0.6277946
# wm.v1 = 0.74164780
# wm.s2 = 0.6336110

# Question 5
# Based on the correlations, the construct to be interpreted with most caution, from a measurement perspective,
# is:
# Verbal working memory, aer condition pre.v1~pre.v2: 0.924055450 / post.v1~v2: 0.54233335
# Spatial working memory, aer condition pre.s1~s2: 0.448595886 / post.s1~s2: 0.29732116
# Verbal working memory, des condition pre.v1~v2: 0.92869647 / post.v1~v2: 0.66629183
# Spatial working memory, des condition pre.s1~s2: 0.5401403 / post.s1~s2: 0.1634238