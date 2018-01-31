# libraries ---------------------------------------------------------------
library(tidyverse)


# Download data -----------------------------------------------------------
download.file("https://ndownloader.figshare.com/files/2292169",
              "data/portal_data_joined.csv")

# Read data -----------------------------------------------------------
dat_mammals<-read.csv("./data/portal_data_joined.csv")
head(dat_mammals)
plot(dat_mammals$sex)

dat_mammals<-read_csv("./data/portal_data_joined.csv")
plot(dat_mammals$sex)

dat_mammals$sex<-as.factor(dat_mammals$sex)
plot(dat_mammals$sex)


# Inspecting data ------------------------------------------------------------
# 1. summary


# Manipulating data ------------------------------------------------------------
summary(dat_mammals)

# 1. Selecting columns and filtering rows
# 2. Create new columns or variables
# 3. Split-apply-combine data analysis
# 4. summarize() function
# 5. Tallying
# 6. Reshaping data (gather and spread)
# 7. Export data
# 8. Pipes


