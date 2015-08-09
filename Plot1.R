# Knowing and setting directory
getwd()
setwd("C:/Users/Ravi/Documents/R")

# Getting data
getdata <- read.csv("household_power_consumption.txt",
header = T, sep = ';',na.strings = "?",
nrows = 2075259, check.names = F, stringsAsFactors = F, 
comment.char ="", quote = '\"')

getdata$Date <- as.Date(getdata$Date,format="%d/%m/%Y")

## Subsetting the data

data1 <- subset(getdata,subset=(Date >="2007-02-01" & Date <="2007-02-02"))

## Converting the Date & Time Variables

datetime <- paste(as.Date(data1$Date),data1$Time)
data1$Datetime <- as.POSIXct(datetime)

## Plot 1

hist(data1$Global_active_power,main = "Global Active Power",
     ylab="Frequency",xlab="Global Active Power(kilowatts)", col ='Red')

## Saving to file

dev.copy(png,file="plot1.png", height=480, width=480)
dev.off()












