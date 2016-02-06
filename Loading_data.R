# Assignment:Exploratory Data analysis Project Assignment 1
# 
# Author: Amitrishit
###############################################################################
#
#Project Sescription:
#This assignment uses data from the UC Irvine Machine Learning Repository, a popular repository
#for machine learning datasets. In particular, we will be using the "Individual household electric
#power consumption Data Set" which I have made available on the course web site:
#Dataset: Electric power consumption [20Mb]
#Description: Measurements of electric power consumption in one household with a one-minute
#sampling rate over a period of almost 4 years. Different electrical quantities and some
#sub-metering values are available.
#The following descriptions of the 9 variables in the dataset are taken from the UCI web site:
#1.Date: Date in format dd/mm/yyyy
#2.Time: time in format hh:mm:ss
#3.Global_active_power: household global minute-averaged active power (in kilowatt)
#4.Global_active_power: household global minute-averaged active power (in kilowatt)
#5.Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
#6.Voltage: minute-averaged voltage (in volt)
#7.Global_intensity: household global minute-averaged current intensity (in ampere)
#8.Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds
#to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not
#electric but gas powered).
#9.Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds
#to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
#Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to
#an electric water-heaterand an air-conditioner.
###########################################################################################################
#What to do
##Loading the data
#When loading the dataset into R, please consider the following:
# - The dataset has 2,075,259 rows and 9 columns. First calculate a rough estimate of how much memory
#the dataset will require in memory before reading into R. Make sure your computer has enough memory
#(most modern computers should be fine).
#- We will only be using data from the dates 2007-02-01 and 2007-02-02. 
#One alternative is to read the data from just those dates rather than reading in the entire dataset
#and subsetting to those dates.
#- You may find it useful to convert the Date and Time variables to Date/Time classes in R 
#using the strptime() and as.Date() functions.
#- Note that in this dataset missing values are coded as ?
###Making Plots
#Our overall goal here is simply to examine how household energy usage varies over a 2-day period
#in February, 2007. Your task is to reconstruct the following plots below, all of which were 
#constructed using the base plotting system.
#First you will need to fork and clone the following GitHub repository: 
#https://github.com/rdpeng/ExData_Plotting1
#For each plot you should
# - Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 
#480 pixels.
# - Name each of the plot files as plot1.png, plot2.png, etc.
# - Create a separate R code file (plot1.R, plot2.R, etc.) that constructs the corresponding plot,
#i.e. code in plot1.R constructs the plot1.png plot. Your code file should include code for reading
#the data so that the plot can be fully reproduced. You should also include the code that creates
#the PNG file.
# - Add the PNG file and R code file to your git repository
#When you are finished with the assignment, push your git repository to GitHub so that
#the GitHub version of your repository is up to date. There should be four PNG files and
#four R code files.
###################################################################################################
#setting up the working directory

wd<-getwd()
newd<-"Exploratory_DataAnalysis"
if(!file.exists(file.path(wd, newd))& !grepl(newd,wd)){
dir.create(file.path(wd,newd))
setwd(file.path(wd,newd))
}else {
  print("directory already exist")
}

#Code below will Download data from site described in project description

library(httr) 
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
file <- "exdata-data-household_power_consumption.zip"
if(!file.exists(file)){
  print("downloading the file")
  download.file(url, file)
} else {
  print("file already exist")
}

#Code below will unzip and create folders for storing data for project

foldername<- "exdata-data-household_power_consumption"
if(!file.exists(foldername)){
  print("unzipping the file")
  unzip(file, list = FALSE, overwrite = TRUE)
} else {
  print("folder already exist")
}

# function below will read txt files as table and perform following: 
# convert the Date and Time variables to Date/Time 
# classes in R using the strptime() and as.Date() functions.covnert that into data.frame
# filter data with dataset missing values which are coded here as "?"
# creating subset using data from the dates 2007-02-01 and 2007-02-02.
# finally to write subset data as a single R object to a file, and to restore it.

filename_plot<- paste(getwd(), "/Data_To_plot.rds", sep = "")
if(!file.exists(filename_plot)){
  data <- paste(foldername,"/household_power_consumption.txt",sep ="")
  Data_To_plot <- read.table(data, header=TRUE, sep=";", colClasses=c("character", "character", rep("numeric",7)), na="?")
  Data_To_plot$Time <- strptime(paste(Data_To_plot$Date, Data_To_plot$Time), "%d/%m/%Y %H:%M:%S")
  Data_To_plot$Date <- as.Date(Data_To_plot$Date, "%d/%m/%Y")
  fetch_req_data <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
  Data_To_plot <- subset(Data_To_plot, Date %in% fetch_req_data)
  saveRDS(Data_To_plot, filename_plot)
} else {
  Data_To_plot <- readRDS(filename_plot)
}

