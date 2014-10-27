# This script requires the 'dplyr' package
# Check if 'dplyr' is installed, install it if necessary, and load it
if(!"dplyr" %in% rownames(installed.packages())) {
    install.packages("dplyr")
}
library(dplyr)

# Download and unzip the data file
path = getwd()
temp = tempfile()
fileUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, temp)
dateDownloaded = date()
unzip(temp, exdir = "./samsung")
unlink(temp)

###############################################################################
# Task 1
# Merge the training and the test sets to create one data set

# Set the working directory 
samsungpath = "./samsung"
setwd(samsungpath)

# Read in the feature names and the features of the two data sets
# (test and training)
feature_names = read.table("./UCI HAR Dataset/features.txt")[, 2]
features_test = read.table("./UCI HAR Dataset/test/X_test.txt")
features_train = read.table("./UCI HAR Dataset/train/X_train.txt")
# Label the two feature sets using the feature names
colnames(features_test) = feature_names
colnames(features_train) = feature_names

# Read in and label the two subject data sets
subjects_test = read.table("./UCI HAR Dataset/test/subject_test.txt",
                          col.names = "subjectid")
subjects_train = read.table("./UCI HAR Dataset/train/subject_train.txt",
                           col.names = "subjectid")

# Read in and label the activity ids and names
activity = read.table("./UCI HAR Dataset/activity_labels.txt",
                      col.names = c("activityid", "activity"))
# Add activity names to the two activity data sets
activities_test = read.table("./UCI HAR Dataset/test/Y_test.txt",
                    col.names = "activityid") %>%
    inner_join(activity, by = "activityid") %>%
    select(activity)
activities_train = read.table("./UCI HAR Dataset/train/Y_train.txt",
                     col.names = "activityid") %>%
    inner_join(activity, by = "activityid") %>%
    select(activity)

# Merge the test data to produce a data frame
df_test = cbind(subjects_test, activities_test, features_test)
# Do the same for the training data
df_train = cbind(subjects_train, activities_train, features_train)

# Merge the 'df_test' data frame and the 'df_train' data frame
bigsamsung = rbind(df_test, df_train)
# Order the unique data frame by subject id
bigsamsung = bigsamsung[order(bigsamsung$subjectid), ]

###############################################################################
# Task 2
# Extract only the measurements on the mean and standard deviation
# for each measurement

# Find the indices of the columns whose names contain 'mean(' or 'std('
goodcols = grep("mean\\(|std\\(", colnames(bigsamsung))

# Add the indices of the first two columns in the 'bigsamsung' data frame
goodcols = c(1:2, goodcols)

# Subset the 'bigsamsung' data frame on the selected columns
meansamsung = bigsamsung[, goodcols]

###############################################################################
# Task 3
# Use descriptive activity names to name the activities in the data set

# This was done as part of Task 1
# levels(meansamsung$activity)
# [1] "LAYING"             "SITTING"            "STANDING"          
# [4] "WALKING"            "WALKING_DOWNSTAIRS" "WALKING_UPSTAIRS"

###############################################################################
# Task 4
# Appropriately label the data set with descriptive variable names

# Expand the domain of the signal
colnames(meansamsung) = sub("^t", "time", colnames(meansamsung))
colnames(meansamsung) = sub("^f", "freq", colnames(meansamsung))
# Expand abbreviations
colnames(meansamsung) = sub("Acc", "Acceleration", colnames(meansamsung))
colnames(meansamsung) = sub("Mag", "Magnitude", colnames(meansamsung))
# Remove brackets following statistics
colnames(meansamsung) = sub("\\(\\)", "", colnames(meansamsung))
# Replace hyphens with underscores
colnames(meansamsung) = gsub("-", "_", colnames(meansamsung))
# Move statistic to final position
colnames(meansamsung) = sub("(_(mean|std))(.*)", "\\3\\1", colnames(meansamsung))

###############################################################################
# Task 5
# From the data set in step 4, create a second, independent tidy data set
# with the average of each variable for each activity and each subject

tidysamsung = meansamsung %>%
    group_by(subjectid, activity) %>%
    summarise_each(funs(mean))

# Relable feature variables
colnames(tidysamsung)[-(1:2)] = sub("(.*)", "avg_\\1",
                                   colnames(tidysamsung)[-(1:2)])

# Write the data frame to a TXT file
write.table(tidysamsung, file = "tidysamsung.txt", sep = ",",
            row.names = FALSE)
