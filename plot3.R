setClass('myDate')
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )
power = read.table("data/household_power_consumption.txt", sep = ";", header=TRUE, colClasses = c("myDate", "character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings = "?")
powersub = power[power$Date == "2007-02-01" | power$Date == "2007-02-02",]
powersub$datetime = paste(powersub$Date, powersub$Time, sep=" ")
powersub[[10]] = strptime(powersub[[10]], "%Y-%m-%d %H:%M:%S")

png(file = "plot3.png", width = 480, height = 480, units = "px")
with(powersub, plot(datetime,Sub_metering_1,ylab="Energy sub metering", xlab ="", type = "l"))
lines(powersub$datetime,powersub$Sub_metering_2, col= "red")
lines(powersub$datetime,powersub$Sub_metering_3, col= "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3" ), lty=c(1,1), col = c("black", "red", "blue"))
dev.off()