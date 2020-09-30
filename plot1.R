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

# plot 1
png("plot1.png",
    width = 480,
    height = 480)

hist(data_sub$Global_active_power, 
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylim = c(0, 1200))

dev.off()
