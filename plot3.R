setwd("/Users/apple/Desktop")
file <- read.csv("household_power_consumption.txt", header = T, sep = ';', stringsAsFactors = F, na.strings="?", nrows = 2075259)
data <- subset (file, Date %in% c("1/2/2007", "2/2/2007"))
library(lubridate)
datetime <- dmy_hms(paste(data$Date, data$Time))
data$Datetime <- datetime
with(data, {plot(Sub_metering_1~Datetime, type = "l", ylab="Energy sub metering", xlab="") 
    lines(Sub_metering_2~Datetime, type = "l", col = "Red")
    lines(Sub_metering_3~Datetime, type = "l", col = "Blue")})
legend("topright", lty = 1, lwd = 2, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
png("plot3.png", width = 480, height = 480)
dev.off()
