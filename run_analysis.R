library(plyr)

## fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
## download.file(fileurl,destfile = "ProjectData.zip")

## Read data and rename colums
features <- read.table("features.txt")
activity <- read.table("activity_labels.txt")
subject_train <- read.table("train/subject_train.txt") ## x col = 1, y rows = 7352
y_train <- read.table("train/y_train.txt")  ## x col = 1, y rows = 7352
x_train <- read.table("train/x_train.txt")  ## x col = 561, y rows = 7352
subject_test <- read.table("test/subject_test.txt") ## x col = 1, y rows = 2947
y_test <- read.table("test/y_test.txt") ## x col = 1, y rows = 2947
x_test <- read.table("test/x_test.txt") ## x col = 561, y rows = 2947
names(activity) <- c("y","activity")
names(subject_train) <- c("subject")
names(y_train) <- c("y")
names(x_train) <- features[,2]
names(subject_test) <- c("subject")
names(y_test) <- c("y")
names(x_test) <- features[,2]

## 1: Merges the training and the test sets to create one data set.
comb_train <- cbind(subject_train, y_train, x_train)
comb_test <- cbind(subject_test, y_test, x_test)
CombData <- rbind(comb_train,comb_test)

## 2: Extracts only the measurements on the mean and standard deviation for each measurement. 
mean_col <- subset(colnames(CombData), grepl('mean()', colnames(CombData), fixed=TRUE))
std_col <- subset(colnames(CombData), grepl('std()', colnames(CombData), fixed=TRUE)) 
col_only <- c(colnames(CombData)[1], colnames(CombData)[2],mean_col,std_col)
meanstdonly <- CombData[,col_only]

## 3: Uses descriptive activity names to name the activities in the data set
meanstdonly$y <- activity[meanstdonly$y, 2]

## 4: Appropriately labels the data set with descriptive variable names.
colnames(meanstdonly)[2] <- "activity"

## 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
meanbygroup <- ddply(meanstdonly, .(subject, activity), function(x) colMeans(x[, 3:68]))
meanbygroup <- aggregate(meanstdonly[, 3:68], list(meanstdonly$subject, meanstdonly$activity), mean)

write.table(meanbygroup, "mean_byGroup_data.txt", row.name=FALSE)
