data <- read.csv("household_power_consumption.txt", sep=';',stringsAsFactors=F)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Subsetting the data
data_new <- data[ which(data$Date >= "2007-02-01" & data$Date <= "2007-02-02"),]

## Converting dates
temp <- paste(as.Date(data_new$Date), data_new$Time)
data_new$Datetime <- as.numeric(as.POSIXct(temp))
rm(data)
## Plot 2
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data_new, {
  plot(data_new$Global_active_power~data_new$Datetime, type="l",ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage (volt)", xlab="Datetime")
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime,type="l",ylab="Global_reactive_power",xlab="")
})

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()