library(data.table)

library(datasets)


powerData=fread("household_power_consumption.txt")

powerData$DateValue = as.Date(powerData$Date, "%d/%m/%Y")

powerDataSub = subset(powerData, DateValue == as.Date('01/02/2007', '%d/%m/%Y') | DateValue ==as.Date('02/02/2007', '%d/%m/%Y'))

powerDataSub$SDateTime = paste(powerDataSub$Date, powerDataSub$Time)

powerDataSub$DateTime= as.POSIXct(powerDataSub$SDateTime, format ="%d/%m/%Y %H:%M:%S")


powerDataSub$Global_active_power=as.numeric(powerDataSub$Global_active_power)


hist(powerDataSub$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red" )

dev.copy(png, file="plot1.png")
dev.off()
