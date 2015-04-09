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


## Creating plot
plot(power$DateTime, power$Sub_metering_1, type="l" ,ylab='Energy sub metering',xlab="", col="black")
lines(power$DateTime, power$Sub_metering_2, type="l", col="red")
lines(power$DateTime, power$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),y.intersp=1,lwd=1)

## Copy to a PNG 
dev.copy(png, file="plot3.png",width=480, height=480)
dev.off()



