# Set working directory to desired location
setwd("C:/Users/User/DataScience/Exploratory Data Analysis")

# import desired packages
library("reshape2")
library("dplyr")
library("data.table")
library("lubridate")

# read in selected data for the two dates required
power.data <- read.table("./Data/household_power_consumption.txt", header=FALSE, sep=";", 
                         skip=66637, nrow=(69517-66637))

# read in headers
header.power.data <- read.table("./Data/household_power_consumption.txt", header=TRUE, sep=";", 
                                nrow=1)
colnames(power.data) <- colnames(header.power.data)

# use lubridate to format dates easily
power.data$DateTime <- dmy_hms(paste(power.data$Date, power.data$Time))

## Now can create plots...
# Plot 4
png(filename = "./Assignment_1/plot4.png",width = 480, height = 480)
par(mfcol = c(2,2), mar = c(2, 4, 2, 1))
# first plot
plot(power.data$DateTime, power.data$Global_active_power, type = "l", 
     ylab = "Global Active Power (kilowatts)", xlab = "")
# second plot
plot(power.data$DateTime,power.data$Sub_metering_1 , type = "l", 
     ylab = "Energy sub metering", xlab = "")
lines(power.data$DateTime, power.data$Sub_metering_2, col = "red")
lines(power.data$DateTime, power.data$Sub_metering_3, col = "blue")
legend("topright", legend = colnames(power.data)[7:9], col = c("black", "red", "blue"), 
       lty = 1, cex = 0.8)
# third plot
plot(power.data$DateTime, power.data$Voltage, type = "l", 
     ylab = "Voltage", xlab = "")
# fourth plot
plot(power.data$DateTime, power.data$Global_reactive_power , type = "l", 
     ylab = "Global reactive power", xlab = "")
dev.off()
