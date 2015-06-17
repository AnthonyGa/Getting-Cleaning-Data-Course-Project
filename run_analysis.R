## You should create one R script called run_analysis.R that does the following. 
## Merges the training and the test sets to create one data set.
## Extracts only the measurements on the mean and standard deviation for each measurement. 
## Uses descriptive activity names to name the activities in the data set
## Appropriately labels the data set with descriptive variable names. 
## From the data set in step 4, creates a second, independent tidy data set 
## with the average of each variable for each activity and each subject.

## getting the lookup table for activity names
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt",stringsAsFactors=FALSE)

## getting the lookup table for feature names
features <- read.table("./UCI HAR Dataset/features.txt",stringsAsFactors=FALSE)

## getting test data: subject list then activity list then data set
test_subjects <-read.table("./UCI HAR Dataset/test/subject_test.txt")
test_labels <-read.table("./UCI HAR Dataset/test/y_test.txt")
test_set <-read.table("./UCI HAR Dataset/test/X_test.txt")

## getting train data: subject list then activity list then data set
train_subjects <-read.table("./UCI HAR Dataset/train/subject_train.txt")
train_labels <-read.table("./UCI HAR Dataset/train/y_train.txt")
train_set <-read.table("./UCI HAR Dataset/train/X_train.txt")

## putting together a full test dataset:
test_full <-cbind(test_labels,test_subjects,test_set)

## putting together a full train dataset:
train_full <-cbind(train_labels,train_subjects,train_set)

## putting together train and test datasets:
all_full <- rbind(test_full,train_full)


## Appropriately labeling the data set with descriptive variable names
names(all_full)<-c("Activity","Subject",features[,2])

## Extracting only the measurements on the mean and standard deviation:
all_names<- names(all_full)
name_condition<-"mean()|std()"
good<-grepl(name_condition,all_names)
good_names<-all_names[good]
good_names<-c("Activity","Subject",good_names)
extract <- all_full[,good_names,drop=FALSE]

## Replacing activity numbers by activity names:
activity_num <- extract[,1,drop=FALSE]
activity_name<- merge(activity_num,activity_labels,by.x="Activity",by.y="V1",all=TRUE,sort=FALSE)
extract[,1]<-activity_name[,2]

## Creating final tidy dataset:
tidy_extract<-aggregate(. ~Activity+Subject, extract, mean)

## Creating text file with tody dataset:
write.table(tidy_extract,"./tidydataset.txt", row.name=FALSE)







