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

## Creating plot
hist(power$Global_active_power, col="red", main='Global Active Power',xlab='Global Active Power(kilowatts)',ylab='Frequency')

## Copy to a PNG 
dev.copy(png, file="plot1.png",width=480, height=480)
dev.off()





