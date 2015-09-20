# Getting and Cleaning Data Project
Project assignment for Getting and Cleaning Data Coursera Course

# Main analysis script
Main analysis script is found in the main folder: "run_analysis.R"

To reproduce running the analysis, do the following steps:
1. Copy the "UCI HAR Dataset" folder, given in the project assignment into 
   the same folder as "run_analysis.R"
2. Set the folder containing "run_analysis.R" script as working directory.
3. Source the script by running source("run_analysis.R")'
4. Run the script by calling the method and assigning result to result variable:
   tidyData = run_analysis()

# Overview of the raw dataset
For description of all the features and activities including in the raw dataset,
see the raw files inside "UCI HAR Dataset" folder.
Analysis makes extensive use of the following data files:
* raw measurements: (test|train)/X_{test|train}.txt
* raw activity labels: (test|train)/subject_(test|train).txt
* feature mapping: (test|train)/features.txt

# Code book of the resulting tidy dataset
* Tidy dataset contains 180 rows and 88 columns, in wide tidy form:
* Each row summarizes all mean and std measurements for each
subject for each activity by taking the average.
* We have 30 subjects and 6 levels, hence 30 * 6 = 180 rows.
* The first column of the tidy dataset has the activity factor (e.g. WALKING, WALKING_UPSTAIRS, etc.)
* The second column of the tidy dataset has the person factor (subject).
* The remaining 86 columns (columns 3 throuh 88) contain numeric averages for mean and std measurements for
corresponding activity and person. I list them below for completeness:

For additional information about those variables, see "features_info.txt" file inside the "UCI HAR Dataset"
folder.

[3] "tBodyAcc-mean()-X"                   
[4] "tBodyAcc-mean()-Y"                   
[5] "tBodyAcc-mean()-Z"                   
[6] "tGravityAcc-mean()-X"                
[7] "tGravityAcc-mean()-Y"                
[8] "tGravityAcc-mean()-Z"                
[9] "tBodyAccJerk-mean()-X"               
[10] "tBodyAccJerk-mean()-Y"               
[11] "tBodyAccJerk-mean()-Z"               
[12] "tBodyGyro-mean()-X"                  
[13] "tBodyGyro-mean()-Y"                  
[14] "tBodyGyro-mean()-Z"                  
[15] "tBodyGyroJerk-mean()-X"              
[16] "tBodyGyroJerk-mean()-Y"              
[17] "tBodyGyroJerk-mean()-Z"              
[18] "tBodyAccMag-mean()"                  
[19] "tGravityAccMag-mean()"               
[20] "tBodyAccJerkMag-mean()"              
[21] "tBodyGyroMag-mean()"                 
[22] "tBodyGyroJerkMag-mean()"             
[23] "fBodyAcc-mean()-X"                   
[24] "fBodyAcc-mean()-Y"                   
[25] "fBodyAcc-mean()-Z"                   
[26] "fBodyAcc-meanFreq()-X"               
[27] "fBodyAcc-meanFreq()-Y"               
[28] "fBodyAcc-meanFreq()-Z"               
[29] "fBodyAccJerk-mean()-X"               
[30] "fBodyAccJerk-mean()-Y"               
[31] "fBodyAccJerk-mean()-Z"               
[32] "fBodyAccJerk-meanFreq()-X"           
[33] "fBodyAccJerk-meanFreq()-Y"           
[34] "fBodyAccJerk-meanFreq()-Z"           
[35] "fBodyGyro-mean()-X"                  
[36] "fBodyGyro-mean()-Y"                  
[37] "fBodyGyro-mean()-Z"                  
[38] "fBodyGyro-meanFreq()-X"              
[39] "fBodyGyro-meanFreq()-Y"              
[40] "fBodyGyro-meanFreq()-Z"              
[41] "fBodyAccMag-mean()"                  
[42] "fBodyAccMag-meanFreq()"              
[43] "fBodyBodyAccJerkMag-mean()"          
[44] "fBodyBodyAccJerkMag-meanFreq()"      
[45] "fBodyBodyGyroMag-mean()"             
[46] "fBodyBodyGyroMag-meanFreq()"         
[47] "fBodyBodyGyroJerkMag-mean()"         
[48] "fBodyBodyGyroJerkMag-meanFreq()"     
[49] "angle(tBodyAccMean,gravity)"         
[50] "angle(tBodyAccJerkMean),gravityMean)"
[51] "angle(tBodyGyroMean,gravityMean)"    
[52] "angle(tBodyGyroJerkMean,gravityMean)"
[53] "angle(X,gravityMean)"                
[54] "angle(Y,gravityMean)"                
[55] "angle(Z,gravityMean)"                
[56] "tBodyAcc-std()-X"                    
[57] "tBodyAcc-std()-Y"                    
[58] "tBodyAcc-std()-Z"                    
[59] "tGravityAcc-std()-X"                 
[60] "tGravityAcc-std()-Y"                 
[61] "tGravityAcc-std()-Z"                 
[62] "tBodyAccJerk-std()-X"                
[63] "tBodyAccJerk-std()-Y"                
[64] "tBodyAccJerk-std()-Z"                
[65] "tBodyGyro-std()-X"                   
[66] "tBodyGyro-std()-Y"                   
[67] "tBodyGyro-std()-Z"                   
[68] "tBodyGyroJerk-std()-X"               
[69] "tBodyGyroJerk-std()-Y"               
[70] "tBodyGyroJerk-std()-Z"               
[71] "tBodyAccMag-std()"                   
[72] "tGravityAccMag-std()"                
[73] "tBodyAccJerkMag-std()"               
[74] "tBodyGyroMag-std()"                  
[75] "tBodyGyroJerkMag-std()"              
[76] "fBodyAcc-std()-X"                    
[77] "fBodyAcc-std()-Y"                    
[78] "fBodyAcc-std()-Z"                    
[79] "fBodyAccJerk-std()-X"                
[80] "fBodyAccJerk-std()-Y"                
[81] "fBodyAccJerk-std()-Z"                
[82] "fBodyGyro-std()-X"                   
[83] "fBodyGyro-std()-Y"                   
[84] "fBodyGyro-std()-Z"                   
[85] "fBodyAccMag-std()"                   
[86] "fBodyBodyAccJerkMag-std()"           
[87] "fBodyBodyGyroMag-std()"              
[88] "fBodyBodyGyroJerkMag-std()"

