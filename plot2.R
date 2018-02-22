plot2 <- function() {
  
  setwd("C:/Users/Sal/Documents/Coursera/Plotting")
  
  library(lubridate)
  
  data <- read.table("household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";")
  data <- na.omit(data)
  data$Date <- dmy(data$Date)
  data$Time <- hms(data$Time)
  
  data <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")
  data <- data.frame(data, DateTime = with(data, Date + Time))
  
  
  png(filename = "plot2.png")
  with(data, plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
  dev.off()
  
}