##import data into R
alldata<-read.table(file.choose(),header = TRUE,sep = ";",na.strings = "?")
##create a new variable called datetime
alldata$datetime<-strptime(paste(alldata$Date,alldata$Time),"%d/%m/%Y %H:%M:%S")
##select the data for 20070701 and 20070702
plotdata<-alldata[alldata$Date %in% c("2/2/2007","1/2/2007"),]
##plot2
png("plot2.png",width = 480,height = 480)
plot(plotdata$datetime,plotdata$Global_active_power,type = "l",xlab = "",ylab="Global Active Power (kilowatts)")
dev.off()