library(dplyr)

## Reading file
mydir<-"exdata_data_household_power_consumption/"
file<-"household_power_consumption.txt"
p_c<-read.table(paste(mydir,file, sep=""), sep=";", na.strings="?", header=T)
p<-tbl_df(p_c)
rm(p_c)

## Subsetting data
p$Date<-as.Date(p$Date, format = "%d/%m/%Y")
power<-filter(p, Date=="2007-02-01" | Date=="2007-02-02")
rm(p)
power$DateTime <- as.POSIXct(paste(power$Date, power$Time))


## Creating plots
png(filename = "plot4.png", width=480, height=480)

par(mfrow=c(2,2))
          
## plot 1
plot(power$DateTime, power$Global_active_power, type="l" ,ylab='Global Active Power',xlab="")
## plot 2
plot(power$DateTime, power$Voltage, type="l" ,ylab='Voltage',xlab='datatime')

## plot 3
plot(power$DateTime, power$Sub_metering_1, type="l" ,ylab='Energy sub metering',xlab="", col="black")
lines(power$DateTime, power$Sub_metering_2, type="l", col="red")
lines(power$DateTime, power$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),bty="n",lwd=1,cex=0.7)
## plot 4
plot(power$DateTime, power$Global_reactive_power, type="l" ,ylab='Global_reactive_power',xlab="datatime")

dev.off()


