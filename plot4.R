#plot4

#Read and subset data
data <- read.table("household_power_consumption.txt",
sep=";",na.strings="?",header=TRUE)
plotdata <- subset(data,Date=="1/2/2007"|Date=="2/2/2007")

#Combine Date and Time into one POSIXlt class variable
timedata <- within(plotdata,{timestamp=strptime(paste(plotdata$Date,plotdata$Time)
,format="%d/%m/%Y %H:%M:%S")})

#Create png file
png(filename="plot4.png",width=480,height=480)

#Create plots
par(mfcol = c(2, 2))

#plot1
	with(timedata,plot(timestamp,Global_active_power,type="l"
	,xlab="",ylab="Global Active Power (kilowatts)"))

#plot2
	with(timedata,plot(timestamp,Sub_metering_1,type="l",xlab="",ylab="Energy Sub Metering"))

	with(timedata,lines(timestamp,Sub_metering_2,type="l",col="red"))

	with(timedata,lines(timestamp,Sub_metering_3,type="l",col="blue"))

	#Add legend
	legend("topright", lty = 1, col = c("black","blue", "red")
	,legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#plot3
	with(timedata,plot(timestamp,Voltage,type="l"
	,ylab="Voltage"))

#plot3
	with(timedata,plot(timestamp,Global_reactive_power,type="l"
	,ylab="Global Reactive Power"))

dev.off()