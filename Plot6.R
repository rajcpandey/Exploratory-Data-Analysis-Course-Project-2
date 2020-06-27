# Exploratory Data Analysis - Course Project 2 - Peer graded assignment
# Plot6.R
# Developed by - Raj Kumar Pandey
# Date - 27/06/2020
# ------------------------------------------------------------------------------
library(dplyr)
library(ggplot2)

# Read the two .rds files into memory

NEI <- readRDS("exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata_data_NEI_data/Source_Classification_Code.rds")

# Merge the tow data frames on column SCC
NEI.SCC <- merge(NEI, SCC, by="SCC")

# Filter all rows for Baltimore City and emission from vehicle 
NEI.SCC.Moter.Baltimore <- NEI.SCC %>% filter(type == "ON-ROAD" & (fips == "24510" | fips == "06037"))

# Aggregate data

NEI.SCC.Moter.Baltimore.by.Year <- NEI.SCC.Moter.Baltimore %>% group_by(year, fips) %>% summarise(Emmisions = sum(Emissions))
# ignoring the warning

# Addressing question 6 - Compare emissions from motor vehicle sources in 
# Baltimore City with emissions from motor vehicle sources in Los Angeles 
# County, California (\color{red}{\verb|fips == "06037"|}fips == "06037"). 
# Which city has seen greater changes over time in motor vehicle emissions?

# Define device, set characteristics and plot
png("plot6.png")

ggplot(data = NEI.SCC.Moter.Baltimore.by.Year, aes(x = year, y = Emmisions, col = fips)) + xlab("Year") + geom_point() + ylab("Emissions") + geom_line() + theme_bw() +theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) + ggtitle("Emissions from coal combustion-related sources accross USA")

# set the device off and back to the default screen device
dev.off()