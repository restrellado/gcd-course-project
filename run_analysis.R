setwd("~/Documents/github/gcd-course-project")
file.url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(file.url, destfile = "hum_activity.zip", method = "curl")
unzip("hum_activity.zip")
x.test <- read.table("UCI HAR Dataset/test/X_test.txt") # test set
test.act <- read.table("UCI HAR Dataset/test/y_test.txt") # test activities
test.sub <- read.table("UCI HAR Dataset/test/subject_test.txt") # subjects
x.train <- read.table("UCI HAR Dataset/train/X_train.txt") # training set
train.act <- read.table("UCI HAR Dataset/train/y_train.txt") # train activities
train.sub <- read.table("UCI HAR Dataset/train/subject_train.txt") # subjects
act.label <- read.table("UCI HAR Dataset/activity_labels.txt") # activity labels
feat <- read.table("UCI HAR Dataset/features.txt") # variable names
# Add activities, subjects and variable labels to data sets
x.test <- cbind(x.test, test.act, test.sub)
colnames(x.test) <- c(as.character(feat[[2]]), "activity", "subject")
x.train <- cbind(x.train, train.act, train.sub)
colnames(x.train) <- c(as.character(feat[[2]]), "activity", "subject")
merged <- rbind(x.train, x.test)
library(dplyr)
