setwd("C:/R/Getting Data")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "run_analysis.zip")
unzip("run_analysis.zip")

#Load the train & test data and combine the data into one.
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

#Merges the training and the test sets to create one data set.
train <- cbind(subject_train, X_train, y_train)
test <- cbind(subject_test, X_test, y_test)
total <- rbind(train, test)

#Extracts only the measurements on the mean and standard deviation for each measurement.
features <- read.table("./UCI HAR Dataset/features.txt",stringsAsFactors=FALSE)
index <- c(grep("mean",features[,2]),grep("std",features[,2]))
index <- sort(index)
extractData <- total[,c(1,index+1,563)]

#Uses descriptive activity names to name the activities in the data set
activity_label <- read.table("./UCI HAR Dataset/activity_labels.txt")

for(i in 1:nrow(extractData)){
  for(j in 1:nrow(activity_label))
  {
    if(extractData[i,ncol(extractData)] == activity_label[j,1]){
      extractData[i,ncol(extractData)] = as.character(activity_label[j,2])          
    } 
  }  
}

#Appropriately labels the data set with descriptive activity names.
names <- c("subject",features[index,2],"activities")
names <- gsub("-","",names)
names(extractData) <- names

write.table(extractData,"data1.txt")

#Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
nSubject <- length(unique(extractData$subject))
nActivities <- length(unique(extractData$activities))

subjectList <- sort((unique(extractData$subject)))
activityList <- sort((unique(extractData$activities)))

meanData <- NULL
temp <- NULL

for(i in subjectList){
  for(j in activityList){
    subDt <- subset(extractData, extractData$subject ==i & extractData$activities==j)
    meanData <- rbind(meanData,c(subject=i,colMeans(subDt[,2:80]),activity=j))
  }  
}

write.table(meanData,"data2.txt")
