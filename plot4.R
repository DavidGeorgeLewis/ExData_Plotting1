data3 <- read.table("household_power_consumption.txt",nrows=2200000,sep=";",header=T,comment.char="")
subdata3 <- data3[data3$Date=="1/2/2007",]
subdata4 <- data3[data3$Date=="2/2/2007",]
data <- rbind(subdata3,subdata4)

par(mfcol=c(2,2))
x<-strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")  ## Change Date and Time to datetime format

y <- as.numeric(as.character(data$Global_active_power))  ## Select Global Active power data for y axis
plot(x,y,type="n",ylab="Global Active Power",xlab="")  ##Define chart
lines(x,y)  ##Plot line chart

y <- as.numeric(as.character(data$Sub_metering_1))  ##Select three columns of data for y axis
y2 <- as.numeric(as.character(data$Sub_metering_2))
y3 <- as.numeric(as.character(data$Sub_metering_3))
plot(x,y,type="n",xlab="",ylab="Energy sub metering")
lines(x,y)  ##Colour lines black, red, blue
lines(x,y2,col="red")
lines(x,y3,col="blue")
legend("topright",lwd=1,pt.cex=1,cex=0.5,col=c("black","blue","red"),legend=c("Sub_metering 1","Sub_metering 2","Sub_metering 3")) #Insert legend in top right corner

y <- as.numeric(as.character(data$Voltage))
plot(x,y,type="n",ylab="Voltage",xlab="datetime")
lines(x,y)

y <- as.numeric(as.character(data$Global_reactive_power))
plot(x,y,type="n",ylab="Global_reactive_power",xlab="datetime")
lines(x,y)

dev.copy(png,file="plot4.png")
dev.off()