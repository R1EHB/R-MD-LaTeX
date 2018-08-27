# An R Script
# Erik Beck
# August 22, 2018
# Read and minimally process Charles River Buoy Data from CSV Files



# Get needed libraries
library(lubridate)

# Set working Directory
setwd("C:/Users/EBECK/OneDrive - Environmental Protection Agency (EPA)/Sync4OneDrive/ReproducibleResearch/Sept2018Class/DataFutz/WaterQuality/CharlesRiver")

# Read in the Mystic River Watershed Buoy historical data sets (US EPA R1)
CharlesBuoy15 <-read.csv (file="crbuoy2015_ModEHB.csv", header=TRUE, sep=",")
CharlesBuoy16 <-read.csv (file="crbuoy2016_ModEHB.csv", header=TRUE, sep=",")
CharlesBuoy17 <-read.csv (file="crbuoy2017_ModEHB.csv", header=TRUE, sep=",")
CharlesBuoy18a <-read.csv (file="crbuoy.2018.flaky_ModEHB.csv", header=TRUE, sep=",")


# Variable List

#  date     time temp_celsius spcond_msPERcm   ph do_mgPerL do_Percent
#  turbidity_fnu chlorophyll_rfu phycocyanin_rfu sysbattery_volts



# Deal with Date and Time Strings

# Example

  # parse_date_time("09/24/2014 15-23-10", orders="mdy hms")

ComboDate15 <- paste(CharlesBuoy15$date, CharlesBuoy15$time, sep=" ", collapse = NULL)
ComboDate16 <- paste(CharlesBuoy16$date, CharlesBuoy16$time, sep=" ", collapse = NULL)
ComboDate17 <- paste(CharlesBuoy17$date, CharlesBuoy17$time, sep=" ", collapse = NULL)
ComboDate18a <- paste(CharlesBuoy18a$date, CharlesBuoy18a$time, sep=" ", collapse = NULL)

CharlesBuoy15$LocalDateTime <- parse_date_time (ComboDate15, tz="America/New_York",orders="mdy hms")
CharlesBuoy16$LocalDateTime <- parse_date_time (ComboDate16, tz="America/New_York",orders="mdy hms")
CharlesBuoy17$LocalDateTime <- parse_date_time (ComboDate17, tz="America/New_York",orders="mdy hms")
CharlesBuoy18a$LocalDateTime <- parse_date_time (ComboDate18a, tz="America/New_York",orders="mdy hms")

# Check Columns

# colnames(CharlesBuoy15)
# colnames(CharlesBuoy16)
# colnames(CharlesBuoy17)
# colnames(CharlesBuoy18a)

# Append data sets


CharlesBuoy <- rbind (CharlesBuoy15, CharlesBuoy16, CharlesBuoy17, CharlesBuoy18a)

# drop the negative voltage reading by recoding to NA

CharlesBuoy$sysbattery_volts[CharlesBuoy$sysbattery_volts < 0] <-NA

plot (CharlesBuoy$LocalDateTime, CharlesBuoy$sysbattery_volts)




