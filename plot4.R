# Assignment:Exploratory Data analysis Project Assignment 1
# 
# Author: Amitrishit
###############################################################################
#
#Project Sescription:
#Refer Loading_data.R for more detail located in the same repository

################################################################################
#                                                                              #
#                          R code for Plot -4                                  #
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

plot4 <- paste(getwd(), "/graficos/plot4.png", sep = "")
if(!file.exists(plot4)){
  png("plot4.png", width = 480, height = 480,type = "cairo")
  par(mfrow=c(2,2))	
  plot(Data_To_plot$Time, Data_To_plot$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
  plot(Data_To_plot$Time, Data_To_plot$Voltage, type = "l", xlab = "datetime", ylab = "Global Active Power")
  plot(Data_To_plot$Time, Data_To_plot$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
  lines(Data_To_plot$Time, Data_To_plot$Sub_metering_2, type="l", col="red")
  lines(Data_To_plot$Time, Data_To_plot$Sub_metering_3, type="l", col="blue")
  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2, col=c("black", "red", "blue"))
  plot(Data_To_plot$Time, Data_To_plot$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global Active Power")
  dev.off()
} else {
  par(mfrow=c(2,2))	
  plot(Data_To_plot$Time, Data_To_plot$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
  plot(Data_To_plot$Time, Data_To_plot$Voltage, type = "l", xlab = "datetime", ylab = "Global Active Power")
  plot(Data_To_plot$Time, Data_To_plot$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
  lines(Data_To_plot$Time, Data_To_plot$Sub_metering_2, type="l", col="red")
  lines(Data_To_plot$Time, Data_To_plot$Sub_metering_3, type="l", col="blue")
  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2, col=c("black", "red", "blue"))
  plot(Data_To_plot$Time, Data_To_plot$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global Active Power")
}