#### read file ####
NEI = readRDS("summarySCC_PM25.rds")
SCC = readRDS("Source_Classification_Code.rds")

#### Q3 ####
## crate dataframe
library(dplyr)
library(ggplot2)
nei = tbl_df(NEI)
## solve problem
tt_e = subset(nei, fips == "24510")
ftt_e = summarise(group_by(filter(NEI, fips == "24510"), year,type)
                                                 , Emissions=sum(Emissions))
  
## plot graph
ggplot(ftt_e, aes(x=factor(year), y=Emissions, fill=type,label = round(Emissions,2))) +
  geom_bar(stat="identity") +
  #geom_bar(position = 'dodge')+
  facet_grid(. ~ type) +
  xlab("year") +
  ylab(expression("total PM"[2.5]*" emission in tons")) +
  ggtitle(expression("PM"[2.5]*paste(" emissions in Baltimore ",
                                     "City by various source types", sep="")))+
  geom_label(aes(fill = type), colour = "white", fontface = "bold")

