##import data into R
alldata<-read.table(file.choose(),header = TRUE,sep = ";",na.strings = "?")
##create a new variable called datetime
alldata$datetime<-strptime(paste(alldata$Date,alldata$Time),"%d/%m/%Y %H:%M:%S")
##select the data for 20070701 and 20070702
plotdata<-alldata[alldata$Date %in% c("2/2/2007","1/2/2007"),]

##output the plot1
png("plot1.png",width = 480,height = 480)
##make plot1 
par(mar=c(4,4,2,2))
hist(plotdata$Global_active_power,col = "red",xlab = "Global Active Power (kilowatts)",main = "Global Active Power")
##turn off the png device
dev.off()