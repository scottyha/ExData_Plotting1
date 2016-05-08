## LOAD DATA
theData <- read.table("household_power_consumption.txt", na.strings="?",
                      sep=";", header=TRUE,stringsAsFactors=FALSE)

## FORMAT DATE
theData$Date <- as.Date(theData$Date, format="%d/%m/%Y")

## SUBSET RELEVANT DATA
theData <- subset(theData, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## CONVERT DATE FORMAT
datetime <- paste(as.Date(theData$Date), theData$Time)
theData$Datetime <- as.POSIXct(datetime)

## PLOT & LINE FUNCTION
with(theData, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})

## ADD LEGENT
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#save the file to plot3.png
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()