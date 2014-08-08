# Script to construct the plot4 of Exploratory Data Analyses 
# Project 1. This is a compounded plot of four charts. Saves 
# the plot to a PNG file with a width of 480 pixels
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
png(file="plot4.png",width=480,height=480)

par(mfrow=c(2,2)) # plot 4 charts in the same canvas (2 rows by 2 columns)
# line chart of gobal active powers over 2 day period
with(df,plot(datetime,Global_active_power,type="l",xlab="",ylab="Global Active Power"))

# line chart of Voltage over two day period
with(df,plot(datetime,Voltage,type="l"))     

# Line chart of Energy sub meterings over two day period
# initialise plot area and draw sub_metering_1 energy over 2 days period
with(df,plot(datetime,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))
# add sub_metering_2 to the plot
with(df,lines(datetime,Sub_metering_2,col="red"))
# add sub_metering_3 to the plot
with(df,lines(datetime,Sub_metering_3,col="blue"))
# add legend
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),col=c("black","red","blue"),bty="n")

# line chart of global reactive power over two day period
with(df,plot(datetime,Global_reactive_power,type="l"))
dev.off() # disconnect device