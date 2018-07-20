

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="power.zip")
unzip("power.zip")

power <- read.table("household_power_consumption.txt", sep = ';', header = T, stringsAsFactors = F, na.strings = '?')
power$time2 <- as.POSIXct(strptime(paste(power$Date, power$Time, sep=" "), "%d/%m/%Y %H:%M:%S")) 
power$Date <- as.Date(power$Date, format="%d/%m/%Y")


power2 <- power[power$Date >= '2007-02-01' & power$Date <= '2007-02-02',]


png("plot2.png", width=480, height=480)

plot(power2$time2, as.numeric(power2$Global_active_power), xlab = "", ylab = "Global Active Power (kilowatts)", type = 'l')

dev.off()

