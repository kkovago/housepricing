# Predict the list prioce of houses in Boulder, CO

# load libraries
library(caret)
library(randomForest)

# Load data, correct the name of first column
dat <- read.csv("Boulder Housing Data Set.csv")
names(dat)[1] <- "LIST.PRICE"

# Delete columns I don't intend to use
dropColumns <- c("HOME.TYPE","BATHS", "LOT.SIZE","YEAR.BUILT","DAYS.ON.MARKET")
dat <- dat[ , !(names(dat) %in% dropColumns)]

# Create a list of valid selections for the selection fields
listZip <- sort(unique(dat$ZIP))
listBeds <- sort(unique(dat$BEDS))

# Create a Random Forest based training model. Because it is 
# time consuming, save the model and next time only load it 
# instead of recalculating
if(file.exists("rf.trainingModel.RData")) {
    load(file="rf.trainingModel.RData", verbose=TRUE)
} else {
    rf.trainingModel <- train(LIST.PRICE ~ ., data=dat, method="rf")
    save(rf.trainingModel, file="rf.trainingModel.RData")
}

# Set the Square Foot scale for the diagram
valSqft <- seq(500, 9000, 200)
numPoints <- length(valSqft)
