# Loading data
data <- read.csv("household_power_consumption.txt", 
                 header=TRUE, sep=";", 
                 stringsAsFactors=FALSE,
                 na.strings = c("NA", "?", ""))

# Convert to date format
data$Date <- as.Date(strptime(data$Date, "%d/%m/%Y"))

# Extract data from 2007-02-01 to 2007-02-02
data <- subset(data, ( (Date=="2007-02-01") | (Date=="2007-02-02")))

# PLOT 1
with(data, hist(Global_active_power, col="red", 
                xlab="Global active Power (kilowatts)", 
                main="Global Active Power"))

# Save in PNG file
dev.copy(png, file="plot1.png")
dev.off()
