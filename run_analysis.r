train_set <- read.table ("./UCI HAR Dataset/train/X_train.txt" , header = F)
train_activity <- read.table ("./UCI HAR Dataset/train/y_train.txt" , header = F)
train_sub <- read.table ("./UCI HAR Dataset/train/subject_train.txt" , header = F)
test_set <- read.table ("./UCI HAR Dataset/test/X_test.txt" , header = F)
test_activity <- read.table ("./UCI HAR Dataset/test/y_test.txt" , header = F)
test_sub <- read.table ("./UCI HAR Dataset/test/subject_test.txt")

#Merging Train and Test
data_set <- rbind (train_set , test_set)
data_activity <- rbind (train_activity , test_activity)
data_sub <- rbind (train_sub , test_sub)

#Naming Columns
set_names <- read.table ("./UCI HAR Dataset//features.txt" , header = F)
names (data_set) <- set_names$V2
names(data_activity) <- c("Activity")
names (data_sub) <- c("Subject")
#Merging Columns

Data<- cbind (data_set , data_activity , data_sub)

#Selectable Indexes
col_select <- c(grep("mean//(//)|std//(//)" , set_names$V2),562 ,563)
data_select <- Data[,col_select]

#Properly Naming Columns
names(Data)<-gsub("^t", "time", names(Data))
names(Data)<-gsub("^f", "frequency", names(Data))
names(Data)<-gsub("Acc", "Accelerometer", names(Data))
names(Data)<-gsub("Gyro", "Gyroscope", names(Data))
names(Data)<-gsub("Mag", "Magnitude", names(Data))
names(Data)<-gsub("BodyBody", "Body", names(Data))

#Activity Names
activity_lab <- read.table ("./UCI HAR Dataset/activity_labels.txt", header = F)
Data$Activity <- factor(Data$Activity , labels = activity_lab$V2)

#Summarizing to get Tidy Data
Data_Tidy <- aggregate (.~Activity + Subject , Data , mean)
Data_Tidy <- arrange(Data_Tidy ,Subject , Activity )
write.table (Data_Tidy , "./TidyData.txt" , row.names = F)
