#read in data
bio_community <- read.csv(file = "Dataset 1 - Sydney mooring ordinal abundance data.csv", header = TRUE)
biomat <- bio_community[,2:37]
day <- bio_community$Day

#make ordinal matrix of factors
bio_community_ord <- bio_community
for (i in c(2:37)){
  bio_community_ord[,i] <- as.factor(bio_community_ord[,i])
}
biomat_ord <- bio_community_ord[,2:37]


#install tool that creates ordination plots from mvabund objects!
install.packages("devtools")
library(devtools)
devtools::install_github("gordy2x/ecoCopula",force=TRUE)
library(mvabund)
library(ecoCopula)
library(ordinal)

many_bio <- manyany("clm",biomat_ord,biomat_ord~1,data = bio_community)

#check assumptions
plot(many_bio)

#ordination
many_bio_lv = cord(many_bio)

#produce figure
plot(many_bio_lv$scores[[1]][1,],many_bio_lv$scores[[1]][2,],type='n',xlab="Latent Variable 1",ylab= "Latent Variable 2", col=as.factor(day),label=1:6, cex.axis = 1.5, cex.lab = 1.4)
text(many_bio_lv$scores[[1]][1,],many_bio_lv$scores[[1]][2,],label=day,col=c(1:6), cex =2)

#note that the figure was edited in external software to improve aesthetics