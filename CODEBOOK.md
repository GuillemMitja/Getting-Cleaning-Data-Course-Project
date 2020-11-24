First I have read all the diferent data files using the data.table package.

The data of test and train has been merged into one set.

Only the mean and std have been left in the file by selecting the appropiate columns. 

Then, the data column names have been taken from the features and added to the data.

Finaly, the data has been gruped and summarized for the final results (using dply group_by and summarize) and writen using write.table 


