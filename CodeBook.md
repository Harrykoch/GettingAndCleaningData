(Intermediate) script variables
features		Names of the 561 attributes
activity		Names of the 6 activities
vecCol		Vector the index number linked to the features where TRUE means that the feature either has „mean” or „std” in the name

tst_x		561 attributen vector: test from test file
tst_y		Contains the activities performed from test file
tst_sub		Who performed the activities from test file
tst			Three test files merged into one data frame

trn_x		561 attributen vector: trn from train file
trn_y		Contains the activities performed from train file
trn_sub		Who performed the activities from train file
trn			Three train files merged into one data frame

tsttrn		Merged tst and trn data frames

tidy			Melted tsttrn data frame
tidy2		Aggregated result dataset holding the means of the variables per subject and activity

=================================================================================
Resulting data set:	tidy2
Variables:

Activity				Activity performed (by subject)
Subject				Identifier of person performing the activities

The following variables contain the MEAN over the listed variables over all the activities measured in the original dataset. The definition of the variables listed below is identical to that of the originating dataset.

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

tBodyAcc.mean...X
tBodyAcc.mean...Y
tBodyAcc.mean...Z
tBodyAcc.std...X 
tBodyAcc.std...Y
tBodyAcc.std...Z      
tGravityAcc.mean...X  
tGravityAcc.mean...Y  
tGravityAcc.mean...Z  
tGravityAcc.std...X   
tGravityAcc.std...Y   
tGravityAcc.std...Z   
tBodyAccJerk.mean...X 
tBodyAccJerk.mean...Y 
tBodyAccJerk.mean...Z 
tBodyAccJerk.std...X  
tBodyAccJerk.std...Y  
tBodyAccJerk.std...Z  
tBodyGyro.mean...X    
tBodyGyro.mean...Y    
tBodyGyro.mean...Z    
tBodyGyro.std...X     
tBodyGyro.std...Y     
tBodyGyro.std...Z     
tBodyGyroJerk.mean...X
tBodyGyroJerk.mean...Y
tBodyGyroJerk.mean...Z
tBodyGyroJerk.std...X 
tBodyGyroJerk.std...Y 
tBodyGyroJerk.std...Z 
tBodyAccMag.mean..    
tBodyAccMag.std..     
tGravityAccMag.mean.. 
tGravityAccMag.std..  
tBodyAccJerkMag.mean..
tBodyAccJerkMag.std.. 
tBodyGyroMag.mean..   
tBodyGyroMag.std..    
tBodyGyroJerkMag.mean..
tBodyGyroJerkMag.std..
fBodyAcc.mean...X     
fBodyAcc.mean...Y     
fBodyAcc.mean...Z     
fBodyAcc.std...X      
fBodyAcc.std...Y      
fBodyAcc.std...Z      
fBodyAcc.meanFreq...X 
fBodyAcc.meanFreq...Y 
fBodyAcc.meanFreq...Z 
fBodyAccJerk.mean...X 
fBodyAccJerk.mean...Y 
fBodyAccJerk.mean...Z 
fBodyAccJerk.std...X  
fBodyAccJerk.std...Y  
fBodyAccJerk.std...Z  
fBodyAccJerk.meanFreq...X
fBodyAccJerk.meanFreq...Y
fBodyAccJerk.meanFreq...Z
fBodyGyro.mean...X    
fBodyGyro.mean...Y    
fBodyGyro.mean...Z    
fBodyGyro.std...X     
fBodyGyro.std...Y     
fBodyGyro.std...Z     
fBodyGyro.meanFreq...X
fBodyGyro.meanFreq...Y
fBodyGyro.meanFreq...Z
fBodyAccMag.mean..  
fBodyAccMag.std..   
fBodyAccMag.meanFreq..        
fBodyBodyAccJerkMag.mean..    
fBodyBodyAccJerkMag.std..     
fBodyBodyAccJerkMag.meanFreq..
fBodyBodyGyroMag.mean..       
fBodyBodyGyroMag.std..        
fBodyBodyGyroMag.meanFreq..   
fBodyBodyGyroJerkMag.mean..   
fBodyBodyGyroJerkMag.std..    
fBodyBodyGyroJerkMag.meanFreq..
angle.tBodyAccMean.gravity.   
angle.tBodyAccJerkMean..gravityMean.
angle.tBodyGyroMean.gravityMean.    
angle.tBodyGyroJerkMean.gravityMean.
angle.X.gravityMean.
angle.Y.gravityMean.
angle.Z.gravityMean.

Transformations performed
 1. X_test.txt + Y_test.txt + subject_test.txt	are merged (length stays same but width increases)
 2. retain only the attributes having mean or std in the name
 3. X_train.txt + Y_train.txt + subject_train.txt	are merged (length stays same but width increases)
 4. retain only the attributes having mean or std in the name 
 5. Data from 4 previous steps is merged into new dataset (tsttrn)  (length increases but width stays the same)
 6. Activity attribute is changed into factor with descriptive labels
 7. Dataset is melted (2 dimensions activity+subject) 
 8. Mean is taken of all variables
 9. Dataset is casted to 180 row aggregated set per activity, subject
