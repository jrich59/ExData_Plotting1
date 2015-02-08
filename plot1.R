# household power consumption plot 1

# This script plots a histogram of the global active power between February 1, 2007
# and February 2, 2007

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

# Create the png device (plot1.png) of size 480x480 and a transparant background
png("plot1.png", width=480, height=480, bg=NA)

# set the colnames to the variables read in
colnames(householdpower) <- names(householdpowervars)

# Create a histogram of the Global Active Power, using Red as the color,
# and set the main label and x-axis label
hist(householdpower$Global_active_power, col="red",
     main="Global Active Power",
     xlab="Global Active Power (killowatts)")

# Close and Save the png file
dev.off()