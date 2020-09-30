#load library
library(tidyverse)

# load dataset
data <- utils::read.table("household_power_consumption.txt",
                          head = T,
                          # nrows = 3,
                          sep = ";",
                          na.strings = "?")

data_sub <- data %>% 
        filter(Date %in% c("1/2/2007", "2/2/2007"))

# Find the day of a week
data_sub <- data_sub %>% 
        mutate(Days = weekdays(as.Date(Date,"%d/%m/%Y")), # Find the day of a week
               Time_new = strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S")) # convert time


# plot 3

png("plot3.png",
    width = 480,
    height = 480)


plot(data_sub$Time_new, data_sub$Sub_metering_1, type = "l",
     ylab = "Energy sub metering",
     xlab = "")
lines(data_sub$Time_new, data_sub$Sub_metering_2, col = "red")
lines(data_sub$Time_new, data_sub$Sub_metering_3, col = "blue")
legend("topright",
       lty = 1,
       col = c("black", "blue", "red"),
       legend = c("Sub_metering_1",
                  "Sub_metering_2",
                  "Sub_metering_3"))

dev.off()
