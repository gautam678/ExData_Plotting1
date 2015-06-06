data <- read.csv("household_power_consumption.txt", sep=';',stringsAsFactors=F)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Subsetting the data
data_new <- data[ which(data$Date >= "2007-02-01" & data$Date <= "2007-02-02"),]

## Converting dates
temp <- paste(as.Date(data_new$Date), data_new$Time)
data_new$Datetime <- as.numeric(as.POSIXct(temp))
rm(data)
## Plot 2
plot(data_new$Global_active_power~data_new$Datetime, type="l",ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()