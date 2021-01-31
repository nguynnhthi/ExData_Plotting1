library(dplyr)
# Read input file
data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
# Subset 
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
# Convert date and time to a datetime variable
data <- mutate(data, Datetime = paste(Date, Time, sep = " "))
data <- mutate(data, Datetime = strptime(Datetime, format = "%d/%m/%Y %H:%M:%S"))
# Convert variable types
data <- mutate(data, Global_active_power = as.numeric(Global_active_power))
data <- mutate(data, Global_reactive_power = as.numeric(Global_reactive_power))
data <- mutate(data, Voltage = as.numeric(Voltage))
data <- mutate(data, Global_intensity = as.numeric(Global_intensity))
data <- mutate(data, Sub_metering_1 = as.numeric(Sub_metering_1))
data <- mutate(data, Sub_metering_2 = as.numeric(Sub_metering_2))
data <- mutate(data, Sub_metering_3 = as.numeric(Sub_metering_3))
png("plot3.png")
with(data, plot(Datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(data, lines(Datetime, Sub_metering_2, col = "red"))
with(data, lines(Datetime, Sub_metering_3, col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()