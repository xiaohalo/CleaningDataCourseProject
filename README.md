#Getting and Cleaning Data Course Project

The purpose of this project is to demonstrate how to clean a dataset. The demonstration includes the following files:
- "README.txt"
- "UCI HAR Dataset": directory stores the raw data
- "run_analysis.R": the R script to clean the data
- "tidy_data.txt": the average of each variable for each activity and each subject, obtained after running run_analysis.R
- "CodeBook.md": describes the variables, the data, and transformations to clean up the data
- "features_meanStd.txt": lists the descriptive variable names of the column in tidy_data.txt

The script run_analysis.R does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The raw data was downloaded from

(https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

A full description is available at the site where the data was obtained:

(http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The data is stored in directory UCI HAR Dataset.

