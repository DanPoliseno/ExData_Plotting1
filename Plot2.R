setwd("C:\\Users\\xeneg\\Downloads\\exdata_data_household_power_consumption")

rm(list = ls())
dtf <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

dtf$Date <- as.Date(dtf$Date, format = "%d/%m/%Y")

dtf <- subset(dtf, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

dtf$dateTime <- strptime(paste(dtf$Date, dtf$Time), "%Y-%m-%d %H:%M:%S")
dtf$dateTime <- as.POSIXct(dtf$dateTime)
attach(dtf)

dev.copy(png, file = "plot2.png", height = 480, width = 480)

plot(Global_active_power ~ dateTime, type = "l",
     ylab = "Global Active Power (Kilowatts)", xlab = "")
     
dev.off()
detach(dtf)
