setwd("~/Documents/github/gcd-course-project")
file.url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(file.url, destfile = "hum_activity.zip", method = "curl")
unzip("hum_activity.zip")
x.test    <- read.table("UCI HAR Dataset/test/X_test.txt") # test set
test.act  <- read.table("UCI HAR Dataset/test/y_test.txt") # test activities
test.sub  <- read.table("UCI HAR Dataset/test/subject_test.txt") # subjects
x.train   <- read.table("UCI HAR Dataset/train/X_train.txt") # training set
train.act <- read.table("UCI HAR Dataset/train/y_train.txt") # train activities
train.sub <- read.table("UCI HAR Dataset/train/subject_train.txt") # subjects
act.label <- read.table("UCI HAR Dataset/activity_labels.txt") # activity labels
feat      <- read.table("UCI HAR Dataset/features.txt") # variable names
# Add activities, subjects and variable labels to data sets.
# Merge test and training sets.
x.test <- cbind(x.test, test.act, test.sub)
x.train <- cbind(x.train, train.act, train.sub)
colnames(x.test) <- c(as.character(feat[[2]]), "activity", "subject")
colnames(x.train) <- c(as.character(feat[[2]]), "activity", "subject")
merged <- rbind(x.train, x.test)
# Select only std and mean variables
var.names <- names(merged)
var.mean <- grep("mean", var.names, value = TRUE)
var.std <- grep("std", var.names, value = TRUE)
new.merged <- merged[, c(var.mean, var.std, "activity", "subject")]
# Replace activity labels with descriptions
new.merged$activity <- as.character(new.merged$activity)
new.merged$activity <- sub("1", "walking", new.merged$activity)
new.merged$activity <- sub("2", "walking upstairs", new.merged$activity)
new.merged$activity <- sub("3", "walking downstairs", new.merged$activity)
new.merged$activity <- sub("4", "sitting", new.merged$activity)
new.merged$activity <- sub("5", "standing", new.merged$activity)
new.merged$activity <- sub("6", "laying", new.merged$activity)
# Clean up variable names
names(new.merged) <- tolower(names(new.merged))
names(new.merged) <- sub("\\()", "", names(new.merged))
# Gather sensor variables into one column called type
library(dplyr)
library(tidyr)
new.merged <- tbl_df(new.merged)
new.merged <- gather(new.merged, type, measurement, -activity, -subject)
# Tidy data set with average of each variable for each activity and each subj.
merged.mean <- new.merged %>%
  group_by(type, activity, subject) %>%
  summarise(mean = mean(measurement))
write.table(merged.mean, file = "step5_tidy_dataset.txt", row.names = FALSE)