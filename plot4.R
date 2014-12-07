source("loadHpcData.R")

plot4 <- function() {
    hpc <- loadHpcData()
    png("plot4.png")
    par(mfrow=c(2,2))
    
    # top left plot
    plot(hpc$DateTime,
         hpc$Global_active_power,
         type="l",
         xlab="",
         ylab="Global Active Power (kilowatts)")    
    
    # top right plot
    plot(hpc$DateTime,
         hpc$Voltage,
         type="l",
         xlab="datetime",
         ylab="Voltage")    
    
    # bottom left plot
    plot(hpc$DateTime,
         hpc$Sub_metering_1,
         type="l",
         xlab="",
         ylab="Energy sub metering")
    lines(hpc$DateTime,
          hpc$Sub_metering_2,
          col="red")
    lines(hpc$DateTime,
          hpc$Sub_metering_3,
          col="blue")
    legend("topright",
           lwd=c(2.5,2.5,2.5),
           col=c("black", "red", "blue"),
           bty="n",
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    # bottom right plot
    plot(hpc$DateTime,
         hpc$Global_reactive_power,
         type="l",
         xlab="datetime",
         ylab="Global_reactive_power")    
    
    
    dev.off()
}
