library(lubridate)

#setwd("C:/Users/EBECK/OneDrive - Environmental Protection Agency (EPA)/Sync4OneDrive/ReproducibleResearch/Sept2018Class/Data/China-Air/Beijing")

# Read in the Beijing historical data sets (US State Dept)
BeijingPM08 <-read.csv (file="Beijing_2008_HourlyPM2.5_UTF8.csv", header=TRUE, sep=",", encoding="UTF-8")
BeijingPM09 <-read.csv (file="Beijing_2009_HourlyPM2.5_UTF8.csv", header=TRUE, sep=",", encoding="UTF-8")
BeijingPM10 <-read.csv (file="Beijing_2010_HourlyPM2.5_UTF8.csv", header=TRUE, sep=",", encoding="UTF-8")
BeijingPM11 <-read.csv (file="Beijing_2011_HourlyPM2.5_UTF8.csv", header=TRUE, sep=",", encoding="UTF-8")
BeijingPM12 <-read.csv (file="Beijing_2012_HourlyPM2.5_UTF8.csv", header=TRUE, sep=",", encoding="UTF-8")
BeijingPM13 <-read.csv (file="Beijing_2013_HourlyPM2.5_UTF8.csv", header=TRUE, sep=",", encoding="UTF-8")
BeijingPM14 <-read.csv (file="Beijing_2014_HourlyPM2.5_UTF8.csv", header=TRUE, sep=",", encoding="UTF-8")
BeijingPM15 <-read.csv (file="Beijing_2015_HourlyPM2.5_UTF8.csv", header=TRUE, sep=",", encoding="UTF-8")
BeijingPM16 <-read.csv (file="Beijing_2016_HourlyPM2.5_UTF8.csv", header=TRUE, sep=",", encoding="UTF-8")
BeijingPM17 <-read.csv (file="Beijing_2017_HourlyPM2.5_UTF8.csv", header=TRUE, sep=",", encoding="UTF-8")

# Variable List
# Site	Parameter	Date_LST	Year	Month	Day	Hour	Value	Unit	Duration	QC_Name


# Append data sets


BeijingTest <- rbind (BeijingPM08, BeijingPM09,BeijingPM10,BeijingPM11,BeijingPM12,BeijingPM13,BeijingPM14,BeijingPM15,BeijingPM16,BeijingPM17)

# Next fix date values to sensible UTC

# <- force_tz(datetime,"Europe/Paris"))

BeijingTest$SampleLocalTime <- mdy_hms(BeijingTest$Date_LST, quiet = FALSE, tz = "Asia/Shanghai", truncated = 0)
BeijingTest$SampleUTC <- with_tz (BeijingTest$SampleLocalTime, tzone = "UTC")


# Recode -999 to missing for BeijingTest$Value
BeijingTest$Value[BeijingTest$Value==-999] <-NA

summary(BeijingTest$Value)

plot(BeijingTest$SampleUTC,BeijingTest$Value)



