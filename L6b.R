library(psych)

setwd('/Users/art/Movies/Study/Statistics/R')

impact.col <- read.table('STATS1.EX.03.COL.txt', header=T)

names(impact.col)

describe(impact.col)

cor(impact.col$memory.verbal.A, impact.col$memory.verbal.B)
cor(impact.col$memory.visual.A, impact.col$memory.visual.B)
cor(impact.col$speed.vismotor.A, impact.col$speed.vismotor.B)
cor(impact.col$speed.general.A, impact.col$speed.general.B)
cor(impact.col$impulse.control.A, impact.col$impulse.control.B)