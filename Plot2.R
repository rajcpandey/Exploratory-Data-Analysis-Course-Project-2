# Exploratory Data Analysis - Course Project 2 - Peer graded assignment
# Plot2.R
# Developed by - Raj Kumar Pandey
# Date - 27/06/2020
# ------------------------------------------------------------------------------
library(dplyr)

# Read the two .rds files into memory

NEI <- readRDS("exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata_data_NEI_data/Source_Classification_Code.rds")

NEI.Maryland <- subset(NEI, fips == "24510")

# Aggregate data

NEI.Maryland.by.Year <- NEI.Maryland %>% group_by(year) %>% summarise(Emmisions = sum(Emissions))
# ignoring the warning

# Addressing question 2 - Have total emissions from PM2.5 decreased in the 
# Baltimore City, Maryland (\color{red}{\verb|fips == "24510"|}fips == "24510") 
# from 1999 to 2008? Use the base plotting system to make a plot answering this 
# question.

# Define device, set characteristics and plot
png("plot2.png")

plot(NEI.Maryland.by.Year$year, NEI.Maryland.by.Year$Emmisions, type='l', ylab='Emissions', xlab='Year', col = NEI.Maryland.by.Year$year)

# set the device off and back to the default screen device
dev.off()