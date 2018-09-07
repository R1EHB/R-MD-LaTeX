# An R Script
# Erik Beck
# August 30, 2018
# Read and minimally process air quality data (PM2.5) from 2018 files through mid-August 2018
# Montana, Washington, Oregon, and Idaho


# Get needed libraries
library(lubridate)

# Set working Directory
setwd("C:/Users/EBECK/OneDrive - Environmental Protection Agency (EPA)/Sync4OneDrive/ReproducibleResearch/Sept2018Class/DataFutz/PNW-Air/2018NorthWestUSA")

# Read in the chunks for Washington, Oregon, and Idaho for 2018

WaOrId1 <-read.csv (file="WaOrId-chunk1.csv", header=TRUE, sep=",")
WaOrId2 <-read.csv (file="WaOrId-chunk2.csv", header=TRUE, sep=",")
WaOrId3 <-read.csv (file="WaOrId-chunk3.csv", header=TRUE, sep=",")
WaOrId4 <-read.csv (file="WaOrId-chunk4.csv", header=TRUE, sep=",")

# Variable List
colnames (WaOrId1)
# [1] "Agency"        "Site"          "Site.AQS"      "Param"        
# [5] "Param.AQS"     "POC"           "Method"        "Duration"     
# [9] "Date..LST."    "Unit"          "Concentration"

# Combine the four chunks

WaOrId <- rbind (WaOrId1, WaOrId2, WaOrId3, WaOrId4)

# Fix the dates

WaOrId$Date <-  parse_date_time (WaOrId$Date..LST., tz="America/Los_Angeles",orders="mdy")

# Create a state variable from the Agency variable

# factor (WaOrId$Agency)
WaOrId$State <- NA

WaOrId$State[WaOrId$Agency=='WA1'] <- 'WA'
WaOrId$State[WaOrId$Agency=='CR1'] <- 'WA'
WaOrId$State[WaOrId$Agency=='ID1'] <- 'ID'
WaOrId$State[WaOrId$Agency=='OR1'] <- 'OR'
WaOrId$State[WaOrId$Agency=='OR2'] <- 'OR'

# Read in the chunk for Montana for 2018

Montana18 <- read.csv (file="montana2018PMfine.csv", header=TRUE, sep=",")



# colnames (Montana18)
#[1] "Site.Site.AQS.Param.POC" "Date.LST"               
#[3] "ugPerMeter3"            

# Parse out the first column of data in the Montana18 dataset
# Looks like:

# Site/Site AQS/Param/POC
# Billlings Lockw/301110087/PM2.5-88101/3

# Write out that column to CSV
write.csv (Montana18$Site.Site.AQS.Param.POC, file="MontanaTmp.csv")

# Do a search and replace with emacs on this file, saving to a new file

MontanaTmp <- read.csv (file="MontanaTmp2.csv", header=TRUE, sep=",")

colnames(MontanaTmp)
# [1] "Site"     "Site.AQS" "Param"    "POC"  


# Now combine Montana18 and MontanaTmp together to make MontanaClean18

MontanaClean18<-MontanaTmp
MontanaClean18$Concentration <- Montana18$ugPerMeter3
MontanaClean18$State.Code <- c("MT")
# MontanaClean18$Date.LST <- Montana18$Date.LST

# Fix dates

MontanaClean18$Date <- parse_date_time (Montana18$Date.LST, tz="America/Los_Angeles",orders="mdy")

# Drop concentration =-999 (missing value)
MontanaClean18$Concentration[MontanaClean18$Concentration==-999] <-NA

# plot (MontanaClean18$Date, MontanaClean18$Concentration)

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


# Equalize the variable names, reduce variable numbers, and join the Montana data with the WA-OR-ID data.

W <- nrow (WaOrId)
M <- nrow (MontanaClean18)

WaOrId_Temp <- data.frame (dummy = rnorm(W))
MontanaNew  <- data.frame (dummy = rnorm(M))

WaOrId_Temp$State <- WaOrId$State
MontanaNew$State <- MontanaClean18$State.Code

WaOrId_Temp$Date <- WaOrId$Date
MontanaNew$Date <- MontanaClean18$Date

WaOrId_Temp$PM25value <- WaOrId$Concentration
MontanaNew$PM25value <- MontanaClean18$Concentration

WaOrId_Temp$SiteName <- WaOrId$Site
MontanaNew$SiteName <- MontanaClean18$Site

# Now make a new set for all PNW18 PM

PNW18pm25 <- rbind (WaOrId_Temp, MontanaNew)

# Drop concentration =-999 (missing value)
PNW18pm25$PM25value[PNW18pm25$PM25value==-999] <-NA

plot (PNW18pm25$Date, PNW18pm25$PM25value)

# Write out these 2018 state and combo files

saveRDS (WaOrId_Temp, file = "WaOrId2018.rds")
saveRDS (MontanaNew,  file = "Montana2018.rds")
saveRDS (PNW18pm25,   file = "PNW18.rds")

