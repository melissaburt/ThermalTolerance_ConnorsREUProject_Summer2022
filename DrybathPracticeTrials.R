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
DrybathTempIncreases$TimeTempIncreased_formatedasTime<-NA
DrybathTempIncreases$TimeTempIncreased_formatedasTime<-strptime(DrybathTempIncreases$TimeTempIncreased, 
                                                                format = "%H:%M")

DrybathTempIncreases$TimeTempReached_formatedasTime<-NA
DrybathTempIncreases$TimeTempReached_formatedasTime<-strptime(DrybathTempIncreases$TimeTempReached, 
                                                                format = "%H:%M")
plot(DrybathTempIncreases$TimeTempIncreased_formatedasTime, DrybathTempIncreases$TimeTempReached_formatedasTime)
#Currently plots data point after 1PM as a 1AM time point because time needs to be entered as military time. 


#CTmax histogram
hist(CTmaxtemp$CTmaxTemp_C)

#Temperature versus time
#Temp of dry bath
plot(DrybathTempIncreases$TimeTempIncreased_formatedasTime, DrybathTempIncreases$ThermometerTemp_C)
plot(DrybathTempIncreases$TimeTempReached_formatedasTime, DrybathTempIncreases$ThermometerTemp_C)
#Temp as measured by the thermometer. 


plot(DrybathTempIncreases$DryBathTemp_C, DrybathTempIncreases$ThermometerTemp_C)

RealTempvsDrybathTemp_lm<-lm(data = DrybathTempIncreases,
                             DryBathTemp_C ~ ThermometerTemp_C)
plot(RealTempvsDrybathTemp_lm)
hist(residuals(RealTempvsDrybathTemp_lm))

summary(RealTempvsDrybathTemp_lm)
