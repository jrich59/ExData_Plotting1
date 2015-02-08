# household power consumption plot 3
#
# this script plots the Sub_metering_1, Sub_metering_2 and the Sub_metering_3 
# variables based on the date and time in black, red, blue lines respectively. 
# It then then adds the appropriate legend

# Assume the household_power_consumption.txt was downloaded from
# the link:
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# and un-zipped.

# This graph is only interested in household power consumption between the days
# February 1, 2007 and February 2, 2007 so only the data from those 2 days will 
# be read in.

# Read the variable names first (header)
householdpowervars <- read.table("household_power_consumption.txt",
                                 header = TRUE,
                                 sep=";",
                                 nrows=1)

# Read only the data from 2/1/2007 to 2/2/2007
householdpower <- read.table("household_power_consumption.txt",
                             header = FALSE,
                             sep=";",
                             skip=66637,
                             nrows=2880,
                             na.strings = c("?"))

# Create the png device (plot3.png) of size 480x480 and a transparant background
png("plot3.png", width=480, height=480, bg=NA)

# set the colnames to the variables read in
colnames(householdpower) <- names(householdpowervars)

# Create a POSIXct variable datetime, which is a combination of the variables
# Date and Time
householdpower$datetime<-as.POSIXct(paste(householdpower$Date,householdpower$Time), 
                                    format="%d/%m/%Y %H:%M:%S")

# First plot the Sub_metering_1 variable based on the date and time, using black 
# lines as the plot type, and set the y label appropriately
with(householdpower, plot(datetime,
                          Sub_metering_1,
                          type="l", 
                          xlab="", 
                          ylab="Energy sub metering"))

# Next add the plot of the Sub_metering_3 variable based on the date and time
# over the previous plot with blue lines
with(householdpower, lines(datetime,
                          Sub_metering_2,
                          type="l", 
                          xlab="", 
                          col="red"))

# Next add the plot of datetime against the Sub_metering_3 variable over the
# previous plot with blue lines
with(householdpower, lines(datetime,
                           Sub_metering_3,
                           type="l", 
                           xlab="", 
                           col="blue"))

# Create the legend, and put it in the top right hand corner
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty=1)

# Close and save plot3.png
dev.off()

