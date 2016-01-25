#plot2, create graph of Global Active Power by day/time

#read in the data
powerdata <- read.csv("./household_power_consumption.txt", sep=";", na.strings = c("?"))

#subset the data
powerdata1 <- subset(powerdata, powerdata$Date == "1/2/2007" | powerdata$Date == "2/2/2007") 

#Create the vector of datetime
Concatedt <- paste(powerdata1$Date, powerdata1$Time)
dt <- strptime(Concatedt, "%d/%m/%Y %H:%M:%S")

#Open the png device
png(filename = "plot2.png", width = 480, height = 480)

#Create the plot
plot(dt, powerdata1$Global_active_power, type ="n" , ylab = "Global Active Power (kilowatts)")
lines(dt, powerdata1$Global_active_power)

#Close the Device
dev.off()
