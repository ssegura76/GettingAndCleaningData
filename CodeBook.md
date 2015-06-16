#Codebook for Course Project Database

## Explanation, original data

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 
These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using 
a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the 
acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using 
another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ 
and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, 
tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, 
fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern: '-XYZ' is used to denote 3-axial signals in the 
X, Y and Z directions.The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years.

## Database transformation

The original data was appended as follows:
* 1. X_test.txt and X_train.txt were appended and a "key" called "id" was created as a sequence variable.
* 2. y_test.txt and y_train.txt were appended and a "key" called "id" was created as a sequence variable.
* 3. subject_test.tx and subject_train.txt were appended and a "key" called "id" was created as a sequence variable.
* 4. The activities where extracted from the "features.txt" archive, and a key was created called "activity code".
* 5. Databases formed in 1, 2 and 3 where merged using the "id", and then merged with the database of 4 by de Activity code.
* 6. The variables measurements on the mean and standard deviation were extracted.
* 7. The mean was calculated por each subject and each activity.

Each variable shows the AVERAGE FOR EACH SUBJECT AND EACH ACTIVITY, of the mean and standard deviation value for the variable, for a 
total of 66 NUMERICAL variables, and 2 variables for the agrupation: subject (numerical variable that identifies each subject of
the experiment) and activity (string variable that identifies the activity developed by the subject).

## Variables included in the database

* 1. tBodyAcc
* 2. tGravityAcc
* 3. tBodyAccJerk
* 4. tBodyGyro
* 5. tBodyGyroJerk
* 6. tBodyAccMag
* 7. tGravityAccMag
* 8. tBodyAccJerkMag
* 9. tBodyGyroMag
* 10.tBodyGyroJerkMag
* 11.fBodyAcc
* 12.fBodyAccJerk
* 13.fBodyGyro
* 14.fBodyAccMag
* 15.fBodyBodyAccJerkMag
* 16.fBodyBodyGyroMag
* 17.fBodyBodyGyroJerkMag

Each variable has mean value (mean()) and Standard deviation value (std()).

For variables 1 to 5 and 11 to 13 therea are X, Y and Z directions. Variables 6 to 10 only have on measure.

