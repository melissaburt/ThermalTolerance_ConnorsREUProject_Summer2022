#Drybath Practice Trials

#Description: The following code is for visualization and analysis of data
#collected by Bailey Connors during practice trials for measuring CTmax on
#the drybath. 

#Code written by: Melissa Burt


#Load these packages:
library(dplyr)
library(lme4)
library(ggplot2)

#Set working directory - this defaults to where I have the project files 
#stored on my computer (MAB)
getwd()

#Load datasets
CTmaxtemp<-read.csv("DrybathTrial_Connors_CTmaxtemp_forR.csv")

DrybathTempIncreases<-read.csv("DrybathTrial_Connors_drybathtime_temp_forR.csv")
str(DrybathTempIncreases) #check to make sure R is reading in variables correctly

#Need to get R to read time correctly


