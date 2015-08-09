plot2 <- function(){
    #parse the Data
    powerData <-read.delim("household_power_consumption.txt",header=TRUE,sep=";")
    
    #Subset the requested data
    subPowerData <- powerData[powerData$Date %in% c("1/2/2007","2/2/2007") ,]
    
    #Generate dateTime objects
    dateTime <- strptime(paste(subPowerData$Date,subPowerData$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
    
    
    #Extract global power data and calculate kilowatts
    globalActivePower <- (as.numeric(gsub("\\.","",subPowerData$Global_active_power))/1000)
    
    #create png file
    png("plot2.png", width=480, height=480)
    
    plot(dateTime,globalActivePower,type="l", xlab="", ylab="Global Active Power (kilowatts)")
    
    dev.off()
}