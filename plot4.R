data_total <- read.csv("household_power_consumption.txt", sep = ";", header=TRUE)
data_total$Date <- as.Date(data_total$Date, format = "%d/%m/%Y")
data_subset <- subset(data_total, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
data4 <- data_subset



data4$DateTime <- as.POSIXct(paste(data4$Date, data4$Time), format = "%Y-%m-%d %H:%M:%S")

png("plot4.png", width=480, height=480)

par(mfcol=c(2,2))

plot(data4$DateTime, data4$Global_active_power, type="l", ylab="Global Active Power", xlab="", xaxt="n")
axis(1, at=c(min(data2$DateTime), median(data2$DateTime), max(data2$DateTime)), labels=c("Thu", "Fri", "Sat"))

plot(data4$DateTime, data4$Sub_metering_1, type="l", ylab="Energy Sub metering", xlab="", xaxt="n")
lines(data4$DateTime, data4$Sub_metering_2, type="l", xaxt="n", ylab="", xlab="", col="red")
lines(data4$DateTime, data4$Sub_metering_3, type="l", xaxt="n", ylab="", xlab="", col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, cex=0.6)
axis(1, at=c(min(data2$DateTime), median(data2$DateTime), max(data2$DateTime)), labels=c("Thu", "Fri", "Sat"))

plot(data4$DateTime, data4$Voltage, type="l", xlab="datetime", ylab="Voltage", xaxt="n")
axis(1, at=c(min(data2$DateTime), median(data2$DateTime), max(data2$DateTime)), labels=c("Thu", "Fri", "Sat"))

plot(data4$DateTime, data4$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power", xaxt="n")
axis(1, at=c(min(data2$DateTime), median(data2$DateTime), max(data2$DateTime)), labels=c("Thu", "Fri", "Sat"))

dev.off()