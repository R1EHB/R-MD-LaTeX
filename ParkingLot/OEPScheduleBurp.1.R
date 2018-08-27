# Preamble
# Load knitr
require(knitr)

# Read in the CSV File
OEPrecords <- read.csv (file = "Z:/Data/RecordsReductionRedux/Iterated.2.OEP_ProposedRecordsScheduleChart.tiered.csv")

# Write a CSV file to check on how R is pulling in the data
write.csv (OEPrecords, file = "Z:/Data/RecordsReductionRedux/recordsDumPtest.csv")

# Write variables for ease of use later
head(OEPrecords)

# Create a more compact version for All OEP
OEPrecs<-subset(OEPrecords,select=c(Current_Records_Schedule,Title,Function,Note1,Note2,Note3,Note4,Note5))

# Create dataframes for the branches

# Division-Wide
# Already Created
# Now make table
kable(OEPrecs, caption = "OEP Division-Wide Records Schedule")

# Immediate Office (Immediate_Office)

OEP_IO <-subset(OEPrecords, select=c(Immediate_Office,Current_Records_Schedule,Title,Function,Note1,Note2,Note3,Note4,Note5))
OEP_IO_Iso <- OEP_IO[(OEP_IO$Immediate_Office==1),]
# head (OEP_IO_Iso)
OEP_IO_Table <- subset(OEP_IO_Iso, select=c(Current_Records_Schedule,Title,Function,Note1,Note2,Note3,Note4,Note5))
kable(OEP_IO_Table, caption = "OEP Immediate Office Records Schedule")

# Air (Air_Program)

OEP_Air <- subset(OEPrecords, select=c(Air_Program,Current_Records_Schedule,Title,Function,Note1,Note2,Note3,Note4,Note5))
OEP_Air_Iso <- OEP_Air[(OEP_Air$Air_Program==1),]
# head (OEP_Air_Iso)
OEP_Air_Table <- subset(OEP_Air_Iso, select=c(Current_Records_Schedule,Title,Function,Note1,Note2,Note3,Note4,Note5))
kable(OEP_Air_Table, caption = "OEP Air Branch Records Schedule")


# Wetlands (Wetlands_Water_Quality_and_Information_Branch)

OEP_Wetlands <- subset(OEPrecords, select=c(Wetlands_Water_Quality_and_Information_Branch,Current_Records_Schedule,Title,Function,Note1,Note2,Note3,Note4,Note5))
OEP_Wetlands_Iso <- OEP_Wetlands[(OEP_Wetlands$Wetlands_Water_Quality_and_Information_Branch==1),]
# head (OEP_Wetlands_Iso)
OEP_Wetlands_Table <- subset(OEP_Wetlands_Iso, select=c(Current_Records_Schedule,Title,Function,Note1,Note2,Note3,Note4,Note5))
kable(OEP_Wetlands_Table, caption = "OEP Wetlands, Water Quality, and Information Branch Records Schedule")

# Grants and SRF (Grants_Tribal_Community_Municipal_Assistance_Branch)
OEP_Grants <- subset(OEPrecords, select=c(Grants_Tribal_Community_Municipal_Assistance_Branch,Current_Records_Schedule,Title,Function,Note1,Note2,Note3,Note4,Note5))
OEP_Grants_Iso <- OEP_Grants[(OEP_Grants$Grants_Tribal_Community_Municipal_Assistance_Branch==1),]
# head (OEP_Grants_Iso)
OEP_Grants_Table <- subset (OEP_Grants_Iso, select=c(Current_Records_Schedule,Title,Function,Note1,Note2,Note3,Note4,Note5))
kable(OEP_Grants_Table, caption = "OEP Grants, Tribal, and Community Municipal Assistance Branch Records Schedule")

# Water Permits Branch (Water_Permits_Branch)
OEP_NPDES <- subset(OEPrecords, select=c(Water_Permits_Branch,Current_Records_Schedule,Title,Function,Note1,Note2,Note3,Note4,Note5))
OEP_NPDES_Iso <- OEP_NPDES[(OEP_NPDES$Water_Permits_Branch==1),]
# head (OEP_NPDES_Table)
OEP_NPDES_Table <- subset (OEP_NPDES_Iso, select=c(Current_Records_Schedule,Title,Function,Note1,Note2,Note3,Note4,Note5))
kable(OEP_NPDES_Table, caption = "OEP Water Permits Branch (NPDES) Records Schedule")

# Surface Water Branch (Surface_Water_Oceans_Branch)
OEP_SWB <- subset(OEPrecords, select=c(Surface_Water_Oceans_Branch,Current_Records_Schedule,Title,Function,Note1,Note2,Note3,Note4,Note5))
OEP_SWB_Iso <- OEP_SWB[(OEP_SWB$Surface_Water_Oceans_Branch==1),]
# head (OEP_SWB_Iso)
OEP_SWB_Table <- subset(OEP_SWB_Iso, select=c(Current_Records_Schedule,Title,Function,Note1,Note2,Note3,Note4,Note5))
kable(OEP_SWB_Table, caption = "OEP Surface Water and Oceans Branch Records Schedule")


# Drinking Water Branch (Drinking_Water_Branch)
OEP_DrinkB <- subset(OEPrecords, select=c(Drinking_Water_Branch,Current_Records_Schedule,Title,Function,Note1,Note2,Note3,Note4,Note5))
OEP_DrinkB_Iso <- OEP_DrinkB[(OEP_DrinkB$Drinking_Water_Branch==1),]
# head (OEP_DrinkB_Iso)
OEP_DrinkB_Table <- subset (OEP_DrinkB_Iso, select=c(Current_Records_Schedule,Title,Function,Note1,Note2,Note3,Note4,Note5))
kable(OEP_DrinkB_Table, caption = "OEP Drinking Water Branch Records Schedule")

# List of variables

# Current_Records_Schedule
# Title
# Function
# Note1
# Note2
# Note3
# Note4
# Note5

