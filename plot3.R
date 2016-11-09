## Read in data
data<-read.table("./household_power_consumption.txt",sep=";",header=TRUE)

## Create 'dates' object
dates<-as.Date(data$Date,format="%d/%m/%Y")

## Subset Data
data<-subset(data,dates=="2007-02-02"|dates=="2007-02-01")

## Create variable 'x' holding both time and date
x<-as.POSIXct(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")

## Open device
png("./plot3.png", width = 480, height = 480, units = "px")

## Create and make plots of desired variable as a function of time and date
y1<-as.numeric(as.character(data$Sub_metering_1))
y2<-as.numeric(as.character(data$Sub_metering_2))
y3<-as.numeric(as.character(data$Sub_metering_3))
plot(x,y1,xlab="",ylab="Energy sub metering",main="",type="n")
lines(x,y1,lty=1,col="black")
lines(x,y2,lty=1,col="red")
lines(x,y3,lty=1,col="blue")
legend("topright",lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

## Close device
dev.off()