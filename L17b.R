#
# Mixed factorial ANOVA
#

# Mixed factorial design, 3 x 2,
# Between groups IV: memory task: (words, sentences, stories)
# Within group IV: phonological similarity (similar, dissimilar)
# DV - percentage of words recalled

# Main effect of memory task?

# Main effect of similarity?

# Interaction?

setwd("/Users/art/Movies/Study/Statistics/R")
library(psych)
library(car)
source(file="eta_squared.R")

e1sr <- read.table("STATS1.EX.08.txt", header=T)

stim = factor(e1sr$stim,levels=c("S","D"))  #reverse levels (for graphs like the article)

aov.e1sr = aov(e1sr$recall ~ (e1sr$task*e1sr$stim) + Error(factor(e1sr$subject)/e1sr$stim))
summary(aov.e1sr)
#Error: factor(e1sr$subject)
#           Df Sum Sq Mean Sq F value   Pr(>F)    
#e1sr$task  2 0.7384  0.3692   10.54 0.000124 ***
#                              ^^^^^     ^^^^
#                              F-val.    p-val.      
#Residuals 58 2.0309  0.0350
#---
#  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1 

#Error: factor(e1sr$subject):e1sr$stim
#                   Df Sum Sq Mean Sq F value   Pr(>F)    
#e1sr$stim            1 0.0161 0.01607   1.956    0.167    
#e1sr$task:e1sr$stim  2 0.3716 0.18582  22.624 5.46e-08 ***
#                                       ^^^^^^
#                                       task by stimuli interaction
#                                       F-value, cross-over interaction,
#                                       very strong
#Residuals           58 0.4764 0.00821                     
#---
#  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1 
#
# So for between-groups effect F value is 10.54 with low p-value of 0.000124


eta.2(aov.e1sr, ret.labels=TRUE)
#
#eta.2
#e1sr$task           0.26663954
#e1sr$stim           0.03262359
#e1sr$task:e1sr$stim 0.43824551
#
# this is percentage of variance explained in the outcome by each of the independent variable
# again, strongest effect is the intraction, e1sr$task:e1sr$stim


# Levene's test
leveneTest(e1sr$recall, e1sr$task, center="mean")
# Levene's Test for Homogeneity of Variance (center = "mean")
#        Df F value  Pr(>F)  
#group   2  3.4274 0.03571 *
#                  ^^^^^^^^
#                  violation of homogeneity assumption
#                  Why? There's less variance in words task than in other two tasks
#                  hence more variability in how people perform in those span tasks.
#
#                  So we are going to separate the words task from the others.
#-------------------------------
#      119                  
#---
#  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1 

#
# Simple effects analysis for simple span (i.e., word span)
#
aov.e1srw = aov(e1sr$recall[e1sr$task=="W"] ~ e1sr$stim[e1sr$task=="W"] +Error(factor(e1sr$subject[e1sr$task=="W"])/e1sr$stim[e1sr$task=="W"]))
summary(aov.e1srw)
#
#Error: factor(e1sr$subject[e1sr$task == "W"])
#          Df Sum Sq Mean Sq F value Pr(>F)
#Residuals 19 0.3404 0.01792               
#
#Error: factor(e1sr$subject[e1sr$task == "W"]):e1sr$stim[e1sr$task == "W"]
#                            Df Sum Sq Mean Sq F value   Pr(>F)    
#e1sr$stim[e1sr$task == "W"]  1 0.3276  0.3276    78.8 3.46e-08 ***
#                                                 ^^^^^
#                                                 huge effect, phonological similarity
#                                                 confirms that it's easier to recall phonologically similar words
#  Residuals                  19 0.0790  0.0042                     
#---
#  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1 
#
eta.2(aov.e1srw, ret.labels=TRUE)
# e1sr$stim[e1sr$task == "W"] 0.8057304
#                             ^^^^^^^^^
#                             same here, a lot of variance is explained

#
# Now let's have a look at everything else but "words" experiment
# were we able to enhance recall by forming sentences into a story?
#
# Simple effects analysis for complex span (this is a 2x2 mixed factorial)
aov.e1srnw = aov(e1sr$recall[e1sr$task!="W"] ~ e1sr$task[e1sr$task!="W"]*e1sr$stim[e1sr$task!="W"] + 
  Error(factor(e1sr$subject[e1sr$task!="W"]) / e1sr$stim[e1sr$task!="W"]))
summary(aov.e1srnw) 
eta.2(aov.e1srnw, ret.labels=TRUE)
