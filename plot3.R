
# common.R contains download_and_unzip_data_file() and load_data()
source("common.R")

# only load the data file if it is not already loaded
if ( ! exists("data") )
{
  data_file <- download_and_unzip_data_file()
  data <- load_data( data_file )    
}

png(filename = "plot3.png")
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
dev.off()
