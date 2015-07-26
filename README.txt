Getting and Cleaning Data 
by Jeff Leek, PhD, Roger D. Peng, PhD, Brian Caffo, PhD

Course project demonstrating my ability to collect, work with, and clean a data set.
Author: Tomasz Zajac, Poland

Based on:
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

Full description of input data is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Data for the project downloaded from: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Project requirements:
Create one R script called run_analysis.R that does the following:
1.Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement. 
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive variable names. 
5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Project steps performed:

1. Load required libaries:
    - dyplr - for SELECT - used for selecting the  required columns
    - reshape2 - for MELT, DCAST used for summarizing data.

2. Load base data:
    - activity labels and their names,
    - list of all features.
    
3. Load train files:
    - activity codes for each observation,
    - which volunteer correponds to train data measurements,
    - train data and assign columns to features names.
    
4. Add Sbject and Activity data to the train data.

5. Load test files:
    - activity codes for each observation,
    - which volunteer correponds to test data measurements,
    - test data and assign columns to features names.
    
6. Add Sbject and Activity data to the test data.

7. Merge train and test data.

8. Extract columns with means and standard deviations data.

9. Melt data for easy casting.

10. Cast data into an array of averages of each variable for each activity and each subject.

11. Save tidy data set into file.

