# How the script works

## 1. Read data from X and add an id

This part reads as a table the "X_test.txt" (xtest table) and "X_train.txt" (xtrain table) and bind then in the
table "xunion". Finally, the "xcomplete" table adds a sequencial "id" and set this variable as the key.


## 2. Read data from Y and add an id

This part reads as a table the "y_test.txt" (ytest table) and "y_train.txt" (ytrain table) and bind then in the
table "yunion". Finally, the "ycomplete" table adds a sequencial "id", sets this variable as the key, and change the name 
of the "V1" for "ActCode"

## 3. Read data from subjects and add an id

This part reads as a table the "subject_test.txt" (testSubject table) and "subject_train.txt" (trainSubject table) and  
bind then in the table "subjectUnion". Finally, the "subjectComplete" table adds a sequencial "id", sets this variable 
as the key, and change the name of the "V1" for "Subject".

## 4. Read features and activity labels

This part reads as a table the "features.txt" (features table). Then read the "activity_labels.txt" (trainSubject table), 
changes the name of V1 for "ActCode" and "V2" for "Activity", and set the key "ActCode".

## 5. Join X, Y, subject and ID 

This part merge the tables "subjectComplete" and "ycomplete"; the result is merged with "xcomplete" and "Actcode" is 
selected as the key for this table. Finally, the last result is merge with "actLabels" and the final data base is called
"tabla"

## 6. Names of variables

This part assigns the variable names from the "features" table readed in part 4.

## 7. Extracts means and sd variables

This part extracts the mean and standard deviation variables of the database, making subsets "tabla", setting "id" as
the key and then merging the subsets with a table called "tablar"

## 8. Mean calculation by subject and activity

This part finally calculates the mean of each variable for each subject and each activity. The final table is saved as
a txt fil called "courseProject.txt".