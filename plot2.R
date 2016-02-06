# Assignment:Exploratory Data analysis Project Assignment 1
# 
# Author: Amitrishit
###############################################################################
#
#Project Sescription:
#Refer Loading_data.R for more detail located in the same repository

################################################################################
#                                                                              #
#                          R code for Plot -2                                  #
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


plot2_filename <- paste(getwd(), "/plot2.png", sep = "")
if(!file.exists(plot2_filename)){
  png("plot2.png", width = 480, height = 480,type = "cairo")
  plot(Data_To_plot$Time, Data_To_plot$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
  dev.off()
} else {
  plot(Data_To_plot$Time, Data_To_plot$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
}