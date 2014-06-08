
setwd("/Users/michael/Documents/r/coursera/ExploratoryDataAnalysis/ExData_Plotting1")

par(mfrow = c(1,1))

power <- read.table("/Users/michael/Documents/r/coursera/ExploratoryDataAnalysis/household_power_consumption.txt", 
	header = TRUE, sep = ";", na.strings = "?", 
	colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

power$DateTime <- as.POSIXct(paste(power$Date, power$Time), format="%d/%m/%Y %H:%M:%S")
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")

powerslice = subset(power, power$Date == as.Date(c("02/01/2007"), format = "%m/%d/%Y")  |
    power$Date == as.Date(c("02/02/2007"), format = "%m/%d/%Y"))

#Plot 4 

png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
with(powerslice, {

	plot(powerslice$DateTime, powerslice$Global_active_power, type = "n", ylab = "Global Active Power", xlab = " ")
	lines(powerslice$DateTime, powerslice$Global_active_power)

	plot(powerslice$DateTime, powerslice$Voltage, type = "n", ylab = "Voltage", xlab = "datetime")
	lines(powerslice$DateTime, powerslice$Voltage)

	plot(powerslice$DateTime, powerslice$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = " ")
    with(powerslice, lines(powerslice$DateTime, powerslice$Sub_metering_1))
    with(powerslice, lines(powerslice$DateTime, powerslice$Sub_metering_2, col = "red"))
    with(powerslice, lines(powerslice$DateTime, powerslice$Sub_metering_3, col = "blue"))
    legend("topright", col = c("black", "red", "blue"), lwd = c(1,1,1), bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

	plot(powerslice$DateTime, powerslice$Global_reactive_power, type = "n", ylab = "Global_reactive_power", xlab = "datetime")
	lines(powerslice$DateTime, powerslice$Global_reactive_power)
	
	})
dev.off()