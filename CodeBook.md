
## CodeBook

This is a code book that describes the variables, the data, and any transformations or work performed to create a tidy data set


## The data source

    Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
    
    Original description of the dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
    
    
The data is collected from experiments carried out with a group of 30 volunteers within an age bracket of 19-48 years. Six activities are performed by each participant wearing a smartphone (Samsung Galaxy S II) on the waist: walking, walking upstairs, walking downstairs, sitting, standing, and laying. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. 
    
The obtained data set has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

## Data Set Information


The dataset includes the following files:

    README.txt

    features_info.txt - Information about the variables used on the feature vector.

    features.txt- List of all features.

    activity_labels.txt - Links the class labels with their activity name.

    train/X_train.txt - Training data set.

    train/y_train.txt - Training data set labels.

    test/X_test.txt - Test data set.

    test/y_test.txt - Test data set labels.



## Data Transfomation 

run_analysis.R script processes the raw data sets to create a tidy data set by doing the following:

    1. Test and training data are merged to obtain a single data set (CombData). Variables are labelled with the names assigned by original collectors
    2. Extract only the values of estimated mean and standard deviation from the merged data set and store it in an intermediary data set (meanstdonly)
    3. Add a new column to the intermediary data set with the activity description. 
    4. Label the intermediary data set with with descriptive activity names.
    5. From the intermediary data set, final tidy data set (meanbygroup) is created where numeric variables are averaged for each activity and each subject



