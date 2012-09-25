library(psych)

setwd('/Users/art/Movies/Study/Statistics/R')

impact <-read.table('STATS1.EX.02.txt', header=T)

par(cex = 2, lwd = 2, col.axis = 200, col.lab=200, col.man=200, col.sub = 200, fg = 200)

hist(impact$memory.verbal, xlab="Verbal mem", main="Histograms", col="red")
hist(impact$memory.visual, xlab="Visual mem", main="Histograms", col="red")
hist(impact$speed.vismotor, xlab="Visual-motor speed", main="Histograms", col="red")
hist(impact$speed.general, xlab="General speed", main="Histograms", col="red")
hist(impact$impulse.control, xlab="Impulse control", main="Histograms", col="red")

describe(impact)

plot(impact$memory.verbal ~ impact$memory.visual, main="Scatterplot", ylab="Verbal mem", xlab="Visual mem")
abline(lm(impact$memory.verbal ~ impact$memory.visual), col="blue")

cor.test(impact$memory.verbal, impact$memory.visual)

cor(impact$memory.verbal, impact$memory.visual)

cor(impact)