# Prepare data to plot
data <-read.table(unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt"), header=T, sep=";")
two_days_data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
two_days_data$Date <- as.Date(strptime(two_days_data$Date, format="%d/%m/%Y"))
two_days_data$Global_active_power <- as.numeric(as.character(two_days_data$Global_active_power))

# Open png device
png(filename="plot1.png", width=480, height=480)

# Plot data
with(two_days_data, hist(Global_active_power, col="red", 
                         xlab="Global Active Power (killowatts)",yaxp=c(0, 1200, 6), 
                         ylab="Frequency", main="Global Active Power", cex.axis=0.8))
# Closing device
dev.off()