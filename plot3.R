source("load_data.R")

#load the data from the file
#The file is already in the Working Directory
power <- load_data("household_power_consumption.txt")

png(filename = "plot3.png", 
    width = 480, height = 480,
    units = "px", bg = "transparent")
#The time column has been modified to have datetime 
#through the load_data call

#Sub_metering_1 vs Time
plot(power$Time, power$Sub_metering_1, 
     type = "l",
     col = "black",
     xlab = "", ylab = "Energy sub metering")

#Sub_metering_2 vs Time
lines(power$Time, power$Sub_metering_2, col = "red")

#Sub_metering_3 vs Time
lines(power$Time, power$Sub_metering_3, col = "blue")

#legend
legend("topright", 
       col = c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 1)
dev.off()