# Loading data
data <- read.csv("household_power_consumption.txt", 
                 header=TRUE, sep=";", 
                 stringsAsFactors=FALSE,
                 na.strings = c("NA", "?", ""))

# Convert to date format
data$Date <- as.Date(strptime(data$Date, "%d/%m/%Y"))

# Extract data from 2007-02-01 to 2007-02-02
data <- subset(data, ( (Date=="2007-02-01") | (Date=="2007-02-02")))

# PLOT 3

# merge Date and Time
time_and_date <- as.POSIXct(paste(data$Date, data$Time), 
                            format="%Y-%m-%d %T")

# Save in PNG file
png(file="plot3.png")

plot(time_and_date, data$Sub_metering_1, 
                type ="l", xlab="",
                ylab="Energy sub metering")

points(time_and_date, data$Sub_metering_2, col="red", type="l")

points(time_and_date, data$Sub_metering_3, col="blue", type="l")

legend("topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"),
       lty=c(1,1,1))

# close file
dev.off()
