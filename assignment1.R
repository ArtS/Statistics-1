library(psych)

setwd("~/Movies/Study/Statistics")

data <- read.table("DAA.01.txt", header=T)
data <- split(data, data$cond)

layout(matrix(c(1,2, 3, 4, 5, 6, 7, 8), 2, 4, byrow=TRUE))

hist(data$des$pre.wm.v, main="des, verbal, pre")
hist(data$des$post.wm.v, main="des, verbal, post")
hist(data$des$pre.wm.s, main="des, spatial, pre")
hist(data$des$post.wm.s, main="des, spatial, post")

hist(data$aer$pre.wm.v, main="aer, verbal, pre")
hist(data$aer$post.wm.v, main="aer, verbal, post")
hist(data$aer$pre.wm.s, main="aer, spatial, pre")
hist(data$aer$post.wm.s, main="aer, spatial, post")

describe(data)

#          var   n  mean    sd median trimmed   mad min max range  skew kurtosis   se

#des
#pre.wm.s    2 100 18.07  3.13   18.0   18.06  2.97  10  26    16 -0.08     0.01 0.31
#post.wm.s   3 100 23.06  4.14   23.0   23.10  4.45  11  33    22 -0.06     0.08 0.41

#aer
#pre.wm.s    2 100 15.81  6.03     17   16.64  4.45   1  25    24 -1.26     0.66 0.60
#post.wm.s   3 100 23.30  5.64     23   23.66  5.93  11  37    26 -0.42    -0.20 0.56


