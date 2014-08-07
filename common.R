
load_data <- function( data_file ) 
{
  dates_to_select <- c( "1/2/2007", "2/2/2007" )
    
  raw_data <- read.delim( data_file, sep = ";", na.strings = "?" )
  data_subset <- subset( raw_data, Date %in% dates_to_select )
  
  data_subset$Time <- strptime(paste( data_subset$Date, data_subset$Time ), format="%d/%m/%Y %T")
  data_subset$Date <- as.Date(data_subset$Date, format="%d/%m/%Y")
  
  data_subset
}

download_and_unzip_data_file <- function() 
{
  if ( ! file.exists("data") ) 
  {
    dir.create("data")
  }
  
  setwd("data")
  
  if ( ! file.exists("household_power_consumption.txt") ) 
  {
    if ( ! file.exists("exdata-data-household_power_consumption.zip") ) 
    {
      download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "exdata-data-household_power_consumption.zip", "curl")
    }
    
    unzip("exdata-data-household_power_consumption.zip")
  }
  
  setwd("..")
  
  "data/household_power_consumption.txt"
}
