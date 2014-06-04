data3 <- read.table("household_power_consumption.txt",nrows=2200000,sep=";",header=T,comment.char="") ##Read data
subdata3 <- data3[data3$Date=="1/2/2007",]  ##Select only two days 2007-02-01
subdata4 <- data3[data3$Date=="2/2/2007",]  ##and 2007-02-02
data <- rbind(subdata3,subdata4) 

par(mfcol=c(1,1)) ##Ensure 1 graph per page
x <- as.numeric(as.character(data$Global_active_power))  ##Select Global Acive Power data
hist(x,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")  ##Plot histogram 

dev.copy(png,file="plot1.png")  ##Produce .png file
dev.off()  ##Turn of png device