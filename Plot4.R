setwd("C:\\Users\\xeneg\\Downloads\\exdata_data_household_power_consumption")
library("data.table")

rm(list = ls())
dtf <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

dtf$Date <- as.Date(dtf$Date, format = "%d/%m/%Y")

dtf <- subset(dtf, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

dtf$dateTime <- strptime(paste(dtf$Date, dtf$Time), "%Y-%m-%d %H:%M:%S")
dtf$dateTime <- as.POSIXct(dtf$dateTime)
attach(dtf)

dev.copy(png, file = "plot4.png", height = 480, width = 480)

par(mfrow = c(2, 2))

#Plot 1
plot(Global_active_power ~ datetime, type = "l", ylab = "Global Active Power", 
     xlab = "")

#Plot 2
plot(Voltage ~ datetime, type = "l")

#Plot 3
plot(Sub_metering_1 ~ datetime, type = "l", ylab = "Energy sub metering", xlab = "")
lines(Sub_metering_2 ~ datetime, col = "Red")
lines(Sub_metering_3 ~ datetime, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = "n")
       
#Plot 4
plot(Global_reactive_power ~ datetime, type = "l")

dev.off()
detach(dtf)
