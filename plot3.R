plot3 <- function(){
    #parse the Data
    powerData <-read.delim("household_power_consumption.txt",header=TRUE,sep=";")
    
    #Subset the requested data
    subPowerData <- powerData[powerData$Date %in% c("1/2/2007","2/2/2007") ,]
    
    #Generate dateTime objects
    dateTime <- strptime(paste(subPowerData$Date,subPowerData$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
    
    
    #create png file
    png("plot3.png", width=480, height=480)
    
    with(subPowerData,plot(dateTime,(as.numeric(gsub("\\.","",subPowerData$Sub_metering_1))/1000),type="l",xlab="",ylab="Energy sub metering"))
    with(subPowerData,lines(dateTime,(as.numeric(gsub("\\.","",subPowerData$Sub_metering_2))/1000),col="red"))
    with(subPowerData,lines(dateTime,Sub_metering_3,col="blue"))
    
    
    legend("topright",lty=c(1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    
    dev.off()
}