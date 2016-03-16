# Loading data
data <- read.csv("household_power_consumption.txt", 
                 header=TRUE, sep=";", 
                 stringsAsFactors=FALSE,
                 na.strings = c("NA", "?", ""))

# Convert to date format
data$Date <- as.Date(strptime(data$Date, "%d/%m/%Y"))

# Extract data from 2007-02-01 to 2007-02-02
data <- subset(data, ( (Date=="2007-02-01") | (Date=="2007-02-02")))

# PLOT 2

# merge Date and Time
time_and_date <- as.POSIXct(paste(data$Date, data$Time), 
                            format="%Y-%m-%d %T")
plot(time_and_date, data$Global_active_power, 
                type ="l", xlab="",
                ylab="Global active Power (kilowatts)")

# Save in PNG file
dev.copy(png, file="plot2.png")
dev.off()
