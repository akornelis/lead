library(reshape)
library(ggplot2)

goog2 <- read.csv('GoogleTrendsLeadWater.csv')
goog2$Month <- as.Date(paste(goog2$Month, "-01", sep=""))

plotgoog2 = melt(goog2, id=c("Month"))

ggplot(plotgoog2) + geom_line(aes(x=Month, y=value, colour=variable), alpha=.8) +
  scale_colour_manual(values=c("black","red","orange"), name='Location') +
  ggtitle('Google Searches Including Both "lead" and "water"') +
  ylab("Relative Popularity") +
  xlab("") +
  scale_x_date(date_breaks = "2 years", 
               labels=date_format("%Y"),
               limits = as.Date(c('2003-12-31','2017-08-01')))
