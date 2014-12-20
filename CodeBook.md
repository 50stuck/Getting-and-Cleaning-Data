#Getting-and-Cleaning-Data (ReadMe file)
==========================================

This is the CodeBook file for my course project submission to the "Getting and Cleaning Data" course on Coursera.
In this file I'll explain the different variables in the dataset my "run_analysis.R" file produces for the assignment.
**IMPORTANT: MOST OF THE CONTENT OF THIS FILE IS AN ADAPTATION OF THE "FEATURES_INFO.TXT" FILE WHICH CAN BE FOUND INSIDE
THE GENERAL "UCI HAR Dataset" ZIP FILE IN THE FOLLOWING URL:https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip **

##Background
As mentioned in the "README" file in the "UCI HAR Dataset" ZIP file, the data the "run_analysis.R" file runs on derives from an
expirement in which each person in a group of 30 volunteers within an age bracket of 19-48 years performed six activities wearing
a Samsung Galaxy S II smartphone on the waist.
This CodeBook file goes through the different variables in the tidy data set created by the "run_analysis.R" file - all of which
derive from this said expirement.

 () wearing a smartphone (Samsung Galaxy S II) on the waist.


##ID Features
The "Activity_Name" and "Subject" variables derive from the files within the "UCI HAR Dataset" ZIP file, and represent "id features"
of the expirement.

###Activity_Name
The "Activity_Name" variable represents the six activities each of the 30 volunteers conducted while wearing a smartphone on the waist.
These activities are: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

###Subject
The "Subject" variable represents the index number of each of the volunteers who took part in this experiment.
Thus, this variable ranges from 1 to 30.

##Sensor Signals
As mentioned in the "features_info.txt" file, the sensor signals variables in the original dataset (which, naturally, are the ones
in the independent tidy data set created with the "run_analysis.R" file) "come from the accelerometer and gyroscope 3-axial raw signals
tAcc-XYZ and tGyro-XYZ."
The signals are normalized so each variable ranges between -1 and 1.

###Time domain signals
"These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered
using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise."

####Acceleration Signal
The following variables in the dataset are the mean and standard deviation of the body and gravity acceleration signals, calculated
from the 3-axial raw signals that were mentioned earlier:
* tBodyAcc-mean()-X    
* tBodyAcc-mean()-Y              
* tBodyAcc-mean()-Z
* tBodyAcc-std()-X               
* tBodyAcc-std()-Y
* tBodyAcc-std()-Z               
* tGravityAcc-mean()-X
* tGravityAcc-mean()-Y           
* tGravityAcc-mean()-Z
* tGravityAcc-std()-X            
* tGravityAcc-std()-Y
* tGravityAcc-std()-Z

The the acceleration signal was separated into body and gravity acceleration signals using another low pass Butterworth filter with a
corner frequency of 0.3 Hz. 

#### Jerk Signals
The following variables in the dataset are the mean and standard deviation of the body and gravity Jerk signals, obtained from the
linear acceleration and angular velocity variables (for all 3 axis):
* tBodyAccJerk-mean()-X
* tBodyAccJerk-mean()-Y          
* tBodyAccJerk-mean()-Z
* tBodyAccJerk-std()-X           
* tBodyAccJerk-std()-Y
* tBodyAccJerk-std()-Z           
* tBodyGyroJerk-mean()-X
* tBodyGyroJerk-mean()-Y         
* tBodyGyroJerk-mean()-Z
* tBodyGyroJerk-std()-X          
* tBodyGyroJerk-std()-Y
* tBodyGyroJerk-std()-Z          

####Magnitude of Signals
The following variable in the dataset represent the magnitude of these three-dimensional signals, calculated using the Euclidean norm:
* tBodyAccMag-mean()
* tBodyAccMag-std()              
* tGravityAccMag-mean()
* tGravityAccMag-std()           
* tBodyAccJerkMag-mean()
* tBodyAccJerkMag-std()          
* tBodyGyroMag-mean()
* tBodyGyroMag-std()             
* tBodyGyroJerkMag-mean()
* tBodyGyroJerkMag-std()         

###Frequency domain signals
"A Fast Fourier Transform (FFT) was applied to some of these signals" producing frequency domain signals.
The following variables represent the mean and standard deviation of these frequency domain signals:
* fBodyAcc-mean()-X
* fBodyAcc-mean()-Y              
* fBodyAcc-mean()-Z
* fBodyAcc-std()-X               
* fBodyAcc-std()-Y
* fBodyAcc-std()-Z               
* fBodyAccJerk-mean()-X          
* fBodyAccJerk-mean()-Y
* fBodyAccJerk-mean()-Z          
* fBodyAccJerk-std()-X
* fBodyAccJerk-std()-Y           
* fBodyAccJerk-std()-Z
* fBodyGyro-mean()-X
* fBodyGyro-mean()-Y             
* fBodyGyro-mean()-Z
* fBodyGyro-std()-X              
* fBodyGyro-std()-Y
* fBodyGyro-std()-Z              
* fBodyBodyAccJerkMag-mean()
* fBodyBodyAccJerkMag-std()      
* fBodyBodyGyroMag-mean()        
* fBodyBodyGyroMag-std()
* fBodyBodyGyroJerkMag-mean()
* fBodyBodyGyroJerkMag-std()     

####Weighted Averages of Variables
The following variables represent the weighted average of the frequency components of the frequeny domain signals mentioned so far, thus
representing a mean frequency:
* fBodyAcc-meanFreq()-X
* fBodyAcc-meanFreq()-Y          
* fBodyAcc-meanFreq()-Z
* fBodyAccJerk-meanFreq()-X      
* fBodyAccJerk-meanFreq()-Y
* fBodyAccJerk-meanFreq()-Z      
* fBodyGyro-meanFreq()-X
* fBodyGyro-meanFreq()-Y         
* fBodyGyro-meanFreq()-Z
* fBodyAccMag-meanFreq()         
* fBodyBodyAccJerkMag-meanFreq()
* fBodyBodyGyroMag-meanFreq()    
* fBodyBodyGyroJerkMag-meanFreq()

###Additional Variables
These variables represent the mean and standard deviation of additional signals, which were used used to estimate variables of the feature
vector for each pattern:
* tBodyGyro-mean()-X
* tBodyGyro-mean()-Y             
* tBodyGyro-mean()-Z
* tBodyGyro-std()-X              
* tBodyGyro-std()-Y
* tBodyGyro-std()-Z              
* fBodyAccMag-mean()             
* fBodyAccMag-std()