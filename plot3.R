# Prepare data to plot
data <-read.table(unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt"), header=T, sep=";")
two_days_data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
two_days_data$DateTime <- paste(two_days_data$Date, two_days_data$Time)
two_days_data$DateTime <- as.POSIXct(strptime(two_days_data$DateTime, format="%d/%m/%Y %H:%M:%S"))
two_days_data$Sub_metering_1 <- as.numeric(as.character(two_days_data$Sub_metering_1))
two_days_data$Sub_metering_2 <- as.numeric(as.character(two_days_data$Sub_metering_2))
two_days_data$Sub_metering_3 <- as.numeric(as.character(two_days_data$Sub_metering_3))

# Open png device
png(filename="plot3.png", width=480, height=480)

# Plot data
with(two_days_data, plot(DateTime, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering"))
with(two_days_data, lines(DateTime, Sub_metering_1))
with(two_days_data, lines(DateTime, Sub_metering_2, col="red"))
with(two_days_data, lines(DateTime, Sub_metering_3, col="blue"))

# Making legen
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lw=2)

# Closing device
dev.off()