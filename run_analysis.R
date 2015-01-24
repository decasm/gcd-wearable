
# Getting and Cleaning Data - Course Project
# Cleaning up a set of smartphone accelerometer and gyrscope data points.

library(dplyr)

# Check that source data directory is present, stop with error if not
if (!file.exists("UCI HAR Dataset")) {
  stop("Source data directory not present: \"UCI HAR Dataset\" - exiting")
}

# Create output data directory if not present
if (!file.exists("./data")){dir.create("./data")}

# Source of the column names
labelFile = "UCI HAR Dataset/features.txt"

activityFile = "UCI HAR Dataset/activity_labels.txt"

testFile = "UCI HAR Dataset/test/X_test.txt"
testSubFile = "UCI HAR Dataset/test/subject_test.txt"
testActFile = "UCI HAR Dataset/test/y_test.txt"

trainFile = "UCI HAR Dataset/train/X_train.txt"
trainSubFile = "UCI HAR Dataset/train/subject_train.txt"
trainActFile = "UCI HAR Dataset/train/y_train.txt"

# Read in feature labels (for step 4)
labels <- read.table(labelFile, sep=" ", header=FALSE)
# clean labels for tidiness, uppercase "mean" and "std", and remove all punctuation
labels <- gsub("mean", "Mean", fixed=T, labels[,2])
labels <- gsub("std", "StdDev", fixed=T, labels)
labels <- gsub("[[:punct:]]", "", labels)
labels <- gsub("^t", "time", labels)
labels <- gsub("^f", "frequency", labels)
labels <- gsub("Acc", "Accelerometer", fixed=T, labels)
labels <- gsub("Gyro", "Gyroscope", fixed=T, labels)
labels <- gsub("Mag", "Magnitude", fixed=T, labels)
labels <- gsub("BodyBody", "Body", fixed=T, labels)


# Read in activity labels
activities <- read.table(activityFile, sep=" ", header=FALSE, col.names=c("id", "label"))

# Read in test data points (test), test activity codes (testAct), and test subject ids (testSub)
test <- read.fwf(testFile, col.names = labels, row.names = NULL, widths=rep(c(16),length(labels)))
testAct <- read.fwf(testActFile, col.names = c("ActivityCode"), row.names = NULL, widths=c(1))
testSub <- read.fwf(testSubFile, col.names = c("Subject"), row.names = NULL, widths=c(2))
# Combine all test sources into one variable
testCom <- cbind(test,testAct,testSub)

# Read in train data points (train), train activity codes (trainAct), and train subject ids (trainSub)
train <- read.fwf(trainFile, col.names = labels, row.names = NULL, widths=rep(c(16),length(labels)))
trainAct <- read.fwf(trainActFile, col.names = c("ActivityCode"), row.names = NULL, widths=c(1))
trainSub <- read.fwf(trainSubFile, col.names = c("Subject"), row.names = NULL, widths=c(2))
# Combine all train sources into one variable
trainCom <- cbind(train,trainAct,trainSub)

# Combine test and train data into a single frame (Step 1)
full <- rbind(testCom,trainCom)

# Select just the mean, standard deviation, activity code, and subject (Step 2)
abbr <- select(full,contains("Mean"),contains("StdDev"),ActivityCode,Subject)

# Add activity labels for each code (step 3)
abbr$Activity <- activities[ abbr$ActivityCode  ,2]
# Remove the activity code
abbr <- abbr[,!(names(abbr) %in% c("ActivityCode"))]

# Write out interim version for inspection
#write.table(abbr, file="./data/interim.txt", row.names=FALSE)

# Create the average of each variable for each activity and each subject. (step 5)
tidy <- aggregate(. ~ Subject + Activity, data=abbr, mean)

# Write the final tidy dataset
write.table(tidy, file="./data/tidy.txt", row.names=FALSE)

# End