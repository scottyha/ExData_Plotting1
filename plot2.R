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

## PLOT WITH PLOT FUNCTION
plot(theData$Global_active_power~theData$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

#save the file to plot2.png
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()