courseProject
=============

Course project for 'Getting and Cleaning Data'

The `run_analysis.R` script downloads, manipulates, and cleans a set of data which can be found at `https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip`.

The data set is a collection of values (such as mean, standard deviation, maximum and minimum value, etc.) computed from the measurements taken from the accelerometers and gyroscopes found on the Samsung Galaxy S smartphone of 30 subjects, each of whom performed six physical activities.

The data was divided into two groups: test (data from 9 subjects), and training (data from 21 subjects).

The `run_analysis.R` script performs the following actions on the original data set:

1. Download the data to the working directory
2. Create two separate data sets (test, and training) by merging the different components of each data group
3. Produce a unique data set by merging the test and the training data sets
4. Extract only the measurements on the mean and standard deviation for each measurement
5. Appropriately label the data set with descriptive and syntactically valid variable names
6. Produce an independent, tidy, data set with the average of each variable for each activity and each subject

The script can be run in any working directory. It handles the entire process, from the installation of the required 'dplyr' package, if needed, its loading, the downloading of the data, its unzipping and loading to R, through to all the manipulations required in order to output the `tidysamsung.txt` data set, which is saved in the working directory. Assuming the tidy data set is in the working directory, it can be loaded using the following command: `data = read.table("tidysamsung.txt", header = TRUE, sep = ",")`.

Chaining via the `%>%` operator is used where possible, to reduce the use of intermediate variables.

Some **data manipulation choices** were imposed by limitations in the original data set:

* When reading in the features data, the `col.names` parameter for the `read.table` function is not used to name the variables, as it will convert any non-alphabetic character (such as hyphens or brackets) to a dot, which would compromise the subsequent data manipulation steps required to complete the tasks in this script.
* When ordering the merged data frame ('bigsamsung') by subject id, subsetting based on
the output of the 'order' function is used, as the more compact
`arrange(bigsamsung, subjectid)` from the 'dplyr' package gives a *found duplicated column name* error because of 84 variables sharing name with at least one other variable (the 'feature_names' vector is of length 561, but has only 477 levels).
* When extracting the variables representing the mean and standard deviation for each measurement, as explained for the `arrange` function, and for the same reasons, the more compact `select(bigsamsung, contains("mean\\(|std\\("))` alternative from the 'dplyr' package gives a *found duplicated column name* error.

For the purpose of **extracting the 'measurements on the mean and standard deviation for each measurement'**, 'mean and standard deviation' were interpreted as referring to the
mean and standard deviation of each primary measurement itself (labelled as 'mean()' and 'std()' in the original data set) rather than its weighted averaged frequency component, or the averaged signals for the 'angle' set of measurements.

The **labelling of the measurement variables** in the merged and reduced data set ('meansamsung') poses a number of problems, as the variable names are expected to account for several components:

* domain of signal (time or frequency)
* component, for the sensor acceleration signal (body or gravitational)
* source of signal (accelerometer and gyroscope)
* where relevant, a feature computed from primary features (jerk signal, or magnitude of signal)
* type of statistic computed (mean or standard deviation)
* direction of signal (X, Y, or Z)

The naming pattern used in the original data set achieves a relatively good trade-off between human readability and succinctness. However, the documentation of the variables as provided in the codebook of the original data set is insufficient to make them entirely understandable. The original variable names also contain characters which are not allowed in syntactically valid variable names, such as hyphens or brackets. The `run_analysis.R` script performs the following transformations on the original measurement variable names:

* Remove illegal characters
* Expand some abbreviations, but not 'gyro' (which is a word in its own right), the abbreviation of 'standard deviation' (which is well-known), or 'freq' (which is understandable, and whose expanded form is long)
* Move the name of the computed statistic (mean or standard deviation) to the end of the character string

**Credits:**

Tim for the package download hint, in the thread ['I would assume we can use library("dplyr") for Course Project?'](https://class.coursera.org/getdata-008/forum/thread?thread_id=247) in the discussion forums of the 'Getting and Cleaning Data' course (run 008)
