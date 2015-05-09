consume <- read.csv("household_power_consumption.csv", sep=";", na.strings="?")
consume <- subset(consume, Date == "1/2/2007" | Date == "2/2/2007")
time <- strptime(paste(consume$Date, consume$Time), format="%d/%m/%Y %H:%M:%S")

png("plot3.png", width=480, height=480)

plot(x=time, y=consume[,"Sub_metering_1"], type="l",ylab="Energy sub metering", main="", xlab="")
lines(x=time, y=consume[,"Sub_metering_2"], col="red")
lines(x=time, y=consume[,"Sub_metering_3"], col="blue")
legend("topright", lty=1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
