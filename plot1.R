# Read the data


# Reading the data assumes the file "household_power_consumption.txt" is in the working directory
# "household_power_consumption.txt" can be acquired from: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip


hpc<-read.table(
  "household_power_consumption.txt",
  header=T, #There is a header
  sep=";", #Data seperater is ";"
  na.strings = "?", #value "?" == NA
  colClasses=c("character", "character", rep("numeric",7)) #force data formats on the columns
)

# wrangle the data
hpc$Date<-as.Date(hpc$Date, "%d/%m/%Y") #maked the Date a Date
hpc <- hpc[(hpc$Date>="2007-02-01" & hpc$Date<="2007-02-02"), ] #Subset on the date range of interest

# plot the data to a png graphics device (*.png file)

png(filename = "plot1.png", width=480, height=480)

hist(hpc$Global_active_power,
     col="red",     # set the color red
     main="Global Active Power", # the main title
     xlab="Global Active Power (kilowatts)"
     )

dev.off()