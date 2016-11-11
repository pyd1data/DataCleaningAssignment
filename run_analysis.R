#libraries
library(data.table)
loading=FALSE #loading parameter, if TRUE, the code load the Samsung dataset, 
#if FALSE, it assumes it is already in the working directory
#zip unzips by default in  /UCI HAR Dataset 
if (loading==TRUE){
url <- 'http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
download.file(url, 'Data.zip')
unzip('Data.zip')}
#TEST data reading
X_test <- fread("UCI HAR Dataset/test/X_test.txt") #X test
y_test <- fread("UCI HAR Dataset/test/y_test.txt") #X test
subject_test <- fread("UCI HAR Dataset/test/subject_test.txt") #X test
#TRAIN data reading
X_train <- fread("UCI HAR Dataset/train/X_train.txt") #X train
y_train <- fread("UCI HAR Dataset/train/y_train.txt") #X train
subject_train <- fread("UCI HAR Dataset/train/subject_train.txt") #X test
#Feature Names, activity labels reading
nom_data<-fread("UCI HAR Dataset/features.txt")
activity_data<-fread("UCI HAR Dataset/activity_labels.txt")
#Merge and convert to data.frame
features_all<-rbind(X_test,X_train)
features_all<-data.frame(features_all)
activity_all<-rbind(y_test,y_train)
activity_all<-data.frame(activity_all)
subject_all<-rbind(subject_test,subject_train)
subject_all<-data.frame(subject_all)
#Keeping only mean and std columns
nom_data<-data.frame(nom_data)
string_data<-nom_data[,2]
SGmean<-grep("mean()",string_data,fixed=TRUE)
SGstd<-grep("std()",string_data,fixed=TRUE)
data_interet_mean<-string_data[SGmean]
data_interet_std<-string_data[SGstd]
#rename with real feature names
colnames(features_all) <- string_data 
#select
features_select<-features_all[c(data_interet_mean,data_interet_std)]
#features_select_std<-features_all[data_interet_std]
#rename with real activity name
st<-lapply(activity_all,function(x){activity_data[x][[2]]})
#creation of an extented data frane with activity name and subject information for each row
features_select[,"activity"]<-st
features_select[,"subject"]<-subject_all
#aggregate variables as suggested, by  "subjects" and "activity"
features_select_tidy <- aggregate(features_select, by=list(features_select$subject,features_select$activity), FUN=mean)
#rename columns
features_select_tidy$activity <- NULL
features_select_tidy$subject <- NULL
names(features_select_tidy)[names(features_select_tidy) == 'Group.1'] <- 'subject'
names(features_select_tidy)[names(features_select_tidy) == 'Group.2'] <- 'activity'
#write results
write.table(features_select_tidy,'TidyData.txt',row.names = FALSE)

