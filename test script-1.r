#/ Test scripts to aid in the cleaning and data exploration phase (before we paste into code chunks)
#/ read the dataset


require(readr)
require(dplyr)
require(tidyr)

#// data pre-processing (code chunk 1 - Setup Report)
dataset<- read_csv("./activity.csv")
steps_by_day <- count(dataset, date, wt = steps)

#// (code chunk 2 - IgnoreNA section)
steps <- as.data.frame(  steps_by_day[,2] )
steps.by.interval <- as.data.frame( dataset[,c(3,1)])
non.zero.steps <- sort( steps$n[steps$n != 0] ) #/ remove all zero step intervals

x <- mean(non.zero.steps)
f.mean_steps_perday <- format(round(x,1),big.mark = ",")

y <- as.numeric(median(non.zero.steps))
f.median_steps_perday <- format(y, big.mark = ",")

#// (code chunk 3 - Histogram of steps)
myTitle <- "Frequency plot of daily steps"
xlabel <- "Daily steps (in groups of 2,000)"
hist(non.zero.steps, breaks = 10, col = "light blue", xlab = xlabel, main = myTitle)

#// (code chunk 4 - average steps per interval over entire 2 month period)

x <- select(dataset, interval, date, steps) %>% filter(steps >0) 
tmp <- arrange(x, interval)
plotdata <- aggregate(x = tmp, by = list(tmp$interval), FUN = "mean")
title <- "Time series of ave. steps by interval (across all intervals)"
plot(plotdata$interval, plotdata$steps, type="l", main = title, col="dark green" ) 

#// (code chunk 5)
#/ which.max(tmp$steps)
plotdata[which.max(plotdata$steps),]

 
