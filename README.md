Getting and Cleaning Data - Course Project
====

Setup
----
The "UCI HAR Dataset" zip file must already be downloaded and unzipped in the same directory as the "run_analysis.R" script.
The script will check for the existence of the "UCI HAR Dataset" directory and will stop if not found.
The script has been tested from within the RStudio environment. Execution with Rscript was attempted but exited with memory errors.

Execution
----
From within an RStudio session, you can run the following to execute the script.

	source("run_analysis.R")

Runtime for me is approximately 5 minutes.

The script will create a "data" directory if it doesn't already exist.
It will write the resultant tidy file to "data/tidy.txt".
The file can be read back in with the following command:

	verify <- read.table("data/tidy.txt", sep=" ", headers=TRUE)

Project Instructions
----
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names. 
- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Decisions/Reasoning
----
For #2 above, I extracted every column that had "mean" or "std" in the name.
I reasoned that in general, a downstream process can ignore data it doesn't need easier than it can add it back in.
For that reason it would be better to take the most expansive interpretation of the instructions.

For #4, I used the contents of "UCI HAR Dataset/features.txt" file as the base for my descriptive labels.
I applied a series of transformations to each label to make it more clear what each column was.
All abbreviated terms were expanded (eg, "t" became "time", "Acc" became "Accelerometer", and "std" became "StdDev") and
all punctuation (ie, parentheses and hyphens) were removed.
This process was done at step #1 when merging all the data together.

Data
----
See the codebook for details on the input and output data.

