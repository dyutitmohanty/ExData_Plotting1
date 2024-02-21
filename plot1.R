data_full <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE)

head(data_full)
summary(data_full)

data_full$Date <- as.Date(data_full$Date, format = "%d/%m/%Y")

data <- subset(data_full, Date >= as.Date("2007-02-01") & Date <= ("2007-02-02"))

data$Global_active_power <- as.numeric(data$Global_active_power)

png("plot1.png", width=480, height = 480)

hist(data$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")

dev.off()