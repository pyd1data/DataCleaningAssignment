## DataCleaningAssignment Code Book
#This code book gives information about the new tidy data set 
#The 68 features are first

*"subject": subject ids, ranged from one to 30
*"activity": "WALKING" ,"WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"

#Then the 66 features computed from the Samsung data set, by averaging by subject and activity: 
#33 from the mean() features 

tBodyAcc-mean()-XYZ  (one feature for X, one for Y and one for Z)
tGravityAcc-mean()-XYZ
tBodyAccJerk-mean()-XYZ
tBodyGyro-mean()-XYZ
tBodyGyroJerk-mean()-XYZ
tBodyAccMag-mean()
tGravityAccMag-mean()
tBodyAccJerkMag-mean()
tBodyGyroMag-mean()
tBodyGyroJerkMag-mean()
fBodyAcc-mean()-XYZ
fBodyAccJerk-mean()-XYZ
fBodyGyro-mean()-XYZ
fBodyAccMag-mean()
fBodyAccJerkMag-mean()
fBodyGyroMag-mean()
fBodyGyroJerkMag-mean()

and 33 from the std() features

tBodyAcc-std()-XYZ  (one feature for X, one for Y and one for Z)
tGravityAcc-std()-XYZ
tBodyAccJerk-std()-XYZ
tBodyGyro-std()-XYZ
tBodyGyroJerk-std()-XYZ
tBodyAccMag-std()
tGravityAccMag-std()
tBodyAccJerkMag-std()
tBodyGyroMag-std()
tBodyGyroJerkMag-std()
fBodyAcc-std()-XYZ
fBodyAccJerk-std()-XYZ
fBodyGyro-std()-XYZ
fBodyAccMag-std()
fBodyAccJerkMag-std()
fBodyGyroMag-std()
fBodyGyroJerkMag-std()
