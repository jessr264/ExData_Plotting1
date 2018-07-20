

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="power.zip")
unzip("power.zip")

power <- read.table("household_power_consumption.txt", sep = ';', header = T, stringsAsFactors = F, na.strings = '?')
power$time2 <- as.POSIXct(strptime(paste(power$Date, power$Time, sep=" "), "%d/%m/%Y %H:%M:%S")) 
power$Date <- as.Date(power$Date, format="%d/%m/%Y")


power2 <- power[power$Date >= '2007-02-01' & power$Date <= '2007-02-02',]


png("plot3.png", width=480, height=480)


plot(power2$Sub_metering_1 ~ power2$time2, type = 'l', ylab = "Energy sub metering", xlab = "")
lines(power2$Sub_metering_2 ~ power2$time2, type = 'l', col = 'red')
lines(power2$Sub_metering_3 ~ power2$time2, type = 'l', col = 'blue')
legend("topright", lty = 1, lwd = 2, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"))


dev.off()
