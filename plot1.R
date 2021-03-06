library(dplyr)
df <- data.frame(read.csv2("./hpc.txt", header=TRUE, sep=";"))
df$Date <- as.Date(df$Date, "%d/%m/%Y")
df1 <- filter(df, df$Date >= "2007-02-01" & df$Date < "2007-02-03")
df1$Global_active_power <- as.numeric(as.character(df1$Global_active_power))
png(filename="plot1.png", width=480, height = 480, units="px")
with(df1, hist(Global_active_power, main="Global Active Power", col="red", breaks=20, xlab="Global Active Power (kilowatts)"))
dev.off()
