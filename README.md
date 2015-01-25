## Getting and Cleaning Data Course Project

Repo for the submission of the course project for the Johns Hopkins Getting and Cleaning Data course.

### Overview
This project serves to demonstrate the collection and cleaning of a tidy data set that can be used for subsequent
analysis. A full description of the data used in this project can be found at [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

[The zip source](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## Dependencies
To source the R script, the following libraries are required to be installed:
* data.table
* reshape

### Working Directory
The R script should be ran from the same directory where the unzipped source directory is. 

### Project Summary
The following is a summary description of the project instructions

run_analysis.R does the following. 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

### Additional Information
You can find additional information about the variables, data and transformations in the CodeBook.MD file.
