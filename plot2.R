#plot2

#Read and subset data
data <- read.table("household_power_consumption.txt",
sep=";",na.strings="?",header=TRUE)
plotdata <- subset(data,Date=="1/2/2007"|Date=="2/2/2007")

#Combine Date and Time into one POSIXlt class variable
timedata <- within(plotdata,{timestamp=strptime(paste(plotdata$Date,plotdata$Time)
,format="%d/%m/%Y %H:%M:%S")})

#Create png file
png(filename="plot2.png",width=480,height=480)

#Create plot
with(timedata,plot(timestamp,Global_active_power,type="l"
,xlab="",ylab="Global Active Power (kilowatts)"))
dev.off()