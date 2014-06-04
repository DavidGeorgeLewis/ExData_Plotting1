data3 <- read.table("household_power_consumption.txt",nrows=2200000,sep=";",header=T,comment.char="") ##Read data
subdata3 <- data3[data3$Date=="1/2/2007",]  ## Select 1/2/2007
subdata4 <- data3[data3$Date=="2/2/2007",]  ##Select 2/2/2007
data <- rbind(subdata3,subdata4)

par(mfcol=c(1,1))
y <- as.numeric(as.character(data$Global_active_power))  ## Select Global Active power data for y axis
x<-strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")  ## Change Date and Time to datetime format
plot(x,y,type="n",ylab="Global Active Power",xlab="")  ##Define chart
lines(x,y)  ##Plot line chart

dev.copy(png,file="plot2.png")  ##Copy to .png file
dev.off()  ##Turn off