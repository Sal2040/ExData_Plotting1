plot4 <- function() {
  
  setwd("C:/Users/Sal/Documents/Coursera/Plotting")
  
  library(lubridate)
  
  data <- read.table("household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";")
  data <- na.omit(data)
  data$Date <- dmy(data$Date)
  data$Time <- hms(data$Time)
  
  data <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")
  data <- data.frame(data, DateTime = with(data, Date + Time))
  
  png(filename = "plot4.png")
  
  par(mfrow = c(2,2))
  with(data, 
 {plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
  plot(DateTime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
  plot(DateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", col = "black")
  lines(DateTime, Sub_metering_2, type = "l", col = "red")
  lines(DateTime, Sub_metering_3, type = "l", col = "blue")
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), 
         lty = 1, cex = 0.8, bty = "n")
  plot(DateTime, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")})
  
  dev.off()
  
}