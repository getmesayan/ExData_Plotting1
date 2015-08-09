#Its assumed that we have manually been able to download the file
#and unzipped it in our working directory

load_data <- function( fileName )
{
  df_all <- read.table('household_power_consumption.txt', header=TRUE,
                  sep=';', na.strings='?',
                  colClasses=c(rep('character', 2), 
                               rep('numeric', 7)))

  #Filter Valid dates
  #We are assuming that since these has been read as characters
  #the below formats work
  df_filtered <- subset(df_all, Date %in% c('2/2/2007', '1/2/2007') )
  
  # convert Date and Time variables to Date/Time classes
  df_filtered$Date <- as.Date(df_filtered$Date , "%d/%m/%Y")
  df_filtered$Time <- paste(df_filtered$Date, df_filtered$Time, sep=" ")
  df_filtered$Time <- strptime(df_filtered$Time, "%Y-%m-%d %H:%M:%S")
  df_filtered
}


