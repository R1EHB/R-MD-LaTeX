# An R Script
# Erik Beck
# July 2019
# Read and minimally process Lake Champlain water quality monitoring data
# --- From CSV file

# Adapted from R code to read Mystic River Buoy Data from CSV Files


# Get needed libraries
# library(lubridate)

# Set working Directory

setwd("A:/Sync4OneDrive/ReproducibleResearch/Github2019/R-MD-LaTeX/Data/WaterQualityData/LakeChamplain")

# Read in the Mystic River Watershed Buoy historical data sets (US EPA R1)

LCdata <-read.csv (file="LCmonitoringData.1992-2017.csv", header=TRUE, sep=",")

# Variable List

# LocationID VisitDate VisitNumber ActivityCategory StartTime +
# CollectionMethodID CharacteristicID AnalyticalMethodID Symbol Result +
# RemarkCode DepthStratumCode LabCode


# Deal with Date and Time Strings

# Example

  # parse_date_time("09/24/2014 15-23-10", orders="mdy hms")

# ComboDate15 <- paste(MysticalBuoy15$date, MysticalBuoy15$time, sep=" ", collapse = NULL)
# ComboDate16 <- paste(MysticalBuoy15$date, MysticalBuoy16$time, sep=" ", collapse = NULL)
# ComboDate17 <- paste(MysticalBuoy15$date, MysticalBuoy17$time, sep=" ", collapse = NULL)

# MysticalBuoy15$LocalDateTime <- parse_date_time (ComboDate15, tz="America/New_York",orders="mdy hms")
# MysticalBuoy16$LocalDateTime <- parse_date_time (ComboDate16, tz="America/New_York",orders="mdy hms")
# MysticalBuoy17$LocalDateTime <- parse_date_time (ComboDate17, tz="America/New_York",orders="mdy hms")


# Append data sets

# MysticalBuoy <- rbind (MysticalBuoy15, MysticalBuoy16, MysticalBuoy17)

# drop the negative voltage reading by recoding to NA

# MysticalBuoy$sysbattery_volts[MysticalBuoy$sysbattery_volts < 0] <-NA

# plot (MysticalBuoy$LocalDateTime, MysticalBuoy$sysbattery_volts)

# For later: Buoy URL
# https://www.epa.gov/sites/production/files/buckeye_symlinks/region1-buoys/mystic/mrbuoy.csv?0.772567037222714





