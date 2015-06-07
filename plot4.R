data<-read.csv2(unz("exdata-data-household_power_consumption.zip","household_power_consumption.txt"), as.is=TRUE)
subdata<-data[data$Date == "2/2/2007" | data$Date=="1/2/2007",]
subdata$Date<-as.Date(subdata$Date,"%d/%m/%Y")
subdata$DateTime<-strptime(paste(subdata$Date, subdata$Time), "%Y-%m-%d %H:%M:%S")
subdata$Global_active_power<-as.numeric(subdata$Global_active_power)


png(file="plot3.png", width=480, height=480)
with(subdata, plot(subdata$DateTime, subdata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
points(x=subdata$DateTime, y=subdata$Sub_metering_2, type="l", col="red")
points(x=subdata$DateTime, y=subdata$Sub_metering_3, type="l", col="blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty = 1)
dev.off()
