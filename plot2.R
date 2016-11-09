## Read in data
data<-read.table("./household_power_consumption.txt",sep=";",header=TRUE)

## Create 'dates' object
dates<-as.Date(data$Date,format="%d/%m/%Y")

## Subset Data
data<-subset(data,dates=="2007-02-02"|dates=="2007-02-01")

## Create variable 'x' holding both time and date
x<-as.POSIXct(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")

## Open device
png("./plot2.png", width = 480, height = 480, units = "px")

## Create and make plot of desired variable as a function of time and date
y<-as.numeric(as.character(data$Global_active_power))
plot(x,y,xlab="",ylab="Global Active Power (kilowatts)",main="",lty=1,type='l')

## Close device
dev.off()