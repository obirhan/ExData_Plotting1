plot4 <- function(){
    #parse the Data
    powerData <-read.delim("household_power_consumption.txt",header=TRUE,sep=";")
    
    #Subset the requested data
    subPowerData <- powerData[powerData$Date %in% c("1/2/2007","2/2/2007") ,]
    
    #Generate dateTime objects
    dateTime <- strptime(paste(subPowerData$Date,subPowerData$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
    
    globalActivePower <- (as.numeric(gsub("\\.","",subPowerData$Global_active_power))/1000)
    
    
    
    #create png file
    png("plot4.png", width=480, height=480)
    
    par(mfrow=c(2,2))
    
    plot(dateTime,globalActivePower,type="l", xlab="", ylab="Global Active Power (kilowatts)")
    
    plot(dateTime,as.numeric(gsub("\\.","",subPowerData$Voltage))/1000,type="l", xlab="datetime", ylab="Voltage")
    
    
    with(subPowerData,plot(dateTime,(as.numeric(gsub("\\.","",subPowerData$Sub_metering_1))/1000),type="l",xlab="",ylab="Energy sub metering"))
    with(subPowerData,lines(dateTime,(as.numeric(gsub("\\.","",subPowerData$Sub_metering_2))/1000),col="red"))
    with(subPowerData,lines(dateTime,Sub_metering_3,col="blue"))
    
    legend("topright",lty=c(1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")
    
    
    plot(dateTime,as.numeric(gsub("\\.","",subPowerData$Global_reactive_power))/1000,type="l", xlab="datetime", ylab="Global_reactive_power")
    
    
    dev.off()

}