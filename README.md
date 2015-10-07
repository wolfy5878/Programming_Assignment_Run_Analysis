# Getting and Cleaning Data: Course Project

##Introduction

This repository contains the files and program I created for the Coursera course "Getting and Cleaning Data" (offered in 
September of 2015) through Johns Hopkins University as part of the Data Science Specialization Track. 

##About The assignment
Text detailing the assignment:

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 
<ul>
<li>a tidy data set as described below, 
<li>a link to a Github repository with your script for performing the analysis, and 
<li>a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 
</ul>
You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 

A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

You should create one R script called run_analysis.R that does the following.
<ol>
	<li> Merges the training and the test sets to create one data set.</li>
	<li> Extracts only the measurements on the mean and standard deviation for each measurement.</li>
	<li> Uses descriptive activity names to name the activities in the data set.</li>
	<li> Appropriately labels the data set with descriptive variable names.</li>
	<li> From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.</li>
</ol>
##About The Raw Data
There were several individual files provided covering the raw data however not all of them are useful for the assignment parameters. Outlined below is an explaination of what is pertinent to this assignment. 

The observation data collected are arranged into four data files: Of the total population collected, 70% of the data are partitioned into the "training" data sets and 30% of the data are partitioned into the "test" data sets. For each of the training and test data sets there are additional data files providing the activity codes performed for each observation and the subject performing them. Listed below are the observation data related files:
<ul>
  <li>X_train.txt - 70% of the data observations</li>
  <li>y_train.txt - activity codes for each training observation</li>
  <li>subject_train.txt - subject performing each activity of the training observations</li>
  <li>X_test.txt - 30% of the data observations</li>
  <li>y_test.txt - activity codes for each test observation</li>
  <li>subject_test.txt - subject performing each activity of the test observations</li>
</ul>

Additionally, there are data files provided for the activity names and the feature labels. These files cover both the training and the test data sets.
<ul>
  <li>activity_labels.txt - decodes for the activity codes provided in the data sets above</li>
  <li>features.txt - column names for the datat sets provided above</li>
</ul>

More information about the raw data can be found in the README.txt and features_info.txt provided with the raw data set.

##About The Approach & Tidy Dataset
I like to have my program scripts set everything I need and isolate the working files into clean directories automatically. In addition, I like to compile large data sets and then extract what I need/want from that larger compiled dataset as needed. This approach allows me to easily add columns or rows as desired without having to repeat steps needed to go back to the beginning and compile the desired columns or rows.

Following this philosophy, the below steps outline the approach taken in the program analysis_R written as my submission. Additionally, I have more detailed steps commented out in the program itself.
<ol>
  <li>Download and prepare workspace and data for assignment</li>
  <ol>
    <li>Load necessary packages in order needed, in this assignment I only used dplyr package</li>
    <li>Read in the source file, unzip files into clean subdirectory within the working directory, & set the new working directory</li>
    <li>Organize each file data into program variables for script reference & clean up features text</li>
    <li>Relabel the columns on datasets using the features text, "activity", and "subject"</li>
    </ol>
  <li>Execute the assignment steps
  <ol>
    <li>Merge the training and the test sets to create one data set with labels and headers.</li>
    <li>Extract only the measurements on the mean and standard deviation for each measurement.</li>
    <li>Use descriptive activity names to name the activities in the data set</li>
    <li>Appropriately label the data set with descriptive variable names (done in preparation steps above)</li>
    <li>From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.</li>
    </ol>
  <li>Show tidy data table
  </ol>
The script will output a wide tidy dataset into a tab-delimited file called TidyDataJLR.txt, which can also be found in this repository. More information about the data in the Tidy Dataset can be found in the Code Book (in this repository).

