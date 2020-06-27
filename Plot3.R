# Exploratory Data Analysis - Course Project 2 - Peer graded assignment
# Plot3.R
# Developed by - Raj Kumar Pandey
# Date - 27/06/2020
# ------------------------------------------------------------------------------
library(dplyr)
library(ggplot2)

# Read the two .rds files into memory

NEI <- readRDS("exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata_data_NEI_data/Source_Classification_Code.rds")

NEI.Maryland <- subset(NEI, fips == "24510")

# Aggregate data

NEI.Maryland.by.Year <- NEI.Maryland %>% group_by(year, type) %>% summarise(Emmisions = sum(Emissions))

# ignoring the warning

# Addressing question 3 - Of the four types of sources indicated by the 
# \color{red}{\verb|type|}type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999–2008 
# for Baltimore City? Which have seen increases in emissions from 1999–2008? 
# Use the ggplot2 plotting system to make a plot answer this question.

# Define device, set characteristics and plot
png("plot3.png")

ggplot(data = NEI.Maryland.by.Year, aes(x = year, y = Emmisions, col =type)) + xlab("Year") + geom_point() + ylab("Emissions") + geom_line() + theme_bw() +theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) + ggtitle("Emission in Baltimore City")

# set the device off and back to the default screen device
dev.off()