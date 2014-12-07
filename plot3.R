source("loadHpcData.R")

plot3 <- function() {
    hpc <- loadHpcData()
    png("plot3.png")
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
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    dev.off()
}
