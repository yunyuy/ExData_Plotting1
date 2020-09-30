# load library
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

str(data_sub)


# plot 2
png("plot2.png",
    width = 480,
    height = 480)

plot(data_sub$Time_new, 
     data_sub$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()
     
