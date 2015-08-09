data_full <- read.csv("./household_power_consumption.txt", header=TRUE, na.strings="?", sep=";", nrows=2075259, check.names=FALSE, stringsAsFactors=FALSE, comment.char="", quote="\"")
data_full$Date <- as.Date(data_full$Date, format = "%d/%m/%Y")

data  <- subset(data_full, subset=(Date >= "2007/02/01" & Date <= "2007/02/02"))
rm(data_full)

datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
# First
plot(data$Global_active_power ~ data$Datetime, ylab="Global Active Power", type="l", xlab="")

# Second
plot(data$Voltage ~ data$Datetime, ylab="Voltage", type="l", xlab="datetime")

# Third
plot(data$Sub_metering_1~data$Datetime, ylab="Engergy sub metering", xlab="", type="l")
lines(data$Sub_metering_2~data$Datetime, col="Red")
lines(data$Sub_metering_3~data$Datetime, col="Blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"), bty="n", cex = 0.6)


# Fourth
plot(data$Global_reactive_power~data$Datetime, type="l", ylab="Global Reactive Power", xlab="datetime")

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
