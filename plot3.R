data_full <- read.csv("./household_power_consumption.txt", header=TRUE, na.strings="?", sep=";', nrows=2075259, check.names=FALSE, stringsAsFactors=FALSE, comment.char="", quote='\"')
data_full$Date <- as.Date(data_full$Date, format = "%d/%m/%Y")

data  <- subset(data_full, subset=(Date >= "2007/02/01" & Date <= "2007/02/02"))
rm(data_full)

datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

plot(data$Sub_metering_1~data$Datetime, ylab="Global Active Power (kilowatts)", xlab="", type="l")

lines(data$Sub_metering_2~data$Datetime,col="Red")
lines(data$Sub_metering_3~data$Datetime, col="Blue")

legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("Black", "Red", "Blue"), lty=1, lwd=2, cex = 0.75)

dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()
