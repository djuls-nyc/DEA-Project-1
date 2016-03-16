# Loading data
data <- read.csv("household_power_consumption.txt", 
                 header=TRUE, sep=";", 
                 stringsAsFactors=FALSE,
                 na.strings = c("NA", "?", ""))

# Convert to date format
data$Date <- as.Date(strptime(data$Date, "%d/%m/%Y"))

# Extract data from 2007-02-01 to 2007-02-02
data <- subset(data, ( (Date=="2007-02-01") | (Date=="2007-02-02")))

# PLOT 4

# merge Date and Time
time_and_date <- as.POSIXct(paste(data$Date, data$Time), 
                            format="%Y-%m-%d %T")
# Save in PNG file
png("plot4.png")

par(mfcol=c(2,2))

#1st plot
plot(time_and_date, data$Global_active_power, 
     type ="l", xlab="",
     ylab="Global active Power (kilowatts)")

#2nd plot
plot(time_and_date, data$Sub_metering_1, 
                type ="l", xlab="",
                ylab="Energy sub metering")

points(time_and_date, data$Sub_metering_2, col="red", type="l")

points(time_and_date, data$Sub_metering_3, col="blue", type="l")

legend("topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"),
       lty=c(1,1,1),
       bty="n")

#3rd plot
plot(time_and_date, data$Voltage, 
     type ="l", xlab="datetime",
     ylab="Voltage")

#4th plot
plot(time_and_date, data$Global_reactive_power, 
     type ="l", xlab="datetime",
     ylab = "Global_reactive_power")

# close file
dev.off()
