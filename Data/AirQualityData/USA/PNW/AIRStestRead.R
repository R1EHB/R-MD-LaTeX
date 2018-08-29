# An R Script
# Erik Beck
# August 22, 2018
# Read and minimally process air quality data (PM2.5) from AIRS Pre-Digested Data Set



# Get needed libraries
library(lubridate)

# Set working Directory
setwd("C:/Users/EBECK/OneDrive - Environmental Protection Agency (EPA)/Sync4OneDrive/ReproducibleResearch/Sept2018Class/R-MD-LaTeX/Data/AirQualityData/USA/PNW")

# Read in the AIRS Data Set for PM2.5 (88101)
usaPM1999 <-read.csv (file="daily_88101_1999.csv", header=TRUE, sep=",")

usaPM2000 <-read.csv (file="daily_88101_2000.csv", header=TRUE, sep=",")
usaPM2001 <-read.csv (file="daily_88101_2001.csv", header=TRUE, sep=",")
usaPM2002 <-read.csv (file="daily_88101_2002.csv", header=TRUE, sep=",")
usaPM2003 <-read.csv (file="daily_88101_2003.csv", header=TRUE, sep=",")
usaPM2004 <-read.csv (file="daily_88101_2004.csv", header=TRUE, sep=",")
usaPM2005 <-read.csv (file="daily_88101_2005.csv", header=TRUE, sep=",")
usaPM2006 <-read.csv (file="daily_88101_2006.csv", header=TRUE, sep=",")
usaPM2007 <-read.csv (file="daily_88101_2007.csv", header=TRUE, sep=",")
usaPM2008 <-read.csv (file="daily_88101_2008.csv", header=TRUE, sep=",")
usaPM2009 <-read.csv (file="daily_88101_2009.csv", header=TRUE, sep=",")

usaPM2010 <-read.csv (file="daily_88101_2010.csv", header=TRUE, sep=",")
usaPM2011 <-read.csv (file="daily_88101_2011.csv", header=TRUE, sep=",")
usaPM2012 <-read.csv (file="daily_88101_2012.csv", header=TRUE, sep=",")
usaPM2013 <-read.csv (file="daily_88101_2013.csv", header=TRUE, sep=",")
usaPM2014 <-read.csv (file="daily_88101_2014.csv", header=TRUE, sep=",")
usaPM2015 <-read.csv (file="daily_88101_2015.csv", header=TRUE, sep=",")
usaPM2016 <-read.csv (file="daily_88101_2016.csv", header=TRUE, sep=",")
usaPM2017 <-read.csv (file="daily_88101_2017.csv", header=TRUE, sep=",")
usaPM2018 <-read.csv (file="daily_88101_2018.csv", header=TRUE, sep=",")


# Variable List

# colnames(usaPM1999)
# colnames(usaPM2000)

# [1] "State.Code"          "County.Code"         "Site.Num"           
# [4] "Parameter.Code"      "POC"                 "Latitude"           
# [7] "Longitude"           "Datum"               "Parameter.Name"     
# [10] "Sample.Duration"     "Pollutant.Standard"  "Date.Local"         
# [13] "Units.of.Measure"    "Event.Type"          "Observation.Count"  
# [16] "Observation.Percent" "Arithmetic.Mean"     "X1st.Max.Value"     
# [19] "X1st.Max.Hour"       "AQI"                 "Method.Code"        
# [22] "Method.Name"         "Local.Site.Name"     "Address"            
# [25] "State.Name"          "County.Name"         "City.Name"          
# [28] "CBSA.Name"           "Date.of.Last.Change"


# Append data sets

# Test

usaPMcombo <- rbind (usaPM1999,
	   usaPM2000,usaPM2001,usaPM2002,usaPM2003,usaPM2004,usaPM2005,     
	   usaPM2006,usaPM2007,usaPM2008,usaPM2009,
	   usaPM2010,usaPM2011,usaPM2012,usaPM2013,usaPM2014,usaPM2015,
	   usaPM2016,usaPM2017,usaPM2018) 
# Parse dates

usaPMcombo$Date <- parse_date_time (usaPMcombo$Date.Local, tz="America/Chicago",orders="ymd")
saveRDS(usaPMcombo, file = "PM25_data-big.rds")

# Now delete the variables we don't want

# Variables to keep; create a vector

NiftyVars <- c("State.Code", "Site.Num", "Latitude", "Longitude","Parameter.Name","Date.Local","Arithmetic.Mean","State.Name","City.Name")

SlimUSApm <- usaPMcombo[NiftyVars]

# Save the slim USA data set
 saveRDS (SlimUSApm, file = "PM25_data_USslim.rds")


# Now separate out the Pacific Northwest States

# newdata <- subset(mydata, age >= 20 | age < 10, select=c(ID, Weight))

WashingtonPM25 <- subset (SlimUSApm, State.Name == "Washington")
OregonPM25 <- subset (SlimUSApm, State.Name == "Oregon")
IdahoPM25 <- subset (SlimUSApm, State.Name == "Idaho")
MontanaPM25 <- subset (SlimUSApm, State.Name == "Montana")

PNWpm25 <- rbind (WashingtonPM25, OregonPM25, IdahoPM25, MontanaPM25)

plot(PNWpm25$Date.Local,PNWpm25$Arithmetic.Mean)


# Save the PNW Data Sets

saveRDS (WashingtonPM25, file = "WashingtonPM25.rds")
saveRDS (OregonPM25, file = "OregonPM25.rds")
saveRDS (IdahoPM25, file = "IdahoPM25.rds")
saveRDS (MontanaPM25, file = "MontanaPM25.rds")

saveRDS (PNWpm25, file = "PNW_PM25.rds")