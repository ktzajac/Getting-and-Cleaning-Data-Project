#load required libaries
library(dplyr)
library(reshape2)

# load activity labels and their names
activity_labels = read.csv("activity_labels.txt", header = FALSE, sep = " ", col.names = c("code", "activity"))

# load list of all features
features = read.csv("features.txt", header = FALSE, sep = " ", col.names = c("code", "feature"))

# load train activity codes for each observation
y_train = read.csv("train/y_train.txt", header = FALSE, sep = " ", col.names = c("code"))

# load information which volunteer correponds to train data measurements
subject_train = read.csv("train/subject_train.txt", header = FALSE, sep = " ", col.names = c("code"))

# load train data and assign columns to features names
X_train = read.csv("train/X_train.txt", header = FALSE, sep = "", col.names = features$feature)

# add Sbject and Activity data to the train data
X_train$Subject = subject_train$code
X_train$Activity = activity_labels$activity[y_train$code]

# load test activity codes for each observation
y_test = read.csv("test/y_test.txt", header = FALSE, sep = " ", col.names = c("code"))

# load information which volunteer correponds to test data measurements
subject_test = read.csv("test/subject_test.txt", header = FALSE, sep = " ", col.names = c("code"))

# load test data and assign columns to features names
X_test = read.csv("test/X_test.txt", header = FALSE, sep = "", col.names = features$feature)

# add Sbject and Activity data to the test data
X_test$Activity = activity_labels$activity[y_test$code]
X_test$Subject = subject_test$code

# merge train and test data
merged_data = merge(X_train, X_test, sort = FALSE,all = TRUE)

# extract columns with means and standard deviations data
selected_data = select(merged_data, contains("mean",ignore.case = TRUE),contains("std",ignore.case = TRUE),contains("Subject",ignore.case = FALSE),contains("Activity",ignore.case = FALSE))

# melt data for easy casting
melted_data = melt(selected_data, id = c("Subject", "Activity"))

# cast data into an array of averages of each variable for each activity and each subject
summarized_data = dcast(melted_data, Subject + Activity ~ variable, mean)

# save tidy data set into file
write.table(summarized_data,"tidy_data_averages.txt",row.name=FALSE)

