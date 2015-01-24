
Code Book :: Getting and Cleaning Data - Course Project
====

Dataset Overview
----
The original data for this process was collected from a smartphone by a variety of subjects while engaging in several activties.
All subjects engaged in all activities.
Raw data was gathered from the phone's accelerometer and its gyroscope.
The values used in this process were derived by [a variety of calculations (described below)](#datadetail).

Conceptually, this process summarizes the original data by 
1. Subsetting the data, pulling out only fields which are a mean or a standard deviation
2. Grouping the data by the subject and activity
3. Averaging all the data for a given subject/activity pairing.

The final dataset is written to "tidy.txt" and can be read in with the following R command:

	verify <- read.table("data/tidy.txt", sep=" ", headers=TRUE)


Data Column Description
----

Subject
   Identifier for the subject providing the data, ranging from 1 to 30.
   
Activity
	A label for the level activity of a data point.
	One of WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, or LAYING.

Each subsequent column is an average of values for a give Subject/AcivityLevel in the range -1 to 1.
[See below for more detail on the variables and their derivation.](#datadetail)

The label for each variable is a combination of these facets:
* time, frequency, or angle
* Body or Gravity
* Accelerometer or Gyroscope
* Jerk (or empty)
* Magnitude (or empty)
* Mean or StdDev(standard deviation)
* Freq (or empty)
* X, Y, or Z axis


Complete list of columns
----
 
* Subject
* Activity
* timeBodyAccelerometerMeanX
* timeBodyAccelerometerMeanY
* timeBodyAccelerometerMeanZ
* timeGravityAccelerometerMeanX
* timeGravityAccelerometerMeanY
* timeGravityAccelerometerMeanZ
* timeBodyAccelerometerJerkMeanX
* timeBodyAccelerometerJerkMeanY
* timeBodyAccelerometerJerkMeanZ
* timeBodyGyroscopeMeanX
* timeBodyGyroscopeMeanY
* timeBodyGyroscopeMeanZ
* timeBodyGyroscopeJerkMeanX
* timeBodyGyroscopeJerkMeanY
* timeBodyGyroscopeJerkMeanZ
* timeBodyAccelerometerMagnitudeMean
* timeGravityAccelerometerMagnitudeMean
* timeBodyAccelerometerJerkMagnitudeMean
* timeBodyGyroscopeMagnitudeMean
* timeBodyGyroscopeJerkMagnitudeMean
* frequencyBodyAccelerometerMeanX
* frequencyBodyAccelerometerMeanY
* frequencyBodyAccelerometerMeanZ
* frequencyBodyAccelerometerMeanFreqX
* frequencyBodyAccelerometerMeanFreqY
* frequencyBodyAccelerometerMeanFreqZ
* frequencyBodyAccelerometerJerkMeanX
* frequencyBodyAccelerometerJerkMeanY
* frequencyBodyAccelerometerJerkMeanZ
* frequencyBodyAccelerometerJerkMeanFreqX
* frequencyBodyAccelerometerJerkMeanFreqY
* frequencyBodyAccelerometerJerkMeanFreqZ
* frequencyBodyGyroscopeMeanX
* frequencyBodyGyroscopeMeanY
* frequencyBodyGyroscopeMeanZ
* frequencyBodyGyroscopeMeanFreqX
* frequencyBodyGyroscopeMeanFreqY
* frequencyBodyGyroscopeMeanFreqZ
* frequencyBodyAccelerometerMagnitudeMean
* frequencyBodyAccelerometerMagnitudeMeanFreq
* frequencyBodyAccelerometerJerkMagnitudeMean
* frequencyBodyAccelerometerJerkMagnitudeMeanFreq
* frequencyBodyGyroscopeMagnitudeMean
* frequencyBodyGyroscopeMagnitudeMeanFreq
* frequencyBodyGyroscopeJerkMagnitudeMean
* frequencyBodyGyroscopeJerkMagnitudeMeanFreq
* angletBodyAccelerometerMeangravity
* angletBodyAccelerometerJerkMeangravityMean
* angletBodyGyroscopeMeangravityMean
* angletBodyGyroscopeJerkMeangravityMean
* angleXgravityMean
* angleYgravityMean
* angleZgravityMean
* timeBodyAccelerometerStdDevX
* timeBodyAccelerometerStdDevY
* timeBodyAccelerometerStdDevZ
* timeGravityAccelerometerStdDevX
* timeGravityAccelerometerStdDevY
* timeGravityAccelerometerStdDevZ
* timeBodyAccelerometerJerkStdDevX
* timeBodyAccelerometerJerkStdDevY
* timeBodyAccelerometerJerkStdDevZ
* timeBodyGyroscopeStdDevX
* timeBodyGyroscopeStdDevY
* timeBodyGyroscopeStdDevZ
* timeBodyGyroscopeJerkStdDevX
* timeBodyGyroscopeJerkStdDevY
* timeBodyGyroscopeJerkStdDevZ
* timeBodyAccelerometerMagnitudeStdDev
* timeGravityAccelerometerMagnitudeStdDev
* timeBodyAccelerometerJerkMagnitudeStdDev
* timeBodyGyroscopeMagnitudeStdDev
* timeBodyGyroscopeJerkMagnitudeStdDev
* frequencyBodyAccelerometerStdDevX
* frequencyBodyAccelerometerStdDevY
* frequencyBodyAccelerometerStdDevZ
* frequencyBodyAccelerometerJerkStdDevX
* frequencyBodyAccelerometerJerkStdDevY
* frequencyBodyAccelerometerJerkStdDevZ
* frequencyBodyGyroscopeStdDevX
* frequencyBodyGyroscopeStdDevY
* frequencyBodyGyroscopeStdDevZ
* frequencyBodyAccelerometerMagnitudeStdDev
* frequencyBodyAccelerometerJerkMagnitudeStdDev
* frequencyBodyGyroscopeMagnitudeStdDev
* frequencyBodyGyroscopeJerkMagnitudeStdDev


<a name="datadetail">Data description from source</a>
----
The features selected for this database come from the accelerometer and
gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals
(prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they
were filtered using a median filter and a 3rd order low pass Butterworth filter
with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration
signal was then separated into body and gravity acceleration signals
(tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter
with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in
time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the
magnitude of these three-dimensional signals were calculated using the Euclidean
norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).
 
Finally a Fast Fourier Transform (FFT) was applied to some of these signals
producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag,
fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain
signals).


