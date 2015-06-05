data<-read.csv2(unz("exdata-data-household_power_consumption.zip","household_power_consumption.txt"), as.is=TRUE)
subdata<-data[data$Date == "2/2/2007" | data$Date=="1/2/2007",]
subdata$Date<-as.Date(subdata$Date,"%d/%m/%Y")
subdata$DateTime<-strptime(paste(subdata$Date, subdata$Time), "%Y-%m-%d %H:%M:%S")
subdata$Global_active_power<-as.numeric(subdata$Global_active_power)

mdata<-melt(subdata, id.vars=c("DateTime"), measure.vars=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), value.name="Sub_metering")