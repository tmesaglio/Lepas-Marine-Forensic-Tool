#load data
driftercharacters <- read.csv(file = "Dataset 5 - drifter surface area (log) vs. Lepas anserifera abundance (log).csv", header = TRUE)

#run the model
model <- lm(logcount ~ logSA, data = driftercharacters)
summary(model)

#plot surface area vs count
plot(logcount ~ logSA, data = driftercharacters,pch=19, ylab = "log abundance", xlab = "log surface area (cm )",cex.lab=1.5, cex.axis=1.5, xlim=c(0,5), ylim=c(0,4))
abline(model)

#check assumptions
plot(model, which = 1)

#note that the figure was edited in external software to improve aesthetics
