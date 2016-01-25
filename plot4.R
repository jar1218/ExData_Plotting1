#plot4 -- the 4 plot plot

#read in the data
powerdata <- read.csv("./household_power_consumption.txt", sep=";", na.strings = c("?"))

#subset the data
powerdata1 <- subset(powerdata, powerdata$Date == "1/2/2007" | powerdata$Date == "2/2/2007") 

#Create the vector of datetime
Concatedt <- paste(powerdata1$Date, powerdata1$Time)
dt <- strptime(Concatedt, "%d/%m/%Y %H:%M:%S")



#Open the png device
png(filename = "plot4.png", width = 480, height = 480)

#set the 2x2 mfrows
par(mfrow = c(2,2))

#Create the plots
#the first is copied for plot2
plot(dt, powerdata1$Global_active_power, type ="n" , ylab = "Global Active Power (kilowatts)")
lines(dt, powerdata1$Global_active_power)

#second is voltage
plot(dt, powerdata1$Voltage, type ="n" , ylab = "Voltage")
lines(dt, powerdata1$Voltage)

#Third, we have plot3 again
plot(dt, powerdata1$Sub_metering_1, type ="n" , ylab = "Energy Sub Metering")
lines(dt, powerdata1$Sub_metering_1)
lines(dt, powerdata1$Sub_metering_2, col ="red")
lines(dt, powerdata1$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1, col = c("black", "red", "blue"))

#Finally, global reactive power
plot(dt, powerdata1$Global_reactive_power, type ="n" , ylab = "Global Reactive Power")
lines(dt, powerdata1$Global_reactive_power)
#Close the Device
dev.off()
