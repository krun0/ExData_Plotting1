# Script to construct the plot2 of Exploratory Data Analyses 
# Project 1. Saves the plot to a PNG file with a width of 480 pixels
# and a height of 480 pixels
# Link to detailed description of the project:
# https://github.com/rdpeng/ExData_Plotting1

# read in the household power consumption data
# get the header information first
header <- read.table("household_power_consumption.txt",header=TRUE,sep=";",nrows=1)

# get the type of all data columns - helps to read the data from the file quicker 
classes <- sapply(header, class)

# read only the subset (2 days worth) of data required for the plot
df <- read.table("household_power_consumption.txt",sep=";",skip=66637,nrows=2879,colClasses = classes)

# append column names
colnames(df)=colnames(header)

# construct datetime column from date and time string data that is needed in plots
df$datetime <- strptime(paste(df$Date,df$Time,sep = " "),format="%d/%m/%Y %H:%M:%S")

# Construct plot as a .png file
png(file="plot2.png",width=480,height=480)
with(df,plot(datetime,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))
dev.off() # disconnect device
     