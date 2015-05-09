consume <- read.csv("c.txt", sep=";", na.strings="?")
consume <- subset(consume, Date == "1/2/2007" | Date == "2/2/2007")
consume[, "Date"] <- as.Date(strptime(consume[, "Date"], format='%d/%m/%Y'))

png("plot1.png", width=480, height=480)
hist(consume[,"Global_active_power"], col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)" )
dev.off() 