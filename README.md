# Getting-and-Cleaning-Data
Repository containing the assignment for the Getting and Cleaning Data course 

# run_analysis.R
Contains all the steps to transform the Samsung data into a tidy data
The Samsung data must be in your working directory
dplyr package needs to be installed before running this file 
The transformation steps are as follows:
1. Read the X, Y, Subjects, Feauture and activity labels files
2. Rename columns for the activitylabels data set to use the marge function more easily in steps 3.4 and 4.4
3. Transform Test Data
  3.1 Renaming the columns using the feature list
  3.2 Add the Subject Test column
  3.3 Add the Activity id column
  3.4 Join the test data with activity labels to add the Activity column
4. Transform Train Data
  4.1 Renaming the columns using the feature list
  4.2 Add the Subject Test column
  4.3 Add the Activity id column
  4.4 Join the train data with activity labels to add the Activity column
5. Merge Train and Test data sets
6. Find all the column names containing the word 'mean' or 'std' using regular expressions
7. Subsets the data kepping only the columns found on step 6
8. Creates a copy of the data
9. Groups the data by SubjectTest and Activity
10. Gets average of all columns by SubjectTest and Activity
