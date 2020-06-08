#load packages
library(vegan)
library(ggplot2)
library(mvabund)
library(ordinal)

#load data
bio_community <- read.csv(file = "Dataset 1 - Sydney mooring ordinal abundance data.csv", header = TRUE)


for (i in 2:37){
  bio_community[,i] <- as.factor( bio_community[,i] )
}
Day_spp <- mvabund(bio_community[,2:37])


#analysis
manyOrd=manyany("clm",Day_spp,Day_spp ~ Day,data=bio_community)
manyOrd_null=manyany("clm",Day_spp,Day_spp ~ 1,data=bio_community)
plot(manyOrd$fitted.values, manyOrd$residuals,xlim=c(0,2))
anova(manyOrd_null,manyOrd)
plot(manyOrd)

#results
a<-anova(manyOrd_null,manyOrd)
a
str(a)
a$p
