library(tools)

loadHpcData <- function() {
    hpcFile <- "household_power_consumption.txt"
    hpcZip <- "exdata-data-household_power_consumption.zip"
    hpcUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    hpcSubsetFile <- "household_power_consumption_SUBSET.txt"

    fetchHpcData <- function() {
        if (! file.exists(hpcZip)) {
            download.file(hpcUrl, hpcZip, method = 'curl')
        }
        if (md5sum(hpcZip) != "41f51806846b6b567b8ae701a300a3de") {
            stop("Downloaded file of hpc data doesn't match checksum!")
        }
    }

    makeHpcSubset <- function() {
        if (! file.exists(hpcSubsetFile)) {
            hpc <- read.csv(unz(hpcZip, "household_power_consumption.txt"), na.strings="?", sep=";")
            hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")
            write.csv(hpc[hpc$Date >= as.Date("2007-02-01") & hpc$Date <= as.Date("2007-02-02"), ], hpcSubsetFile, row.names=FALSE)
        }
    }

    fetchHpcData()
    makeHpcSubset()
    hpc <- read.csv(hpcSubsetFile)
    hpc$DateTime <- as.POSIXct(paste(hpc$Date, hpc$Time), format="%Y-%m-%d %H:%M:%S")
    hpc$Date <- as.Date(hpc$Date, format="%Y-%m-%d")
    return(hpc)
}