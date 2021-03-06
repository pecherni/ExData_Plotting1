data<-read.table("C:\\household_power_consumption.txt", header=T, sep=';', na.strings="?", check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data$Date<-as.Date(data$Date, format="%d/%m/%Y")
data_sub<- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
day <- paste(as.Date(data_sub$Date), data_sub$Time)
data_sub$Datetime_day <- as.POSIXct(day,tz="Europe/Moscow")
plot(data_sub$Global_active_power~data_sub$Datetime_day, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="C:\\plot2.png", height=480, width=480)
