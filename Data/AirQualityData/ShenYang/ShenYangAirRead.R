# An R Script
# Erik Beck
# August 21, 2018

# Get needed libraries
library(lubridate)

# Set working Directory
setwd("C:/Users/EBECK/OneDrive - Environmental Protection Agency (EPA)/Sync4OneDrive/ReproducibleResearch/Sept2018Class/DataFutz/China-Air/Shenyang")

# Read in the Shenyang historical data sets (US State Dept)
ShenyangPM13 <-read.csv (file="Shenyang_2013_HourlyPM25_ModEHB.csv", header=TRUE, sep=",")
ShenyangPM14 <-read.csv (file="Shenyang_2014_HourlyPM25_ModEHB.csv", header=TRUE, sep=",")
ShenyangPM15 <-read.csv (file="Shenyang_2015_HourlyPM25_ModEHB.csv", header=TRUE, sep=",")
ShenyangPM16 <-read.csv (file="Shenyang_2016_HourlyPM25_ModEHB.csv", header=TRUE, sep=",")
ShenyangPM17 <-read.csv (file="Shenyang_2017_HourlyPM25_ModEHB.csv", header=TRUE, sep=",")

# Variable List
# Site	Parameter	Date_LST	Year	Month	Day	Hour	Value	Unit	Duration	QC_Name


# Quick Check of the Data

colnames(ShenyangPM13)
colnames(ShenyangPM14)
colnames(ShenyangPM15)
colnames(ShenyangPM16)
colnames(ShenyangPM17)

# Append data sets

# Test

ShenyangTest <- rbind (ShenyangPM13,ShenyangPM14,ShenyangPM15,ShenyangPM16,ShenyangPM17)

# head (ShenyangTest)


# Next fix date values to sensible UTC

ShenyangTest$SampleLocalTime <- mdy_hms(ShenyangTest$Date_LST, quiet = FALSE, tz = "Asia/Shanghai", truncated = 0)
ShenyangTest$SampleUTC <- with_tz (ShenyangTest$SampleLocalTime, tzone = "UTC")


# Recode -999 to missing for ShenyangTest$Value
ShenyangTest$Value[ShenyangTest$Value==-999] <-NA

plot(ShenyangTest$SampleUTC,ShenyangTest$Value)



