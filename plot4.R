# Prepare data to plot
data <-read.table(unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt"), header=T, sep=";")
two_days_data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
two_days_data$DateTime <- paste(two_days_data$Date, two_days_data$Time)
two_days_data$DateTime <- as.POSIXct(strptime(two_days_data$DateTime, format="%d/%m/%Y %H:%M:%S"))
two_days_data$Sub_metering_1 <- as.numeric(as.character(two_days_data$Sub_metering_1))
two_days_data$Sub_metering_2 <- as.numeric(as.character(two_days_data$Sub_metering_2))
two_days_data$Sub_metering_3 <- as.numeric(as.character(two_days_data$Sub_metering_3))
two_days_data$Global_active_power <- as.numeric(as.character(two_days_data$Global_active_power))
two_days_data$Global_reactive_power <- as.numeric(as.character(two_days_data$Global_reactive_power))
two_days_data$Voltage <- as.numeric(as.character(two_days_data$Voltage))

# Open png device
png(filename="plot4.png", width=480, height=480)

par(mfrow=c(2,2))
par(mar=c(4,4,1,1))
with(two_days_data, plot(DateTime, Global_active_power, type="n", xlab="", ylab="Global Active Power (kilowatts)", cex.lab=0.7))
with(two_days_data, lines(DateTime, Global_active_power))

with(two_days_data, plot(DateTime, Voltage, type="n", xlab="datetime", ylab="Voltage", cex.lab=0.7))
with(two_days_data, lines(DateTime, Voltage))

with(two_days_data, plot(DateTime, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering", cex.lab=0.7))
with(two_days_data, lines(DateTime, Sub_metering_1))
with(two_days_data, lines(DateTime, Sub_metering_2, col="red"))
with(two_days_data, lines(DateTime, Sub_metering_3, col="blue"))

with(two_days_data, plot(DateTime, Global_reactive_power, type="n", xlab="datetime",
                         ylab="Global Reactive Power (kilowatts)", cex.lab=0.7))
with(two_days_data, lines(DateTime, Global_reactive_power))

# Closing device
dev.off()