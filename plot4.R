##import data into R
alldata<-read.table(file.choose(),header = TRUE,sep = ";",na.strings = "?")
##create a new variable called datetime
alldata$datetime<-strptime(paste(alldata$Date,alldata$Time),"%d/%m/%Y %H:%M:%S")
##select the data for 20070701 and 20070702
plotdata<-alldata[alldata$Date %in% c("2/2/2007","1/2/2007"),]
label<-c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
##plot4
png("plot4.png",width = 480,height = 480)
par(mfrow=c(2,2))
plot(plotdata$datetime,plotdata$Global_active_power,type = "l",col="green",xlab = "",ylab = "Global Active Power")
plot(plotdata$datetime,plotdata$Voltage, col="orange", xlab="datetime", ylab="Voltage",type = "l")
plot(plotdata$datetime,plotdata$Sub_metering_1,type="l",xlab="",ylab = "Energy Sub metering",col="black")
lines(plotdata$datetime,plotdata$Sub_metering_2,col="red")
lines(plotdata$datetime,plotdata$Sub_metering_3,col="blue")
legend("topright",legend = label,col = c("black","red","blue"),lty = 1,bty = "n")
plot(plotdata$datetime,plotdata$Global_reactive_power,col="blue",type = "l",xlab = "datetime",ylab = "Global reactive power")
dev.off()
