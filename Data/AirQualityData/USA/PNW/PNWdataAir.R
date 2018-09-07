# An R Script
# Erik Beck
# September 3, 2018
# Revised September 7, 2018
# Read 1999-2017 Air Data (PM2.5) for the Pacific Northwest
# AQS Data Mart  PM2.5 (88101)
# Prep to analyze


library(lubridate)
# Set working Directory
# setwd("C:/Users/EBECK/OneDrive - Environmental Protection Agency (EPA)/Sync4OneDrive/ReproducibleResearch/Sept2018Class/R-MD-LaTeX/Data/AirQualityData/USA/PNW")

# setwd("C:/Users/EBECK/OneDrive - Environmental Protection Agency (EPA)/Sync4OneDrive/ReproducibleResearch/Sept2018Class/R-MD-LaTeX/AirQualityData/USA/PNW")


# Read 1999-2017 PNW Data Sets

WashingtonPM25 	 <- readRDS (file = "WashingtonPM25.rds")
OregonPM25 	 <- readRDS (file = "OregonPM25.rds")
IdahoPM25 	 <- readRDS (file = "IdahoPM25.rds")
MontanaPM25 	 <- readRDS (file = "MontanaPM25.rds")

PNWpm25a <- readRDS (file = "PNW_PM25.rds")

# colnames(WashingtonPM25)

# [1] "State.Code"      "Site.Num"        "Latitude"        "Longitude"      
# [5] "Parameter.Name"  "Date.Local"      "Arithmetic.Mean" "State.Name"     
# [9] "City.Name"      

colnames(MontanaPM25)

summary(PNWpm25a$Arithmetic.Mean)
summary(WashingtonPM25$Arithmetic.Mean)
summary(OregonPM25$Arithmetic.Mean)
summary(IdahoPM25$Arithmetic.Mean)
summary(MontanaPM25$Arithmetic.Mean)

plot (PNWpm25a$Date.Local, PNWpm25a$Arithmetic.Mean)


