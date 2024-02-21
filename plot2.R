data2 <- data

data2$DateTime <- as.POSIXct(paste(data2$Date, data2$Time), format="%Y-%m-%d %H:%M:%S")

png("plot2.png", width=480, height = 480)

plot(data2$DateTime ,data2$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="", xaxt="n")

axis(1, at=c(min(data2$DateTime), median(data2$DateTime), max(data2$DateTime)), labels=c("Thu", "Fri", "Sat"))

dev.off()
