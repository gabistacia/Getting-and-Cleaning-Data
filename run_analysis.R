library(dplyr)

##Reading all the data
subjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
XTest <- read.table("./UCI HAR Dataset/test/X_test.txt")
YTest <- read.table("./UCI HAR Dataset/test/y_test.txt")
subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
XTrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
YTrain <- read.table("./UCI HAR Dataset/train/Y_train.txt")

featureList <- read.table("./UCI HAR Dataset/features.txt")
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")

##Rename columns for the activitylabels data set to use the marge function more easily 
activityLabels <- rename(activityLabels,ActivityId=V1,Activity=V2)

############### Test Data ##############

##Renaming the columns using the feature list
names(XTest) = featureList$V2
##Adding the Subject Test column
XTest$SubjectTest <- subjectTest$V1
##Adding the Activity id column
XTest$ActivityId <- YTest$V1

##joining test data with activity labels
XTestData <- merge(XTest,activityLabels,by="ActivityId",all=TRUE)

############### Train Data ##############
##Renaming the columns using the feature list
names(XTrain) = featureList$V2
##Adding the Subject Test column
XTrain$SubjectTest <- subjectTrain$V1
##Adding the Activity id column
XTrain$ActivityId <- YTrain$V1

##joining test data with activity labels
XTrainData <- merge(XTrain,activityLabels,by="ActivityId",all=TRUE)

############### Merged Data ##############
MergedData <- rbind(XTestData,XTrainData)

##Gets all columns containing mean and std, plus the Subject Test and Activity columns
MeanAndStdColumns <- grep("(mean)|(std)|(SubjectTest)|(Activity)",columnNames,value = TRUE)

##Subsets the data
MeanAndStdData <- MergedData[,MeanAndStdColumns]

##Creates a copy of the data
copyData <- MeanAndStdData 
##Groups the data by SubjectTest and Activity
grouped <- group_by(copyData,SubjectTest,Activity)
##Gets average of all columns by SubjectTest and Activity
MeanAndStdData_AvgBySubjectAndActivity <- summarise_all(grouped,funs(mean))

#write.table(MeanAndStdData_AvgBySubjectAndActivity,file="./UCI HAR Dataset/MeanAndStdData_AvgBySubjectAndActivity.txt",row.name=FALSE)
