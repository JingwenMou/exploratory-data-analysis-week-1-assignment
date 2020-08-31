setwd("/Users/apple/Desktop")
file <- read.csv("household_power_consumption.txt", header = T, sep = ';', stringsAsFactors = F, na.strings="?", nrows = 2075259)
data <- subset (file, Date %in% c("1/2/2007", "2/2/2007"))
library(lubridate)
datetime <- dmy_hms(paste(data$Date, data$Time))
data$Datetime <- datetime
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data, {
    plot(Global_active_power ~ Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
    plot(Voltage ~ Datetime, type="l", ylab="Voltage", xlab="datetime")
    plot(Sub_metering_1~Datetime, type = "l", ylab="Energy sub metering", xlab="") 
      lines(Sub_metering_2~Datetime, type = "l", col = "Red")
      lines(Sub_metering_3~Datetime, type = "l", col = "Blue")
      legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, bty="n",
             legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power ~ Datetime, type="l", ylab="Global_reactive_power", xlab="datetime")})
png("plot4.png", width = 480, height = 480)
dev.off()



