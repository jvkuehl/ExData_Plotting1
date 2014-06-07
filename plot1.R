setClass('myDate')
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )
power = read.table("data/household_power_consumption.txt", sep = ";", header=TRUE, colClasses = c("myDate", "character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings = "?")
powersub = power[power$Date == "2007-02-01" | power$Date == "2007-02-02",]
powersub$datetime = paste(powersub$Date, powersub$Time, sep=" ")
powersub[[10]] = strptime(powersub[[10]], "%Y-%m-%d %H:%M:%S")



png(file = "plot1.png", width = 480, height = 480, units = "px")
hist(powersub$Global_active_power, main="Global Active Power", xlab="Global Active Power(kilowatts)", col = "red", yaxt="n")
axis(2, cex.axis=.75)
dev.off()
