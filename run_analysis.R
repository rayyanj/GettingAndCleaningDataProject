# Working directory is expected to have the folder containing the data
# folder "UCI HAR Dataset".

library(readr)
library(dplyr)

# run_analysis does the following:
# - Merges the training and the test sets to create one data set.
# - Extracts only the measurements on the mean and standard deviation for each measurement. 
# - Uses descriptive activity names to name the activities in the data set
# - Appropriately labels the data set with descriptive variable names. 
# - From the data set in step 4, creates a second, independent tidy data set
# with the average of each variable for each activity and each subject.
run_analysis <- function() {

        # Set "UCI HAR Dataset" as working directory to avoid prefixing every
        # path with that.
        oldwd = getwd()        
        if (file.exists("UCI HAR Dataset")) {
                setwd("UCI HAR Dataset")
        } else {
                stop("Working directory expected to have UCI HAR Dataset folder in it.")
        }
        
        message("Step 1: Merge training and test sets to create one data set")
        dataset_folders <- c("test", "train")

        allData <- data.frame()
        for (folder in dataset_folders) {                
                message(paste0("Reading ",folder," data"))

                # The format of the measurements file name is:
                # {test|train}/X_{test|train}.txt
                measurementsFile <- paste0(folder, "/X_", folder, ".txt")
                
                # Using read_fwf instead of read.fwf because it"s much faster
                # Manual inspection shows that dataset has 561 columns each
                # of width 16.
                measurements <- read_fwf(measurementsFile,
                                         col_positions = fwf_widths(rep(16,561)))

                # The format of the activity file name is:
                # {test|train}/Y_{test|train}.txt
                activityFile <- paste0(folder, "/Y_", folder, ".txt")
                activity <- read.csv(activityFile, sep=" ", header=F,
                                    colClasses="integer", col.names=c("activity"))

                # The format of the subject file name is:
                # subject_{test|train}.txt
                personFile <- paste0(folder, "/subject_", folder, ".txt")
                person <- read.csv(personFile, header=F, colClasses="numeric",
                                   col.names="person")
                
                # Combine measurements, activity labels and subject labels
                # in one comprehensive dataset
                data <- cbind(measurements, activity, person)
                
                # Label whether the data was training data or test data
                # in a new datagroup column. This step is not strictly needed
                # for purposes of this assignment, but in general it's a good
                # practice when preparing tidy data. It can be handy
                # in case we want to filter/aggregate based on whether
                # it's training data or test data.
                data <- mutate(data, datagroup = folder)
                
                # Combine both train and test data to one allData dataset.
                allData <- rbind(allData, data)
        }
        
        allData$datagroup <- factor(allData$datagroup)
        
        message("Step 2: Extracting measurements on mean & standard deviation.")
        
        # Read the features in a dataframe with two columns:
        # first column is index of the feature (integer)
        # second column is the name of the feature (character)
        featureData <- read.csv("features.txt", sep=" ", header=F,
                               colClasses = c("integer", "character"),
                               col.names = c("index", "name") )        
        
        # Extract the indices of mean and standard deviation around all
        # measurements (in both time and frequency domains).
        # Note: the question wasn't clear whether to limit the mean measurements
        # in any way. Given that all the measurements could be relevant
        # I decided to include all mean and std related measurements.
        meanIndices <- featureData[grep("mean", tolower(featureData$name), fixed=T),"index"]
        stdIndices <- featureData[grep("std", tolower(featureData$name), fixed=T),"index"]
        
        # The last two indices are the ones we added at the end after all 
        # mean and std measurement features are: the activity and person.
        activityIndex <- nrow(featureData) + 1
        personIndex <- activityIndex + 1
        
        # Extract the data we're interested in and give the columns meaningful
        # names
        tidyFeatureIndices <- c(meanIndices, stdIndices, activityIndex, personIndex)
        tidyFeatureNames <- c(featureData[c(meanIndices, stdIndices),"name"], 
                              "activity", "person")
        
        tidyData <- allData[,tidyFeatureIndices]

        message("Step 4: Labeling the data set with descriptive variable names.")
        names(tidyData) <- tidyFeatureNames
        
        message("Step 3: Using descriptive activity names to name activities")
        activityMapping <- read.csv("activity_labels.txt", sep=" ",
                                   colClasses=c("integer","character"),
                                   col.names=c("level", "label"), header=F)
        
        # Convert activity column into a factor
        tidyData$activity <- factor(tidyData$activity,
                                    levels=activityMapping$level,
                                    labels=activityMapping$label)
        
        # Convert person column into a factor as well
        tidyData$person <- factor(tidyData$person)
                
        message("Step 5: Creating a second, independent tidy data set with average of each variable for each activity and each subject.")        
        summaryTidyData <- tidyData %>% group_by(activity,person) %>% summarise_each(funs(mean))
        
        setwd(oldwd)
        
        message("Finally, saving summary tidy data to summary_tidy_data.txt.")
        write.table(summaryTidyData, "summary_tidy_data.txt", row.name=F)
        
        summaryTidyData
}