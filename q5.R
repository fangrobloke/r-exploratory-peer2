#### read file ####
NEI = readRDS("summarySCC_PM25.rds")
SCC = readRDS("Source_Classification_Code.rds")

#### Q5 ####
## crate dataframe
library(dplyr)
nei = tbl_df(NEI)
## solve problem
bitt_e = nei[(nei$fips=="24510") & (nei$type=="ON-ROAD"),]
bitt_e.byyear <- summarise(group_by(bitt_e, year), Emissions=sum(Emissions))

## plot
library(ggplot2)

ggplot(bitt_e.byyear, aes(x=factor(year), y=Emissions,fill=year, label = round(Emissions,2))) +
  geom_bar(stat="identity") +
  xlab("year") +
  ylab(expression("total PM"[2.5]*" emissions in tons")) +
  ggtitle("Emissions from motor vehicle sources in Baltimore City")+
  geom_label(aes(fill = year),colour = "white", fontface = "bold")
