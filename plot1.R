
# common.R contains download_and_unzip_data_file() and load_data()
source("common.R")

# only load the data file if it is not already loaded
if ( ! exists("data") )
{
  data_file <- download_and_unzip_data_file()
  data <- load_data( data_file )    
}

png(filename = "plot1.png")
hist( data$Global_active_power, 
      col = "red",
      main = "Global Active Power",
      xlab = "Global Active Power (kilowatts)" )
dev.off()
