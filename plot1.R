data <- read.csv("household_power_consumption.txt", sep=';')
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Subsetting the data
data_new <- data[ which(data$Date >= "2007-02-01" & data$Date <= "2007-02-02"),]

## Converting dates
temp <- paste(as.Date(data_new$Date), data_new$Time)
data_new$Datetime <- as.POSIXct(temp)
rm(data)
## Plot 1
hist(as.numeric(data_new$Global_active_power), main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()