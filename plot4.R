## The File downloaded is extracted first, and then name changed to c.txt for ease
#It's read as a csv file for easy conversion.
consume <- read.csv("household_power_consumption.csv", sep=";", na.strings="?")
consume <- subset(consume, Date == "1/2/2007" | Date == "2/2/2007")

time <- strptime(paste(consume$Date, consume$Time), format="%d/%m/%Y %H:%M:%S")
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))
# 4 plots are plotted in the same image in clockwise manner...
plot(x=time, y=consume[,"Global_active_power"], type="l",ylab="Global Active Power", main="", xlab="")
plot(x=time, y=consume[,"Voltage"], type="l",ylab="Voltage", main="", xlab="datetime")

plot(x=time, y=consume[,"Sub_metering_1"], type="l",ylab="Energy sub metering", main="", xlab="")
lines(x=time, y=consume[,"Sub_metering_2"], col="red")
lines(x=time, y=consume[,"Sub_metering_3"], col="blue")

legend("topright",lty=1,col=c("black","blue","red"),legend =c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),bty = "n")


plot(x=time, y=consume[,"Global_reactive_power"], type="l",ylab="Global_reactive_power", main="", xlab="datetime")
dev.off()
