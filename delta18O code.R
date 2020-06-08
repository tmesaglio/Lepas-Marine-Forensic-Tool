#hypothesis one (species)
hone <- read.csv(file = "Dataset 8 - delta18O hypothesis one.csv", header = TRUE)
model1.aov <- aov(normalise ~ Code, data = hone)
summary(model1.aov)
TukeyHSD(model1.aov)
boxplot(normalise ~ Code, data = hone, ylim=c(-0.9,0),cex.axis=1.5, boxwex = 0.5)


#hypothesis two (time)
htwo <- read.csv(file = "Dataset 9 - delta18O hypothesis two.csv", header = TRUE)
model.lm <- lm(Temp ~ delta18O, data = htwo)
summary(model.lm)
plot (Temp ~ delta18O, data = htwo)
abline(model.lm)


#hypothesis three (latitude)
hthree <- read.csv(file = "Dataset 10 - delta18O hypothesis three.csv", header = TRUE)
model3.lm <- lm(Temp ~ delta18O, data = hthree)
summary(model3.lm)
plot(Temp ~ delta18O, data = hthree)
abline(model3.lm)

#note that all figures were edited in external software to improve aesthetics