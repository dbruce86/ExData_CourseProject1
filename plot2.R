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
hpc$datetime<-as.POSIXct(paste(hpc$Date, hpc$Time), format="%Y-%m-%d %H:%M:%S", tz="America/Los_Angeles") #make a DateTime field out of the Date and Time fields

# plot the data to a png graphics device (*.png file)

png(filename = "plot2.png", width=480, height=480)

plot(hpc$Global_active_power~hpc$datetime,
     col="black",
     type="l",
     ylab="Global Active Power (kilowatts)",
     xlab=""
     )

dev.off()
