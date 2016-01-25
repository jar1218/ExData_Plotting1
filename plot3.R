#plot3, create graph of sub_meter activity by day/time

#read in the data
powerdata <- read.csv("./household_power_consumption.txt", sep=";", na.strings = c("?"))

#subset the data
powerdata1 <- subset(powerdata, powerdata$Date == "1/2/2007" | powerdata$Date == "2/2/2007") 

#Create the vector of datetime
Concatedt <- paste(powerdata1$Date, powerdata1$Time)
dt <- strptime(Concatedt, "%d/%m/%Y %H:%M:%S")

#Open the png device
png(filename = "plot3.png", width = 480, height = 480)

#Create the plot
plot(dt, powerdata1$Sub_metering_1, type ="n" , ylab = "Energy Sub Metering")
lines(dt, powerdata1$Sub_metering_1)
lines(dt, powerdata1$Sub_metering_2, col ="red")
lines(dt, powerdata1$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1, col = c("black", "red", "blue"))

#Close the Device
dev.off()
