# libraries ---------------------------------------------------------------
# library(tidyverse)

# 0. Download data -----------------------------------------------------------
# 0.1. Create a new Rproj
# 0.2. Create a folder "data/" to store your raw data
# 0.3. Download the data from https://ndownloader.figshare.com/files/2292169

# 1. Read data ---------------------------------------------------------------
# 1.1 Read data using your prefer read function (e.g., read.csv, read_csv, read.table)

# 2. Inspect data ------------------------------------------------------------
# 2.1. What is the class of the data, and the variables of the data?
# 2.2. What are the main dimensions of the data? (i.e., number of columns and rows)
# 2.3. Check the first and last 6 rows of the data
# 2.4. What are the main variables of the data?
# 2.5. Check the summary statistics for each column

# 3. Factors in R ------------------------------------------------------------
# 3.1. Convert the variables species_id, sex, genus into factors

# 4. Manipulate data ------------------------------------------------------------
# 4.1. Create a new object called "date" which includes the year, month and day columns
# 4.2. Create a new object called survey2000s which excludes the data before the year 2000
# 4.3. Create a new variable of weight with a natural log tranformation (i.e., log(weight))
# 4.4. Check the number of species, plots and the median hindfoot length in the dataframe
# 4.5. Compute the mean weight in kg by Genus
# 4.6. Calculate the number of records per year
# 4.7. Create a csv excluding the NAs of weight, and including only the species, genus, year and plot columns
