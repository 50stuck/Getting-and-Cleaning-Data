library(reshape2)

##Before starting out - making sure that the working directory is right
print ("checking if the file is installed in the correct directory")
result <- sum(as.numeric(list.files() %in% "UCI HAR Dataset"))
if (result == 0) {warning("The 'run_analysis.R' file seems to be installed in the
wrong directory. Please install it in the directory in which the 'UCI HAR Dataset'
directory is installed")
                STOP()
                }

print ("executing")

##First thing - read the files into data frames
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
        names(y_train) <- "Activity"
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
        names(subject_train) <- "Subject"

x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
        names(y_test) <- "Activity"
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
        names(subject_test) <- "Subject"


##Second - merge all train and test data to one data frame
Test <- cbind(y_test, subject_test, x_test) #a dataframe containing all the Test data
Train <- cbind(y_train, subject_train, x_train) #a dataframe containing all the Train data
MergedDF <- rbind(Test, Train) #a dataframe containing both previous dataframes

##Third - extract only the measures regarding mean and standard deviation
features <- read.table("UCI HAR Dataset/features.txt")
MeanCOLS <- which(grepl("mean()", features[,2])) # returns all measures which
                                                 #end with "mean()"
StdCOLS <- which(grepl("std()", features[,2])) # returns all measures which end
                                               # with "std()"
InterestCols <- sort(unique(as.vector(rbind(MeanCOLS, StdCOLS)))) #one vector that
                                                        #units both of the above
ToExtract <- c(1,2,InterestCols+2) #correction due to the fact that the data frame
                        #has two id variables before the measurements themselves
NewDF <- MergedDF[,ToExtract] #a new DF with only desired measurements
                                     #extracted, plus the two id variables

##Fourth - use descriptive activity names to name the activities in the data set
act_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
        names(act_labels) <- c("Activity", "Activity_Name")
NewDF <- merge(act_labels, NewDF)

##Fifth - label the data set with descriptive variable names #(as set earlier in
        #the interesting columns inside the "features" data frame
VarNames <- as.character(features[InterestCols, 2])
names(NewDF) <- c("Activity", "Activity_Name", "Subject", VarNames)

##Sixth - reshape the DF to a new, tidy, dataset (long form)
MeltDF <- melt(NewDF, id=c("Activity_Name", "Subject"), measure.vars=VarNames)
