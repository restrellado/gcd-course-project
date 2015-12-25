###About This Analysis
Running the R script contained in the file **run_analysis.R** will clean the raw
data from the Samsung Galaxy fitness experiment and generate a tidy dataset
that has mean values for each combination of subject, activity, and
measurement. The script was written using R version 3.2.2, Fire Safety. It
requires the **dplyr** and **tidyr** packages to run.

You'll need to have the raw data downloaded from the following link in your 
working directory in order for the script to work:

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

###Method for Cleaning the Data
The following steps were taken to clean and transform the raw data. More
details and a description of the variables are in the **CodeBook.md** file.

1. Added activity and subject columns to the training and test datasets
2. Combined the training and test datasets
3. Extracted only the mean and standard deviation measurements
4. Replaced numeric values for "activity" with labels from the 
**activity_labels.txt** file included in the raw data
5. Edited the measurement titles to a cleaner naming convention
6. Stacked the measurement variables into one column named "type"