plot1 <- function(){
    #parse the Data
    powerData <-read.delim("household_power_consumption.txt",header=TRUE,sep=";")
    
    #Subset the requested data
    subPowerData <- powerData[powerData$Date %in% c("1/2/2007","2/2/2007") ,]
    
    #Extract global power data and calculate kilowatts
    globalActivePower <- (as.numeric(gsub("\\.","",subPowerData$Global_active_power))/1000)
    
    #create png file
    png("plot1.png", width=480, height=480)
    
    hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
    
    dev.off()
    
    
}
