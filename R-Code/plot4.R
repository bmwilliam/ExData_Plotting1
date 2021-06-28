## Loading the data
## Location: [your working directory]/data/household_power_consumtion.txt
epcData <- read.table("./data/household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?")

## Convert "character" to "Time"
epcData$Time <- strptime(paste(epcData$Date,epcData$Time,sep = " "),"%d/%m/%Y %H:%M:%S")

## Convert "character" to "Date"
epcData$Date <- as.Date(epcData$Date,"%d/%m/%Y")

## Setting the boundary dates (start & end)
epc.start <- as.Date("2007-02-01","%Y-%m-%d")
epc.end <- as.Date("2007-02-02","%Y-%m-%d")

## Filter data based on the boundary dates
epcData.f <- filter(epcData, Date >= epc.start & Date <= epc.end)

## Open a graphic device - PNG with 480 pixels X 480 pixels
png(filename="plot4.png",width = 480, height = 480, units = "px")

## Multiple Base Plots - 2 X 2
par(mfrow=c(2,2))

## Draw a plot4 (Global Active Power- Datetime) at Upper Left
plot(epcData.f$Time, epcData.f$Global_active_power, type = "l"
     , xlab = "Time"
     , ylab = "Global Active Power")

## Draw a plot4 (Voltage - Datetime) at Upper Right
plot(epcData.f$Time, epcData.f$Voltage, type = "l"
     , xlab = "datetime"
     , ylab = "Voltage")

## Draw a plot4 (Sub-metering - Datetime) at Lower Left
plot(epcData.f$Time, epcData.f$Sub_metering_1, type = "l"
, xlab = "Time"
, ylab = "Energy sub metering")
lines(epcData.f$Time, epcData.f$Sub_metering_2, type = "l", col = "red")
lines(epcData.f$Time, epcData.f$Sub_metering_3, type = "l", col = "blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       ,lwd=c(2,2,2),col=c("black","red","blue"))

## Draw a plot4 (Global Reactive Power - Datetime) at Lower Right
plot(epcData.f$Time, epcData.f$Global_reactive_power, type = "l"
     , xlab = "datetime"
     , ylab = "Global Reactive Power")


## Close the PNG device.
dev.off()