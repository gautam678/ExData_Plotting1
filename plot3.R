data <- read.csv("household_power_consumption.txt", sep=';',stringsAsFactors=F)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Subsetting the data
data_new <- data[ which(data$Date >= "2007-02-01" & data$Date <= "2007-02-02"),]

## Converting dates
temp <- paste(as.Date(data_new$Date), data_new$Time)
data_new$Datetime <-as.POSIXct(temp)
rm(data)
## Plot 2

with(data_new, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()