# Getting-Cleaning-Data-Course-Project

## CodeBook

### Data

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

### Variables

For each record it is provided:

* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.

### Cleaning & tranforming the data into a tidy dataset

* getting the lookup table for activity names (read.table)
* getting the lookup table for feature names (read.table)

* getting test data: subject list then activity list then data set (read.table)
* getting train data: subject list then activity list then data set (read.table)

* putting together a full test dataset (cbind)
* putting together a full train dataset (cbind)
* putting together train and test datasets (rbind)

* Appropriately labeling the data set with descriptive variable names (from features.txt)

* Extracting only the measurements on the mean and standard deviation (grepl)

* Replacing activity numbers by activity names (from activity_labels.txt, using merge)

* Creating final tidy dataset (aggregate)

* Creating text file with tody dataset (write.table)
