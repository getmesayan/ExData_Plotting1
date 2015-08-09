source("load_data.R")

#load the data from the file
#The file is already in the Working Directory
power <- load_data("household_power_consumption.txt")


png(filename = "plot1.png",
    width = 480, height = 480, 
    units = "px", bg = "transparent")

hist(power$Global_active_power,col = "red", main = "Global Active Power",
     xlab='Global Active Power (kilowatts)',
     breaks = 12, ylim = c(0, 1200))

dev.off()
