# Libraries ---------------------------------------------------------------



# Data --------------------------------------------------------------------
# Download data
download.file("http://www.esapubs.org/archive/ecol/E096/269/Data_Files/Amniote_Database_Aug_2015.csv
", "./data/Amniote_Database_Aug_2015.csv")

# To know more about the database go to:
# http://www.esapubs.org/archive/ecol/E096/269/

# Read data
Amniote<-read.csv("./data/Amniote_Database_Aug_2015.csv")

# Explore data
# View(Amniote)
# Note that Null values are listed as -999

# Replace -999 for NAs
Amniote[Amniote==-999]<-NA


