# An R Script
# Erik Beck
# August 21, 2018
# Read and minimally process air quality data (PM2.5) from US State Dept AirNow system
# Kolkata (Calcutta)


# Get needed libraries
library(lubridate)

# Set working Directory
setwd("C:/Users/EBECK/OneDrive - Environmental Protection Agency (EPA)/Sync4OneDrive/ReproducibleResearch/Sept2018Class/DataFutz/India-Air/Kolkata")

# Read in the Kolkata historical data sets (US State Dept)
KolkataPM15 <-read.csv (file="Kolkata_PM2.5_2015_ModEHB.csv", header=TRUE, sep=",")
KolkataPM16 <-read.csv (file="Kolkata_PM2.5_2016_ModEHB.csv", header=TRUE, sep=",")
KolkataPM17 <-read.csv (file="Kolkata_PM2.5_2017_ModEHB.csv", header=TRUE, sep=",")
KolkataPM18 <-read.csv (file="Kolkata_PM2.5_2018_ModEHB.csv", header=TRUE, sep=",")

head (KolkataPM15)


# Variable List

# Site Parameter Date_LT Year Month Day Hour NowCast AQI
# AQI_Category RawConc ConcUnit Duration QC_Name


# Quick Check of the Data

colnames(KolkataPM15)
colnames(KolkataPM16)
colnames(KolkataPM17)
colnames(KolkataPM18)

# Append data sets

# Test

KolkataTest <- rbind (KolkataPM15,KolkataPM16,KolkataPM17,KolkataPM18)

# head (KolkataTest)


# Next fix date values to sensible UTC

KolkataTest$SampleLocalTime <- mdy_hms(KolkataTest$Date_LT, quiet = FALSE, tz = "Asia/Kolkata", truncated = 0)
KolkataTest$SampleUTC <- with_tz (KolkataTest$SampleLocalTime, tzone = "UTC")


# Recode -999 to missing for KolkataTest$Value
KolkataTest$RawConc[KolkataTest$RawConc==-999] <-NA

plot(KolkataTest$SampleUTC,KolkataTest$RawConc)



