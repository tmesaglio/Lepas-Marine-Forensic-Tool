#load data
community <- read.csv(file = "Dataset 1 - Sydney mooring ordinal abundance data.csv", header = TRUE)

#load package
library(MASS)

#run stepwise model selection process (AIC)
master = lm(Day~Jassa_slatteryi+Lepas_anserifera+Lepas_anatifera+Caprella_danilevskii, dat=community)
step <- stepAIC(master, direction = "forward")
step$anova
master
plot(master, which = 1)
summary(master)
#note that line 8 is only the final model; each species was tested individually and in combination with each other

#apply AICc
library(AICcmodavg)
AICc(master, k = 2, REML = NULL)

