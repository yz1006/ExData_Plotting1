library(data.table)

library(datasets)


powerData=fread("household_power_consumption.txt")

powerData$DateValue = as.Date(powerData$Date, "%d/%m/%Y")

powerDataSub = subset(powerData, DateValue == as.Date('01/02/2007', '%d/%m/%Y') | DateValue ==as.Date('02/02/2007', '%d/%m/%Y'))

powerDataSub$SDateTime = paste(powerDataSub$Date, powerDataSub$Time)

powerDataSub$DateTime= as.POSIXct(powerDataSub$SDateTime, format ="%d/%m/%Y %H:%M:%S")


powerDataSub$Global_active_power=as.numeric(powerDataSub$Global_active_power)

powerDataSub$Global_reactive_power=as.numeric(powerDataSub$Global_reactive_power)

powerDataSub$Sub_metering_1=as.numeric(powerDataSub$Sub_metering_1)

powerDataSub$Sub_metering_2=as.numeric(powerDataSub$Sub_metering_2)

powerDataSub$Sub_metering_3=as.numeric(powerDataSub$Sub_metering_3)

powerDataSub$Voltage=as.numeric(powerDataSub$Voltage)




par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(powerDataSub, {
  plot(DateTime, Global_active_power, type="l", ylab="Global Active Power", xlab="")
  plot(DateTime, Voltage, type="l", ylab="Voltage")
  
  plot(DateTime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
  lines(DateTime, Sub_metering_2, col="red")
  lines(DateTime, Sub_metering_3, col="blue")
  legend("topright", col=c("black", "red", "blue"), legend =c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), lwd =2)
  
  plot(DateTime, Global_reactive_power, type='l', ylab='Global_reactive_power')
})

dev.copy(png, file="plot4.png")
dev.off()


