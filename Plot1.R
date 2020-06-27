# Exploratory Data Analysis - Course Project 2 - Peer graded assignment
# Plot1.R
# Developed by - Raj Kumar Pandey
# Date - 27/06/2020
# ------------------------------------------------------------------------------
library(dplyr)

# Read the two .rds files into memory

NEI <- readRDS("exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata_data_NEI_data/Source_Classification_Code.rds")

# Aggregate data

NEI.by.Year <- NEI %>% group_by(year) %>% summarise(Emmisions = sum(Emissions))
# ignoring the warning

# Addressing question 1 - Have total emissions from PM2.5 decreased in the United 
# States from 1999 to 2008? Using the base plotting system, make a plot showing 
# the total PM2.5 emission from all sources for each of the years 1999, 2002, 
# 2005, and 2008.

# Define device, set characteristics and plot
png("plot1.png")

plot(NEI.by.Year$year, NEI.by.Year$Emmisions, type='l', ylab='Emissions', xlab='Year', col = NEI.by.Year$year)

# set the device off and back to the default screen device
dev.off()