# Exploratory Data Analysis - Course Project 2 - Peer graded assignment
# Plot5.R
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

# Filter all rows where word Coal/coal/COAL has appeared 
NEI.SCC.Coal <- NEI.SCC[grepl("Coal|coal|COAL", NEI.SCC$Short.Name),]

# Aggregate data

NEI.SCC.Coal.by.Year <- NEI.SCC.Coal %>% group_by(year) %>% summarise(Emmisions = sum(Emissions))

# ignoring the warning

# Addressing question 5 - How have emissions from motor vehicle sources changed 
# from 1999–2008 in Baltimore City?

# Define device, set characteristics and plot
png("plot5.png")

ggplot(data = NEI.SCC.Coal.by.Year, aes(x = year, y = Emmisions)) + xlab("Year") + geom_point(col = "yellow") + ylab("Emissions") + geom_line(color = "yellow") + theme_bw() +theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) + ggtitle("Emissions from coal combustion-related sources accross USA")

# set the device off and back to the default screen device
dev.off()