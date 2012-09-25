library(psych)

ratings <- read.table("/Users/art/Movies/Study/Statistics/stats1_ex01.txt", header=T)

class(ratings)
names(ratings)
#hist(RedTruck)

# c() - concatenate numbers
# matrix(, 2, 2) 2x2 matrix
#
layout(matrix(c(1, 2, 3, 4), 2, 2, byrow=TRUE))
hist(ratings$WoopWoop, xlab="Rating")
hist(ratings$RedTruck, xlab="Rating")
hist(ratings$HobNob, xlab="Rating")
hist(ratings$FourPlay, xlab="Rating", )

describe(ratings)