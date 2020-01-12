setwd("C:\\Users\\xeneg\\Downloads\\exdata_data_household_power_consumption")

rm(list = ls())
dtf <- read.table("household_power_consumption.txt", header = T, 
                   sep = ";", na.strings = "?")

dtf[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

# Change Date Column to Date Type
dtf[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

# Filter Dates for 2007-02-01 and 2007-02-02
dtf <- dtf[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

dev.copy(png, file = "plot1.png", height = 480, width = 480)

hist(dtf[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (Kilowatts)", ylab="Frequency", col="Red")

dev.off()
detach(dtf)   