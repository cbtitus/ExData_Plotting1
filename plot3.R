plot3 <- function() {
        # First load the data, assuming the correct file is in the working directory
        # Setting up the column names beforehand also
        colnames<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
        
        # Read the csv
        allpowerdata<-read.csv("household_power_consumption.txt", header=F,skip=1,sep=";",col.names=colnames, na.strings="?")
        
        # Now, subset for the dates of interest
        mypowerdata<-allpowerdata[allpowerdata$Date=="1/2/2007" | allpowerdata$Date=="2/2/2007",]
        
        # reading in a pre-prepared file; used for development
        #mypowerdata<-read.csv("sub_power_consumption.txt")
        
        # Create a datetime column, and convert to POSIXlt
        datetime<-strptime(paste(mypowerdata$Date,mypowerdata$Time),"%d/%m/%Y %H:%M:%S")
        mypowerdata<-data.frame(mypowerdata,datetime)
        
        # Set up and create the plot
        png(filename="plot3.png", width=480, height=480)
        par(mfrow=c(1,1))
        with(mypowerdata, plot(datetime, Sub_metering_1, ylab="Energy sub metering", xlab="", type="n"))
        with(mypowerdata, lines(datetime, Sub_metering_1, col="Black"))
        with(mypowerdata, lines(datetime, Sub_metering_2, col="Red"))
        with(mypowerdata, lines(datetime, Sub_metering_3, col="Blue"))
        legend(x="topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("Black","Red","Blue"))
        
        dev.off()
        }
