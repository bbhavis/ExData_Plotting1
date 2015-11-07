library(dplyr)
df <- data.frame(read.csv2("./hpc.txt", header=TRUE, sep=";", na.strings = "?"))
df$Date <- as.Date(df$Date, "%d/%m/%Y")
df1 <- filter(df, df$Date >= "2007-02-01" & df$Date < "2007-02-03")
df1$DateTime <- strptime(paste(df1$Date, df1$Time), "%Y-%m-%d %H:%M:%S")
df1$Global_active_power <- as.numeric(as.character(df1$Global_active_power))
df1$Voltage <- as.numeric(as.character(df1$Voltage))
df1$Global_reactive_power <- as.numeric(as.character(df1$Global_reactive_power))
df1$Sub_metering_1 <- as.numeric(as.character(df1$Sub_metering_1))
df1$Sub_metering_2 <- as.numeric(as.character(df1$Sub_metering_2))
df1$Sub_metering_3 <- as.numeric(as.character(df1$Sub_metering_3))

png(filename="plot4.png", width=480, height = 480, units="px")
par(mfrow=c(2,2))

with(df1, {
    plot(DateTime, Global_active_power, ylab="Global Active Power", type="l", xlab="")
    plot(DateTime, Voltage, xlab="datetime", type="l")
    
    plot(DateTime, Sub_metering_1, ylab="Energy sub metering", xlab="", type="n")
    points(DateTime, Sub_metering_1, type="l", col="black")
    points(DateTime, Sub_metering_2, type="l", col="red", cex =2)
    points(DateTime, Sub_metering_3, type="l", col="blue")
    legend("topright", col=c("black", "red", "blue"), 
           legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd=3)
    
    plot(DateTime, Global_reactive_power, type="l", xlab="datetime")
    
})
dev.off()
