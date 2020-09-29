#load data
community <- read.csv(file = "Dataset 1 - Sydney mooring ordinal abundance data.csv", header = TRUE)

#load package
library(AICcmodavg)

#run stepwise model selection process (AICc)
master = lm(Day~Jassa_slatteryi+Lepas_anserifera+Lepas_anatifera+Caprella_danilevskii, dat=community)
AICc(master, k = 2, REML = NULL)
master
plot(master, which = 1)
summary(master)
#note that line 8 is only the final model; each species was tested individually and in combination with each other




