#load data
lepas <- read.csv(file = "Dataset 6 - drifter surface area (log) vs. Lepas anserifera length.csv", header = TRUE)

#run model
model <- lm(Maxlength ~ logSA, data = lepas)
summary(model)

#plot surface area vs length
plot(Maxlength ~ logSA, data = lepas,pch=19, ylab = "Maximum capitulum length (mm)", xlab = "log surface area (cm )",cex.lab=1.5, cex.axis=1.5)
abline(model)

#check assumptions
plot(model, which = 1)

#note that the figure was edited in external software to improve aesthetics