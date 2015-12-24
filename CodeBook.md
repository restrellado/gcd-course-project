#Samsung Galaxy Accelerometer and Gyroscope Dataset#

Ryan Estrellado

December 22, 2015

##Purpose
The purpose of this document is to

1. Describe the method for cleaning the raw data in the analysis of accelerometer and gyroscope data from the Samsung Galaxy fitness experiment and
2. Describe the variables used

The raw data can be obtained from the following url:

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

##Method for Cleaning the Data
The following steps were taken to clean and transform the raw data:

1. Added activity and subject columns to the training and test datasets
2. Combined the training and test datasets
3. Extracted only the mean and standard deviation measurements
4. Replaced numeric values for "activity" with labels from the activity_labels.txt file included in the raw data
5. Edited the measurement titles to a cleaner naming convention
6. Stacked the measurement variables into one column named "type"

##About the Variables in This Analysis
Running the code in this analysis results in two datasets. The first dataset results in four variables:

**Activity** has one of the physical activities from the raw dataset as its value.

**Subject** has the number assigned to the test subject as its value.

**Type** has one of the accelerometer or gyroscope measurements types as its value. **Type** explains whether the resulting measurement was from an accelerometer or gyroscope and whether the measurement was a mean or standard deviation.

**Measurement** is the value of the measurement described by the **type** variable. Acceleration (acc) values are measured in g's. Gyroscope (gyro) values are measured in radians per second.

The second dataset summarizes the dataset above and results in four variables:

**Type** has one of the accelerometer or gyroscope measurements types as its value. The **type** explains whether the resulting measurement was from an accelerometer or gyroscope and whether the measurement was a mean or standard deviation.

**Activity** has one of the physical activities from the raw dataset as its value.

**Subject** has the number assigned to the test subject as its value.

**Mean** provides the mean measurement in g's (accelerometer) or radians per second (gyroscope) for the specified type, activity, and subject combination.

##About the Raw Data
The link to the raw data above includes the following separate data files:

+ A test data set
+ A training data set
+ Labels for each activity
+ A list of variables

###Variables from Raw Data

The following are a list of variables from the raw data:

*Activities*

1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING

*Variables (a.k.a., Features)*

The following description was taken from the features_info.txt document included in the link above. A full list of the features can be found in the link to the raw data.

>Feature Selection 

>The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

>Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

>Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

>These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.