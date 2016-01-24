# Prepare data to plot
data <-read.table(unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt"), header=T, sep=";")
two_days_data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
two_days_data$DateTime <- paste(two_days_data$Date, two_days_data$Time)
two_days_data$DateTime <- as.POSIXct(strptime(two_days_data$DateTime, format="%d/%m/%Y %H:%M:%S"))
two_days_data$Global_active_power <- as.numeric(as.character(two_days_data$Global_active_power))

# Open png device
png(filename="plot2.png", width=480, height=480)

# Plot data
with(two_days_data, plot(DateTime, Global_active_power, type="n", xlab="", ylab="Global Active Power (kilowatts)"))
with(two_days_data, lines(DateTime, Global_active_power))

# Closing device
dev.off()
