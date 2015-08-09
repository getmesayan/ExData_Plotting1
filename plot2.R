source("load_data.R")

#load the data from the file
#The file is already in the Working Directory
power <- load_data("household_power_consumption.txt")

png(filename = "plot2.png",
    width = 480, height = 480, 
    units = "px", bg = "transparent")

#The time column has been modified to have datetime 
#through the load_data call

plot(power$Time, power$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()