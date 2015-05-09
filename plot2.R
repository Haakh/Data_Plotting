## The File downloaded is extracted first, and then name changed to c.txt for ease
#It's read as a csv file for easy conversion.
consume <- read.csv("c.txt", sep=";", na.strings="?")
consume <- subset(consume, Date == "1/2/2007" | Date == "2/2/2007")

time <- strptime(paste(consume$Date, consume$Time), format="%d/%m/%Y %H:%M:%S")
png("plot2.png", width=480, height=480)
#The plotted graph is directly saved in the present working directory as plot2.png image
plot(x=time, y=consume[,"Global_active_power"], type="l",ylab="Global Active Power (kilowatts)", main="", xlab="")
dev.off()
