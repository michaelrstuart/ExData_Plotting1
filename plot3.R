
setwd("/Users/michael/Documents/r/coursera/ExploratoryDataAnalysis/ExData_Plotting1")

power <- read.table("/Users/michael/Documents/r/coursera/ExploratoryDataAnalysis/household_power_consumption.txt", 
	header = TRUE, sep = ";", na.strings = "?", 
	colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

power$DateTime <- as.POSIXct(paste(power$Date, power$Time), format="%d/%m/%Y %H:%M:%S")
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")

powerslice = subset(power, power$Date == as.Date(c("02/01/2007"), format = "%m/%d/%Y")  |
    power$Date == as.Date(c("02/02/2007"), format = "%m/%d/%Y"))

# Plot 3 

png(filename = "plot3.png", width = 480, height = 480)
plot(powerslice$DateTime, powerslice$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = " ")
with(powerslice, lines(powerslice$DateTime, powerslice$Sub_metering_1))
with(powerslice, lines(powerslice$DateTime, powerslice$Sub_metering_2, col = "red"))
with(powerslice, lines(powerslice$DateTime, powerslice$Sub_metering_3, col = "blue"))
legend("topright", col = c("black", "red", "blue"), lwd = c(1,1,1), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
