# Assignment:Exploratory Data analysis Project Assignment 1
# 
# Author: Amitrishit
###############################################################################
#
#Project Sescription:
#Refer Loading_data.R for more detail located in the same repository

################################################################################
#                                                                              #
#                          R code for Plot -1                                  #
#                                                                              #
################################################################################

#load required libraries if it is not there

library(grDevices)
library(graphics)

#setting up the working directory

wd<-getwd()
newd<-"Exploratory_DataAnalysis"
if(!file.exists(file.path(wd, newd))& !grepl(newd,wd)){
  dir.create(file.path(wd, newd))
  setwd(file.path(wd, newd))
}else {
  print("directory already exist")
}

#loading data

source("Loading_data.R")

#plot histogram for Global_active_powermain

plot1_filename <- paste(getwd(), "/plot1.png", sep = "")
if(!file.exists(plot1_filename)){
  png("plot1.png", width = 480, height = 480,type = "cairo")
  hist(Data_To_plot$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")
  dev.off()
} else {
  hist(Data_To_plot$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")
}