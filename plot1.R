data<-read.csv2(unz("exdata-data-household_power_consumption.zip","household_power_consumption.txt"), as.is=TRUE)
subdata<-data[data$Date == "2/2/2007" | data$Date=="1/2/2007",]
subdata$Date<-as.Date(subdata$Date,"%d/%m/%Y")
subdata$DateTime<-strptime(paste(subdata$Date, subdata$Time), "%Y-%m-%d %H:%M:%S")
subdata$Global_active_power<-as.numeric(subdata$Global_active_power)

png(file="plot1.png", width=480, height=480)
hist(subdata$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="#FF3010")
dev.off()