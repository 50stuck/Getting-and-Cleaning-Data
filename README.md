##Getting-and-Cleaning-Data (ReadMe file)
==========================================

This is the ReadMe file for my course project submission to the "Getting and Cleaning Data" course on Coursera.
In this file I'll explain the different steps my "run_analysis.R" file takes inorder to answer the criterea
asked for by the assignment.

#Background
The file is supposed to work under the assumpotion that the "run_analysis.R" file is going to be installed in the
parent directory in which the "UCI HAR Dataset" directory is installed (where all the raw data is at).

That is why the first thing the "run_analysis.R" file does is to check if there's such a directory in the directory
in which it is installed. If no such a directory is accessable, running the "run_analysis.R" file should produce a
warning asking to be installed in the correct directory.

This step was taken because it seems there are several ways to interpret the instruction regarding the files ability
to "run as long as the Samsung data is in your working directory".

The actual data itself, of course, is the "Human Activity Recognition Using Smartphones Data Set" reffered to in the
assignment, and can be donwloaded from this URL: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
For more information about this dataset, please visit: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

#Step 1: Reading the files into data frames
The first step the code pursues is reading the data from 6 of the files extracted from the mentioned ZIP file, and
converting them into dataframes (named after the files themselves).
The "y" files' dataframe columns are named "Activity" to help make better sense of the code (as the "y" files contain
the index for the different activities that are being adressed in the "x" files); and the "subject" files' dataframe columns
are named "Subject" for the same reason (these files contain the index for the different Subjects that took part in the
expirement).

#Step 2: Merging the data into one big data frame
The second step the code pursues is merging all of the data frames into one big data frame.
This is done by binding the columns of the different dataframes relating to the test group together (since they all relate to
different attributes regarding the same observations); Then for the training group; and then binds the rows of those two dataframes
(since they relate to different observations - some of the test group and some of the training group - having the same attributes).

#Step 3: Extracting the variables on the mean and standard deviation for each measurement
The third step the code pursues reads the "features.txt" file and creates a list of the variables which end with either "mean()" or
"std()". It then extracts only these variables from the large data frame created in the previous step, along with the id variables
(activity index and subject).

#Step 4: Using descriptive activity names to name the activities in the data set
The fourth step the code pursues is reading the "activity_labels.txt" file into a dataframe, and naming its columns "Activity" (for
the activity index - same in the "activity_labels.txt" file as in the data frame created in the previous steps) and "Activity_Name".
The code then merges this new data frame with the one created in the preious step, thus adding a descriptive activity name to the
activity index in the data frame.

#Step 5: Label the data set with descriptive variable names.
The fifth step the code pursues is going back to the data read from the "features.txt" file and naming the columns of the newly created
data frame after the variables which were chosen out of the "features.txt" file during step #3 (as specified above). This, in fact,
replaces the non-descriptive variable names (i.e VAR1, VAR2, etc) with descriptive ones (e.g tBodyAcc-mean()-X, tBodyAcc-mean()-Y,
tBodyAcc-mean()-Z, etc.).

#Step 6: Creating a second, independent, tidy data set with the average of each variable for each activity and each subject
The sixth and final step the code pursues is "melting" the data frame and turning it into a long-form data frame in which the Activity_Name
and Subject are used as id variables, and positions them versus the averages for the different variables taken previously from the "features.txt"
file
Thus, as the assingment instructs, this step creates an independent tidy data set with the average of each variable for each activity and each subject.