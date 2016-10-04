#### read file ####
NEI = readRDS("summarySCC_PM25.rds")
SCC = readRDS("Source_Classification_Code.rds")

#### Q4 ####
## crate dataframe
library(dplyr)
library(ggplot2)
nei = tbl_df(NEI)
## solve problem
combust.coal = grepl("Fuel Comb.*Coal", SCC$EI.Sector)
combust.coal.sou = SCC[combust.coal,]

coal.e = nei[(nei$SCC %in% combust.coal.sou$SCC),]
coal.e.related = summarise(group_by(coal.e,year), Emissions=sum(Emissions))
## plot graph
ggplot(coal.e.related, aes(x=factor(year), y=Emissions/1000, fill=year, label = round(Emissions/1000,2))) +
geom_bar(stat = "identity")+
  xlab("year") +
  ylab(expression("total PM"[2.5]*" emissions in kilotons")) +
  ggtitle("Emissions from coal combustion-related sources in kilotons")+
  geom_label(aes(fill = year),colour = "white", fontface = "bold")