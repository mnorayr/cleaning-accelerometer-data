Readme

Getting and Cleaning Data Course Project

This is a script that combines, cleans, filters and summarises the accelerometer data collected in an experiment 
described in 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The actual data can be found at
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Given the accelerometer collected data 
test/X_test.txt
train/X_train.txt

the activity information
test/y_test.txt
train/y_train.txt

the features file containg the variable names
features.txt

the subject information for the expereiment
test/subject_test.txt
train/subject_train.txt

This script will read the data, set variable names from the features file, the activity list (replacing the numbers by corresponding activity lables), subject lists and combine them together, into a data frame called data. 

Next from data only the mean and standard deviation variables are extracted into a data frame called datams.

Finally a data set called summary is created, which includes the average of each variable for each activity and each subject.
