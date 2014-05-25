CodeBook 
=========

This codebook provides information of variables, data, transformations used in this project.

The project includes two tidy data sets : data1.txt, data2.txt

The following describes the details of data1.txt.

1. Variables
The project uses only the variables which contains the mean, standard deviation of datasets.
The variable names shows the content of each variables, and the number of the variables is 81.

 1) subject : The number of specific subject participating the experiments
 2) data : consists of 79 variables which show mean and standard deviation data of raw data
 3) activities : The labels represent the activities of each measurement

2. Data
 1) data1.txt is the dataset with 10299 rows and 81 columns

3. Transformations
 1) Merge the 6 files into one dataset, using 'cbind', 'rbind' functions
 2) Extract variables which have mean and standard deviation data, using 'grep' function
 3) Replace the integer labels into string labels
 4) Label the variables, using 'names' function

The following describes the details of data2.txt.

1. Variables
The project uses only the variables which contains the mean, standard deviation of datasets.
The variable names shows the content of each variables, and the number of the variables is 81.

 1) subject : The number of specific subject participating the experiments
 2) data : consists of 79 variables which show mean and standard deviation data of raw data
 3) activities : The labels represent the activities of each measurement

2. Data
 1) data2.txt is the dataset with 180 rows and 81 columns

3. Transformations
 1) Subsetting the data which has certain subject number and labels
 2) Calculate the column means with subset data


