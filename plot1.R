source("loadHpcData.R")

plot1 <- function() {
    hpc <- loadHpcData()
    png("plot1.png")
    hist(hpc$Global_active_power,
         freq=TRUE,
         col="red",
         main="Global Active Power",
         xlab="Global Active Power (kilowatts)")
    dev.off()
}