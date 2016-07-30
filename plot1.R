plot1 <- function() {
        # First load the data, assuming the correct file is in the working directory
        # Setting up the column names beforehand also
        colnames<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
        
        # Read the csv
        allpowerdata<-read.csv("household_power_consumption.txt", header=F,skip=1,sep=";",col.names=colnames, na.strings="?")
        
        # Now, subset for the dates of interest
        mypowerdata<-allpowerdata[allpowerdata$Date=="1/2/2007" | allpowerdata$Date=="2/2/2007",]
        
        # reading in a pre-prepared file; used for development
        #mypowerdata<-read.csv("sub_power_consumption.txt")
        
        # Set up and create the plot
        png(filename="plot1.png", width=480, height=480)
        par(mfrow=c(1,1))
        with(mypowerdata, hist(Global_active_power, main="Global Active Power", ylab="Frequency", xlab="Global Active Power (kilowatts)",col="red"))
        dev.off()
        }
