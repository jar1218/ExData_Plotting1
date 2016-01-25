#plot1, create a histogram of Global Active Power 

#read in the data
powerdata <- read.csv("./household_power_consumption.txt", sep=";", na.strings = c("?"))
#subset the data
powerdata1 <- subset(powerdata, powerdata$Date == "1/2/2007" | powerdata$Date == "2/2/2007") 

#Open the png device
png(filename = "plot1.png", width = 480, height = 480)

#Create the plot
hist(powerdata1$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red" )

#Close the Device
dev.off()
