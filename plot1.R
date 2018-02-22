plot1 <- function() {
  
  setwd("C:/Users/Sal/Documents/Coursera/Plotting")
  
  library(lubridate)
  
  data <- read.table("household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";")
  data <- na.omit(data)
  data$Date <- dmy(data$Date)
  data$Time <- hms(data$Time)
  
  data <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")
  
  png(filename = "plot1.png")
  hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)")
  dev.off()
  
}