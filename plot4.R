
source("common.R")

if ( ! exists("data") )
{
  data_file <- download_and_unzip_data_file()
  data <- load_data( data_file )    
}

png(filename = "plot4.png")

# there will be 4 plots in this PNG
par( mfrow = c(2, 2) )

# plot 1
plot( data$Time, data$Global_active_power,
      type = "l",
      xlab = "",
      ylab = "Global Active Power" )

# plot 2
plot( data$Time, data$Voltage,
      type = "l",
      xlab = "datetime",
      ylab = "Voltage" )

# plot 3
plot( data$Time, data$Sub_metering_1,
      type = "l",
      xlab = "",
      ylab = "Energy sub metering" )
lines( data$Time, data$Sub_metering_2, col = "red" )
lines( data$Time, data$Sub_metering_3, col = "blue" )
legend( "topright",
        c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
        lty=1, 
        col=c("black", "red", "blue") )

# plot 4
plot( data$Time, data$Global_reactive_power,
      type = "l",
      xlab = "datetime",
      ylab = "Global_reactive_power" )

# Done with all plots
dev.off()
