#Samsung Tidy Data Code Book 

###subjectid

> Id number assigned to the subject
> 
> **Type:** integer
> 
> **Values:** 1..30

###activity

> Physical activity performed by each subject

> **Type:** factor

> **Levels:** "LAYING" "SITTING" "STANDING" "WALKING" "WALKING\_DOWNSTAIRS" "WALKING\_UPSTAIRS"

###66 measurement variables
representing the mean and standard deviation computed from direct measurements collected through the accelerometer and gyroscope of a Samsung Galaxy S smartphone.

*The information regarding the way the measurements were made comes from the code book of the original data set, which can be downloaded from `https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip`.*

> 3-axial raw time-domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. 

> Similarly, the acceleration signal was then separated into body and gravity acceleration signals using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

> Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals. Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm.

> Finally a Fast Fourier Transform was applied to some of these signals, producing frequency domain signals.

> The mean and the standard deviation was estimated for these measurements.

Finally, the average of each variable for each activity and each subject was calculated.

The naming pattern of the variables thus computed is:

* 'avg', indicating that it was computed as a mean
* domain of signal ('time', or 'freq' for 'frequency')
* component of the sensor acceleration signal (body or gravitational)
* source of signal (accelerometer or gyroscope)
* where relevant, a feature computed from primary features (jerk signal, or magnitude of signal)
* direction of signal (X, Y, or Z)
* type of statistic computed (mean or standard deviation)

"avg_timeBodyAcceleration_X_mean" is therefore to be read as: "the average of the mean of the time-domain body component of the senor acceleration signal in the X direction"

The full list of the 66 measurement variables is given below:

 [1] "avg_timeBodyAcceleration_X_mean"               
 [2] "avg_timeBodyAcceleration_Y_mean"               
 [3] "avg_timeBodyAcceleration_Z_mean"               
 [4] "avg_timeBodyAcceleration_X_std"                
 [5] "avg_timeBodyAcceleration_Y_std"                
 [6] "avg_timeBodyAcceleration_Z_std"                
 [7] "avg_timeGravityAcceleration_X_mean"            
 [8] "avg_timeGravityAcceleration_Y_mean"            
 [9] "avg_timeGravityAcceleration_Z_mean"            
[10] "avg_timeGravityAcceleration_X_std"             
[11] "avg_timeGravityAcceleration_Y_std"             
[12] "avg_timeGravityAcceleration_Z_std"             
[13] "avg_timeBodyAccelerationJerk_X_mean"           
[14] "avg_timeBodyAccelerationJerk_Y_mean"           
[15] "avg_timeBodyAccelerationJerk_Z_mean"           
[16] "avg_timeBodyAccelerationJerk_X_std"            
[17] "avg_timeBodyAccelerationJerk_Y_std"            
[18] "avg_timeBodyAccelerationJerk_Z_std"            
[19] "avg_timeBodyGyro_X_mean"                       
[20] "avg_timeBodyGyro_Y_mean"                       
[21] "avg_timeBodyGyro_Z_mean"                       
[22] "avg_timeBodyGyro_X_std"                        
[23] "avg_timeBodyGyro_Y_std"                        
[24] "avg_timeBodyGyro_Z_std"                        
[25] "avg_timeBodyGyroJerk_X_mean"                   
[26] "avg_timeBodyGyroJerk_Y_mean"                   
[27] "avg_timeBodyGyroJerk_Z_mean"                   
[28] "avg_timeBodyGyroJerk_X_std"                    
[29] "avg_timeBodyGyroJerk_Y_std"                    
[30] "avg_timeBodyGyroJerk_Z_std"                    
[31] "avg_timeBodyAccelerationMagnitude_mean"        
[32] "avg_timeBodyAccelerationMagnitude_std"         
[33] "avg_timeGravityAccelerationMagnitude_mean"     
[34] "avg_timeGravityAccelerationMagnitude_std"      
[35] "avg_timeBodyAccelerationJerkMagnitude_mean"    
[36] "avg_timeBodyAccelerationJerkMagnitude_std"     
[37] "avg_timeBodyGyroMagnitude_mean"                
[38] "avg_timeBodyGyroMagnitude_std"                 
[39] "avg_timeBodyGyroJerkMagnitude_mean"            
[40] "avg_timeBodyGyroJerkMagnitude_std"             
[41] "avg_freqBodyAcceleration_X_mean"               
[42] "avg_freqBodyAcceleration_Y_mean"               
[43] "avg_freqBodyAcceleration_Z_mean"               
[44] "avg_freqBodyAcceleration_X_std"                
[45] "avg_freqBodyAcceleration_Y_std"                
[46] "avg_freqBodyAcceleration_Z_std"                
[47] "avg_freqBodyAccelerationJerk_X_mean"           
[48] "avg_freqBodyAccelerationJerk_Y_mean"           
[49] "avg_freqBodyAccelerationJerk_Z_mean"           
[50] "avg_freqBodyAccelerationJerk_X_std"            
[51] "avg_freqBodyAccelerationJerk_Y_std"            
[52] "avg_freqBodyAccelerationJerk_Z_std"            
[53] "avg_freqBodyGyro_X_mean"                       
[54] "avg_freqBodyGyro_Y_mean"                       
[55] "avg_freqBodyGyro_Z_mean"                       
[56] "avg_freqBodyGyro_X_std"                        
[57] "avg_freqBodyGyro_Y_std"                        
[58] "avg_freqBodyGyro_Z_std"                        
[59] "avg_freqBodyAccelerationMagnitude_mean"        
[60] "avg_freqBodyAccelerationMagnitude_std"         
[61] "avg_freqBodyBodyAccelerationJerkMagnitude_mean"
[62] "avg_freqBodyBodyAccelerationJerkMagnitude_std" 
[63] "avg_freqBodyBodyGyroMagnitude_mean"            
[64] "avg_freqBodyBodyGyroMagnitude_std"             
[65] "avg_freqBodyBodyGyroJerkMagnitude_mean"        
[66] "avg_freqBodyBodyGyroJerkMagnitude_std"  
