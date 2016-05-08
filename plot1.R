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

## PLOT HISTOGRAM
hist(theData$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

#save the file to plot1.png
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()