getwd()
setwd('C:/Users/Esdeath/Downloads/data')
library(readxl)
fish<-read.table('reef_fish.txt', header=T, sep='\t', dec='.')
barplot(fish$richness, main="Top 10 reef fish Richness (Allen, 2000)", horiz=TRUE, names.arg=fish$country, cex.names=0.5, las=1)

#123
#123
