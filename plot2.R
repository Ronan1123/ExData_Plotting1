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
## Plot 2
plot(power.data$DateTime, power.data$Global_active_power, type = "l", 
     ylab = "Global Active Power (kilowatts)", xlab = "")
dev.copy(png, file = "./Assignment_1/plot2.png")
dev.off()
