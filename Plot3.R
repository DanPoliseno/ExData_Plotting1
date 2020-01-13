setwd("C:\\Users\\xeneg\\Downloads\\exdata_data_household_power_consumption")
library("data.table")

rm(list = ls())
dtf <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

dtf$Date <- as.Date(dtf$Date, format = "%d/%m/%Y")

dtf <- subset(dtf, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

dtf$dateTime <- strptime(paste(dtf$Date, dtf$Time), "%Y-%m-%d %H:%M:%S")
dtf$dateTime <- as.POSIXct(dtf$dateTime)
attach(dtf)

dev.copy(png, file = "plot3.png", height = 480, width = 480)

plot(Sub_metering_1 ~ datetime, type = "l", xlab = "", ylab = "Energy sub metering")
lines(Sub_metering_2 ~ datetime, col = "red")
lines(Sub_metering_3 ~ datetime, col = "blue")
legend("topright" 
       , col=c("black","red","blue") 
       , c("Sub_metering_1 ", "Sub_metering_2 ", "Sub_metering_3  ")
       , lty=c(1,1), lwd=c(1,1))  

dev.off()
detach(dtf)
