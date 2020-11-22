##Run analysis
library(dplyr)
##read all files
feature <- read.table("features.txt")
a_label <- read.table("activity_labels.txt")
x_test <- read.table("X_test.txt")
y_test <- read.table("y_test.txt")
s_test <- read.table("subject_test.txt")

x_train <- read.table("X_train.txt")
y_train <- read.table("y_train.txt")
s_train <- read.table("subject_train.txt")

## 1- merge test and data
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
s_data <- rbind(s_train, s_test)

## 2- Extract only mean and standard deviation
x_data <- x_data[,1:6]
colnames(x_data) <- feature$V2[1:6]
## merge subjects, data and activities
x_data <- cbind(s_data, x_data, y_data)

## 3- Use descriptive activity names
## 4 - Appropiately label the data with desciptive variable names
colnames(x_data)[1] <- "subject" 
colnames(x_data)[2] <- "avgX" 
colnames(x_data)[3] <- "avgY" 
colnames(x_data)[4] <- "avgZ" 
colnames(x_data)[5] <- "stdX" 
colnames(x_data)[6] <- "stdY" 
colnames(x_data)[7] <- "stdZ" 
colnames(x_data)[8] <- "activity" 


x_data$activity <- factor(x_data$activity, levels = a_label$V1, labels = a_label$V2)

## 5 generate data with average of each subject and activity

Sumarized_data <- x_data %>% group_by(subject, activity) %>% summarise(avgX = mean(avgX),avgY = mean(avgY),
                                                                       avgZ = mean(avgZ),stdX = mean(stdX),
                                                                       stdY = mean(stdY),stdZ = mean(stdZ))

write.csv(x_data,"tidyData.txt")
write.csv(Sumarized_data,"Summary.txt")




