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