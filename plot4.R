source("load_data.R")

#load the data from the file
#The file is already in the Working Directory
power <- load_data("household_power_consumption.txt")

png(filename = "plot4.png", 
    width = 480, height = 480,
    units = "px", bg = "transparent")

#The time column has been modified to have datetime 
#through the load_data call

#We need 4 graphs on the same sheet here!!
par(mfrow = c(2, 2))

## Top-left
plot(power$Time, power$Global_active_power, 
     type = "l",
     xlab = "", ylab = "Global Active Power")

## Top-right
plot(power$Time, power$Voltage,
     type = "l",
     xlab = "datetime", ylab = "Voltage")

## Bottom-left
ylimits = range(c(power$Sub_metering_1, power$Sub_metering_2, power$Sub_metering_3))

plot(power$Time, power$Sub_metering_1, 
     type = "l",
     col = "black",
     xlab = "", ylab = "Energy sub metering",
     ylim = ylimits)

par(new = TRUE)
lines(power$Time, power$Sub_metering_2, col = "red")

par(new = TRUE)
lines(power$Time, power$Sub_metering_3, col = "blue")

# Remove the border of legend here.
legend("topright", 
       col = c("black", "red", "blue"),
       bty = "n",
       lty = c(1,1,1),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 1)

## Bottom-right
plot(power$Time, power$Global_reactive_power, 
     type = "l",
     col = "black",
     xlab = "datetime", ylab = "Global_reactive_power")

dev.off()