## Create one R script called run_analysis.R that does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names.
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

require("plyr")
require("data.table")
require("reshape2")

# Load: activity labels and column names
activity_labels <- read.table("../UCI HAR Dataset/activity_labels.txt")

features <- read.table("../UCI HAR Dataset/features.txt", colClasses = c("character"))

test <- cbind(read.table("../UCI HAR Dataset/test/subject_test.txt"),
              read.table("../UCI HAR Dataset/test/y_test.txt"),
              read.table("../UCI HAR Dataset/test/x_test.txt"))

train <- cbind(read.table("../UCI HAR Dataset/train/subject_train.txt"),
              read.table("../UCI HAR Dataset/train/y_train.txt"),
              read.table("../UCI HAR Dataset/train/x_train.txt"))

merged_data <- rbind(test, train)

col_names <- c(c("subject", "activity.id"),features$V2)

names(merged_data) <- col_names

merged_data_extract <- merged_data[, grepl("subject|activity|mean|std", names(merged_data))]

merged_data_extract$activity.id <- activity_labels$V2[merged_data_extract$activity.id]

names(merged_data_extract) <- gsub('activity.id',"activity",names(merged_data_extract))
names(merged_data_extract) <- gsub('Acc',"Acceleration",names(merged_data_extract))
names(merged_data_extract) <- gsub('GyroJerk',"AngularAcceleration",names(merged_data_extract))
names(merged_data_extract) <- gsub('Gyro',"AngularSpeed",names(merged_data_extract))
names(merged_data_extract) <- gsub('Mag',"Magnitude",names(merged_data_extract))
names(merged_data_extract) <- gsub('^t',"TimeDomain.",names(merged_data_extract))
names(merged_data_extract) <- gsub('^f',"FrequencyDomain.",names(merged_data_extract))
names(merged_data_extract) <- gsub('\\.mean',".Mean",names(merged_data_extract))
names(merged_data_extract) <- gsub('\\.std',".StandardDeviation",names(merged_data_extract))
names(merged_data_extract) <- gsub('Freq\\.',"Frequency.",names(merged_data_extract))
names(merged_data_extract) <- gsub('Freq$',"Frequency",names(merged_data_extract))

merged_data_extract_avg = ddply(merged_data_extract, c("subject","activity"), numcolwise(mean))
write.table(merged_data_extract_avg, file = "tidy_data.txt")