################################################################################
#
#                     Plot Residential Property Price Trends
#
################################################################################
library(ggplot2)

statebymonth <- read.csv("DCLead_StataCoefs.csv")
statebymonth$state[grepl('DC*', statebymonth$Var)] <- 'DC' 
statebymonth$state[grepl('MD*', statebymonth$Var)] <- 'MD' 
statebymonth$state[grepl('VA*', statebymonth$Var)] <- 'VA' 

statebymonth$month[statebymonth$state=='DC'] <- seq(1,6*12)
statebymonth$month[statebymonth$state=='MD'] <- seq(1,6*12)
statebymonth$month[statebymonth$state=='VA'] <- seq(1,6*12)
statebymonth$year[statebymonth$month<13] <- 2001
statebymonth$year[statebymonth$month>=13 & statebymonth$month<25] <- 2002
statebymonth$year[statebymonth$month>=25 & statebymonth$month<37] <- 2003
statebymonth$year[statebymonth$month>=37 & statebymonth$month<49] <- 2004
statebymonth$year[statebymonth$month>=49 & statebymonth$month<61] <- 2005
statebymonth$year[statebymonth$month>=61] <- 2006

table(statebymonth$year) # Confirmation, years have been assigned correctly!

ggplot(statebymonth) + geom_line(aes(x=month, y=exp(Coef.), colour=state), alpha=.8) +
  scale_colour_manual(values=c("black","red","orange"), name='Location') +
  ggtitle('Residential Property Price Trends') +
  ylab("Thousand USD") +
  xlab("") +
  scale_x_continuous(breaks=c(1,13,25, 37, 49, 61, 72),
                     labels=c(2001, 2002, 2003, 2004, 2005, 2006, 2007))



