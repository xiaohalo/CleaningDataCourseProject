# the procedures to clean the data

1. Read in test data in file "./UCI HAR Dataset/test/X_test.txt", save it as test
2. Read in subject of each test data in file "./UCI HAR Dataset/test/subject_test.txt",  and  activity label of each test data in file "./UCI HAR Dataset/test/y_test.txt"
3. Add the subject and label as new columns to the test data frame 
4. Similarly as step 1-3, read in train data, its subject, and activity label, create a data frame, called train. 
5. Merges the train and the test sets to form one new data frame, and save it as fulldata
6. read in features (names of measurements) from file "./UCI HAR Dataset/features.txt", save the names involving mean and standard deviation to a data frame, features_abr.
7. Select subject, label(activity), and the measurements on the mean and standard deviation for each measurement from fulldata, and save them to mean_std.
8. Rename the column ([3:end]) names of mean_std to label the data set with descriptive variable names, which are in features_abr$feature. Note that column 1 and 2 store subject and activity label, respectively.
9. Replace the data set of label column in mean_std with descriptive activity names, using mapvalues function. 
10. Rename the column name "label" to "activity".
11. Group mean_std according to subject and activity, then calculate the average of each measurement of each subject-activity group, using summarise_each function.
12. Save the data frame to tidy_data
13. Write tidy_data to tidy_data.txt

# Structure of tidy_data
- dim: 180*81, where 180 is the product of 30(# of subject) and 6 (# of activity), 81 is the # of measurements on the mean and standard deviation.
- rows are observations.
- column 1 is subject.
- column 2 is activity.
- column 3:81 are the average of each measurement for each subject and each activity. The names of the measurement are shown in the column names. File "features_meanStd.txt" lists the names.  
