##Load necessary packages
library(dplyr)

#Read in source file, unzip files into clean subdirectory within wd, set to new wd
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl,destfile = "./HARdata.zip")           #creator uses windows 8 
unzip("./HARdata.zip",exdir = ".")
setwd("./UCI HAR Dataset")

#Organize each file data into program variables for script reference
train <- read.table("./train/X_train.txt")                  #Training raw data (7352*561)
train_act <- read.table("./train/y_train.txt")              #Training activities (7352)
train_subj <- read.table("./train/subject_train.txt")       #Training subject values (7352)

test <- read.table("./test/X_test.txt")                     #Testing raw data (2947*561)
test_act <- read.table("./test/y_test.txt")                 #Testing activities (2947)
test_subj <- read.table("./test/subject_test.txt")          #Testing subject values (2947)

features <- read.table("features.txt")                      #Features list = col headers (561)
data_head <- gsub("\\()","",features$V2)                    #cleans up characters in the header row & creates vector (#4)

act_label <- read.table("activity_labels.txt")              #row activity descriptions (6)
act_label <- act_label$V2                                   #converted the dataframe to a factor of activity labels for later use
act_label <- tolower(act_label)                             #removes upper cases
act_label <- sub("_"," ",act_label)                         #removes underscores

#relabel the columns on datasets
names(train) <- data_head                                   #adds header row to training df
names(test) <- data_head                                    #adds header row to testing df
names(train_act) <- "activity"                              #gives name to training labels column
names(test_act) <- "activity"                               #gives name to test labels column
names(train_subj) <- "subject"                              #gives name to training subject column
names(test_subj) <- "subject"                               #gives name to test subject column

##1: Merges the training and the test sets to create one data set with labels and headers.
train1 <- cbind(train_act, train_subj, train)               #adds training labels column to training df
test1 <-  cbind(test_act, test_subj, test)                  #adds testing labels column to testing df
comb_data <- rbind(train1,test1)                            #combines train and test data sets with header (10299*563)

##2: Extracts only the measurements on the mean and standard deviation for each measurement.
DF1 <- comb_data[,1:2]                                      #extracts activity and subject columns
DF2 <- comb_data[,grep("mean|std",names(comb_data))]        #extracts mean and std columns
des_data <- cbind(DF1, DF2)                                 #combines into df of desired columns

##3: Uses descriptive activity names to name the activities in the data set
des_data$activity <- plyr::mapvalues(des_data$activity,         
                                from = levels(factor(des_data$activity)), 
                                to = act_label)             #uses factor to replace activity codes with values

##4: Appropriately labels the data set with descriptive variable names
     ##Done in preping of data

##5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidy_data <- group_by(des_data, activity,subject) %>% summarise_each(c("mean")) #creates wide tidy data table

##show tidy data table
write.table(tidy_data,"./TidyDataJLR.txt",row.name=FALSE)


