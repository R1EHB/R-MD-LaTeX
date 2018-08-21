# An R Script
# Erik Beck
# August 21, 2018
# Read and minimally process Mystic River Buoy Data from CSV Files



# Get needed libraries
library(lubridate)

# Set working Directory

#setwd("C:/Users/EBECK/OneDrive - Environmental Protection Agency (EPA)/Sync4OneDrive/ReproducibleResearch/Sept2018Class/DataFutz/WaterQuality/MysticRiverWatershed/MysticRiverBuoy")

setwd("C:/Users/EBECK/OneDrive - Environmental Protection Agency (EPA)/Sync4OneDrive/ReproducibleResearch/Sept2018Class/R-MD-LaTeX/Data/WaterQualityData/MysticRiverBuoy")

# Read in the Mystic River Watershed Buoy historical data sets (US EPA R1)
MysticalBuoy15 <-read.csv (file="mrbuoy2015_ModEHB.csv", header=TRUE, sep=",")
MysticalBuoy16 <-read.csv (file="mrbuoy2016_ModEHB.csv", header=TRUE, sep=",")
MysticalBuoy17 <-read.csv (file="mrbuoy2017_ModEHB.csv", header=TRUE, sep=",")


# Variable List

#  date     time temp_celsius spcond_msPERcm   ph do_mgPerL do_Percent
#  turbidity_fnu chlorophyll_rfu phycocyanin_rfu sysbattery_volts



# Deal with Date and Time Strings

# Example

  # parse_date_time("09/24/2014 15-23-10", orders="mdy hms")

ComboDate15 <- paste(MysticalBuoy15$date, MysticalBuoy15$time, sep=" ", collapse = NULL)
ComboDate16 <- paste(MysticalBuoy15$date, MysticalBuoy16$time, sep=" ", collapse = NULL)
ComboDate17 <- paste(MysticalBuoy15$date, MysticalBuoy17$time, sep=" ", collapse = NULL)

MysticalBuoy15$LocalDateTime <- parse_date_time (ComboDate15, tz="America/New_York",orders="mdy hms")
MysticalBuoy16$LocalDateTime <- parse_date_time (ComboDate16, tz="America/New_York",orders="mdy hms")
MysticalBuoy17$LocalDateTime <- parse_date_time (ComboDate17, tz="America/New_York",orders="mdy hms")


# Append data sets

MysticalBuoy <- rbind (MysticalBuoy15, MysticalBuoy16, MysticalBuoy17)

# drop the negative voltage reading by recoding to NA

MysticalBuoy$sysbattery_volts[MysticalBuoy$sysbattery_volts < 0] <-NA

plot (MysticalBuoy$LocalDateTime, MysticalBuoy$sysbattery_volts)




