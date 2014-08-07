
# common.R contains download_and_unzip_data_file() and load_data()
source("common.R")

# only load the data file if it is not already loaded
if ( ! exists("data") )
{
  data_file <- download_and_unzip_data_file()
  data <- load_data( data_file )    
}

png(filename = "plot2.png")
plot( data$Time, data$Global_active_power,
      type = "l",
      xlab = "",
      ylab = "Global Active Power (kilowatts)" )
dev.off()
