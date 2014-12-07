source("loadHpcData.R")

plot2 <- function() {
    hpc <- loadHpcData()
    png("plot2.png")
    plot(hpc$DateTime,
         hpc$Global_active_power,
         type="l",
         xlab="",
         ylab="Global Active Power (kilowatts)")
    dev.off()
}
