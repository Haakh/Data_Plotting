consume <- read.csv("consume.csv", sep=";", na.strings="?")
consume <- subset(power, Date == "1/2/2007" | Date == "2/2/2007")
consume[, "Date"] <- as.Date(strptime(power[, "Date"], format='%d/%m/%Y'))

png("plot1.png", width=480, height=480)
hist(power[,"Global_active_power"], col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)" )
dev.off()
