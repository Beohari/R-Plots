# This section reads the data

powerdata <- read.table("./Power Data/household_power_consumption.txt", 
                        header = TRUE, col.names = c("Date", "Time", 
                                                     "Global Active Power", 
                                                     "Global Reactive Power", 
                                                     "Voltage", 
                                                     "Global Intensity", 
                                                     "Sub Metering 1", 
                                                     "Sub Metering 2", 
                                                     "Sub Metering 3"), sep=";",
                        colClasses = c("character", "character", "numeric", 
                                       "numeric", "numeric", "numeric", 
                                       "numeric", "numeric", "numeric"),
                        na.strings = c("?"))

powerdata$Date <- as.Date(powerdata$Date, format = "%d/%m/%Y")
relevantdata <- powerdata[which(powerdata$Date == "2007-02-01" | 
                                  powerdata$Date == "2007-02-02"),]

# This creates Plot 2

plot(as.numeric(relevantdata$Global.Active.Power),
     type = "l", xlab = "", ylab = "Global Active Power (kilowatts)",
     xaxt = "n")

axis(1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))