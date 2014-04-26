# Name:	run_analysis.R
# Author : Harry Koch
#
# Objective:
# You should create one R script called run_analysis.R that does the following. 
#	1.	Merges the training and the test sets to create one data set.
#	2.	Extracts only the measurements on the mean and standard deviation for each measurement. 
#	3.	Uses descriptive activity names to name the activities in the data set
#	4.	Appropriately labels the data set with descriptive activity names. 
#	5.	Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
#
#
# Preparation activities
#
# - install required packages: assumed is that package reshape2 is installed
# - the dataset is assumed to be downloaded and unzipped to your local machine
#   (it can be downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
# - set the working directory of R to the directory holding the datafiles 
#   for example if you unzipped to /volume1/test then this is also to be set as
#   the working directory
#
# This part of the script is an example for the preparation activities
# install.packages("reshape2")			# Incase the package is not installed
setwd("./OneDrive/UCI HAR Dataset")		# Change this location to your data location
library(reshape2)						# Load the library

#=========================================================================
# Read the files into respective data frames:
# - features.txt contains the names of the 561 attributes stored
# - activty_label.txt contains the names and codes of the activities
#
# As we're only interested in attributes of mean and std deviation these
# features are read into vector vecCol. With the use of this vector we 
# need not worry about the exact position of attributes in the feature-
# vector.
#=========================================================================
features<-read.table("./features.txt",as.is=TRUE)	# Names of the 561 attributes
activity<-read.table("./activity_labels.txt")	# Names of the 6 activities
vecCol<-grep("[Mm]ean|std",features$V2)			# Create a vector containing mean or std in the name

#=========================================================================
# Read the datafiles for the Test group
# 1. X_test.txt			The 561 attributes vector for all the observations
# 2. Y_test.txt			The activities performed vector for all the observations
# 3. subject_test.txt	Who performed the activities vector for all the observations
#
# After reading and naming the intermediate variables the end variable
# tst will hold the result of combining the 3 datasets.
# The intermediate variables are removed from memory after they served 
# their purpose
#=========================================================================
tst_x<-read.table("./test/X_test.txt",col.names=features$V2)	# 561 attributen vector: test include the names of the features as column names
tst_y<-read.table("./test/Y_test.txt")	# Contains the activities performed
tst_sub<-read.table("./test/subject_test.txt") # Who performed the activities
colnames(tst_sub)<-"Subject"
colnames(tst_y)<-"Activity"
tst_x<-tst_x[,vecCol]	# Only the variables dealing with mean and stddev, remove the rest
tst<-cbind(tst_sub,tst_y,tst_x)			# Merge the three sets into one
rm(tst_x)								# Release
rm(tst_y)								# Release
rm(tst_sub)								# Release

#=========================================================================
# Similar to the test group the processing and naming takes place for the
# training group.
# After reading and naming the intermediate variables the end variable
# trn will hold the result of combining the 3 datasets.
# The intermediate variables are removed from memory after they served 
# their purpose
#=========================================================================
trn_x<-read.table("./train/X_train.txt",col.names=features$V2)	# 561 attributen vector: train include the names of the features as column names
trn_y<-read.table("./train/Y_train.txt")
trn_sub<-read.table("./train/subject_train.txt")
colnames(trn_sub)<-"Subject"
colnames(trn_y)<-"Activity"
trn_x<-trn_x[,vecCol]	# Only the variables dealing with mean and stddev, remove the rest
trn<-cbind(trn_sub,trn_y,trn_x)			# Merge the three sets into one
rm(trn_x)								# Release
rm(trn_y)								# Release
rm(trn_sub)								# Release

#=========================================================================
# The 2 dataframes tst and trn are now combined into a new dataframes
# called tsttrn.
# The intermediate variables tst and trn are removed from memory after
# they served their purpose
#=========================================================================
tsttrn<-rbind(tst,trn)					# Add the rows of tst and trn to one new variable
rm(tst)									# Release tst
rm(trn)									# Release trn

#=========================================================================
# Make the activity codes more understandable by changing it into a factor
# variable that holds the codes as well as the required labels
#=========================================================================
tsttrn$Activity <- factor(tsttrn$Activity,levels=activity$V1,labels=activity$V2) # Make the labels of the activity better understandable

#=========================================================================
# Reshape the data frame
#=========================================================================
tidy<-melt(tsttrn,id.vars=c("Activity","Subject"))
tidy2<-dcast(tidy, Activity + Subject ~ variable, mean)
rm(tidy)

#=========================================================================
# Export the resulting dataset to the output directory into file tidy2
#=========================================================================
if(!file.exists("output")) {dir.create("output")}
fileUrl <- "./output/tidy2.csv" 
write.csv(tidy2, fileUrl, row.names=FALSE)
#rm(tidy2)
