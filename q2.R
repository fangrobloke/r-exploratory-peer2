#### read file ####
NEI = readRDS("summarySCC_PM25.rds")
SCC = readRDS("Source_Classification_Code.rds")
names(NEI)

#### Q2 ####
## crate dataframe
library(dplyr)
nei = tbl_df(NEI)

## solve problem
tt_e = subset(nei, fips == "24510")
mary_tt_e = tt_e %>% group_by(year) %>% summarise(total_emission=sum(Emissions,na.rm=T))
## plot graph
plot(mary_tt_e,type='l',main="Total for Baltimore City PM2.5Emissions by Year", lwd = 3, col = 'green'
     , ylab = "TotalPM2.5Emissions (tons)")
