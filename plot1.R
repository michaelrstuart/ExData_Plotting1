
setwd("/Users/michael/Documents/r/coursera/ExploratoryDataAnalysis/ExData_Plotting1")

par(mfrow = c(1,1))

power <- read.table("/Users/michael/Documents/r/coursera/ExploratoryDataAnalysis/household_power_consumption.txt", 
	header = TRUE, sep = ";", na.strings = "?", 
	colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

power$DateTime <- as.POSIXct(paste(power$Date, power$Time), format="%d/%m/%Y %H:%M:%S")
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")

powerslice = subset(power, power$Date == as.Date(c("02/01/2007"), format = "%m/%d/%Y")  |
    power$Date == as.Date(c("02/02/2007"), format = "%m/%d/%Y"))

# Plot 1 

png(filename = "plot1.png", width = 480, height = 480)
hist(powerslice$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
