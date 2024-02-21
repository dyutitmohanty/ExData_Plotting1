data3 <- data

data3$DateTime <- as.POSIXct(paste(data3$Date, data3$Time), format = "%Y-%m-%d %H:%M:%S")

png("plot3.png", width=480, height = 480)

plot(data3$DateTime, data3$Sub_metering_1, type="l", xaxt="n", ylab="Energy Sub metering", xlab="")
lines(data3$DateTime, data3$Sub_metering_2, type="l", xaxt="n", ylab="", xlab="", col="red")
lines(data3$DateTime, data3$Sub_metering_3, type="l", xaxt="n", ylab="", xlab="", col="blue")

axis(1, at=c(min(data2$DateTime), median(data2$DateTime), max(data2$DateTime)), labels=c("Thu", "Fri", "Sat"))

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)

dev.off()