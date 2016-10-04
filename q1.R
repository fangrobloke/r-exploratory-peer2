#### read file ####
NEI = readRDS("summarySCC_PM25.rds")
SCC = readRDS("Source_Classification_Code.rds")
names(NEI)

#### Q1 ####
## crate dataframe
library(dplyr)
nei = tbl_df(NEI)
## solve problem
total_E = nei %>% group_by(year) %>%
  summarise(total_emission=sum(Emissions,na.rm=T))
## plot graph
plot(total_E,type='l',main="Total US PM2.5Emissions by Year", lwd = 3, col = 'blue'
     , ylab = "TotalPM2.5Emissions (tons)")


#4Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? Which have seen increases in emissions from 1999-2008? Use the ggplot2 plotting system to make a plot answer this question.
#5Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?
#6How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?
#7Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?