## Read in data
data<-read.table("./household_power_consumption.txt",sep=";",header=TRUE)

## Create 'dates' object
dates<-as.Date(data$Date,format="%d/%m/%Y")

## Subset Data
data<-subset(data,dates=="2007-02-02"|dates=="2007-02-01")

## Open device
png("./plot1.png", width = 480, height = 480, units = "px")

## Create and make histogram of desired variable
x<-as.numeric(as.character(data$Global_active_power))
hist(x,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")

## Close device
dev.off()