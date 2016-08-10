##-------------------------test data--------------------------------------------
# read in test data in the test directory
test <- read.table("./UCI HAR Dataset/test/X_test.txt", colClasses="numeric")

# read in subject of each row
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", 
                           colClasses="integer")

# read in activity lable of each row
label_test <- read.table("./UCI HAR Dataset/test/y_test.txt", 
                     colClasses="integer")

# add subject and label of activity to the test data
test[,"subject"] <- subject_test
test[, "label"] <- label_test

rm(subject_test, label_test)
##--------------------------train data------------------------------------------
# read in train data
train <- read.table("./UCI HAR Dataset/train/X_train.txt", colClasses="numeric")

# read in subject of each train data 
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", 
                           colClasses="integer")

# read in activity lable of each train data 
label_train <- read.table("./UCI HAR Dataset/train/y_train.txt", 
                         colClasses="integer")

# add subject and label of activity to each train data
train[, "subject"] <- subject_train
train[, "label"] <- label_train

rm(subject_train, label_train)
#-------------------------------------------------------------------------------
# Merges the training and the test sets
fulldata <- rbind(train, test)
rm(train, test)

# read in features
features <- read.table("./UCI HAR Dataset/features.txt")
names(features) <- c("feature_id", "feature")

features_abr <- features[grepl("mean()", features$feature) 
                         | grepl("std()", features$feature) , ]

library(dplyr)

# extract only the measurements on the mean and standard deviation 
# for each measurement

mean_std <- select(fulldata, subject, label, features_abr[["feature_id"]])

# labels the data set with descriptive variable names
colnames(mean_std)[3:(2+nrow(features_abr))] <- 
    as.character(features_abr[["feature"]])

# read in activity-label
activity_label <- read.table("./UCI HAR Dataset/activity_labels.txt")
names(activity_label) <- c("label", "activity")
activity_label$activity <- as.character(activity_label$activity)

# Use descriptive activity names to name the activities in the data set
library(plyr)
mean_std$label <- mapvalues(mean_std$label, 
                                from=activity_label$label, 
                                to=activity_label$activity)
colnames(mean_std)[which(names(mean_std) == "label")] <- "activity"

# group data by subject and activity, then calculated the average of each variable
# for each activity and each subject
tidy_data <-  mean_std %>%
    group_by(subject, activity) %>%
    summarise_each(funs(mean))

write.table(tidy_data, file="tidy_data.txt", row.name=FALSE)    