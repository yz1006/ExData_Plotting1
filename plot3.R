library(data.table)

library(datasets)


powerData=fread("household_power_consumption.txt")

powerData$DateValue = as.Date(powerData$Date, "%d/%m/%Y")

powerDataSub = subset(powerData, DateValue == as.Date('01/02/2007', '%d/%m/%Y') | DateValue ==as.Date('02/02/2007', '%d/%m/%Y'))

powerDataSub$SDateTime = paste(powerDataSub$Date, powerDataSub$Time)

powerDataSub$DateTime= as.POSIXct(powerDataSub$SDateTime, format ="%d/%m/%Y %H:%M:%S")



powerDataSub$Sub_metering_1=as.numeric(powerDataSub$Sub_metering_1)

powerDataSub$Sub_metering_2=as.numeric(powerDataSub$Sub_metering_2)

powerDataSub$Sub_metering_3=as.numeric(powerDataSub$Sub_metering_3)


with(powerDataSub, plot(DateTime, Sub_metering_1, type ='l', ylab ='Energy sub metering', xlab=''))
with(powerDataSub, lines(DateTime,Sub_metering_2, col='red'))
with(powerDataSub, lines(DateTime,Sub_metering_3, col='blue'))
legend("topright", col=c("black", "red", "blue"), legend =c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), lwd =2)

dev.copy(png, file="plot3.png")
dev.off()
