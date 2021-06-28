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
png(filename="plot2.png",width = 480, height = 480, units = "px")

## Draw a plot2 with title, xlab, color (red)
plot(epcData.f$Time, epcData.f$Global_active_power, type = "l"
     , xlab = "Time"
     , ylab = "Global Active Power (kilowatts)"
     , main = "Global Active Power")

## Close the PNG device.
dev.off()