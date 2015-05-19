#Introduction
The script run_analysis.r performs the 5 steps described in the course project's definition.

First, all the similar data is merged using the rbind() function. By similar, we address those files having the same number of columns and referring to the same entities.
Then, only those columns with the mean and standard deviation measures are taken from the whole dataset. After extracting these columns, they are given the correct names, taken from features.txt.
As activity data is addressed with values 1:6, we take the activity names and IDs from activity_labels.txt and they are substituted in the dataset.
On the whole dataset, those columns with vague column names are corrected.
Finally, we generate a new dataset with all the average measures for each subject and activity type (30 subjects * 6 activities = 180 rows). The output file is called averages_data.txt, and uploaded to this repository.
Variables
train_set, train_activity, test_set, test_activity, train_sub and test_sub contain the data from the downloaded files.
data_set, data_activity and data_sub merge the previous datasets to further analysis.
set_names contains the correct names for the data_set dataset, which are applied to the column names stored in mean_and_std_features, a numeric vector used to extract the desired data.
A similar approach is taken with activity names through the activities variable.
Data merges data_set, data_activity and data_sub in a big dataset.
Finally, Data_Tidy contains the relevant averages which will be later stored in a .txt file. 