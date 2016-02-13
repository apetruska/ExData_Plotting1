#plot1

#Read and subset data
data <- read.table("household_power_consumption.txt",
sep=";",na.strings="?",header=TRUE)
plotdata <- subset(data,Date=="1/2/2007"|Date=="2/2/2007")

#Create png file
png(filename="plot1.png",width=480,height=480)

#Create plot
with(plotdata,hist(Global_active_power,main="Global Active Power",
col="red",xlab="Global Active Power (kilowatts)"))
dev.off()