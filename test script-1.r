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
plot(steps.by.interval, col = "dark green")



#// (code chunk 4 - plot ave steps by interval over all days)

#/Average steps for each interval
#/test average steps per day
 steps.test <- read.csv("./test-steps.csv")
 tmp1 <- arrange(steps.test, interval)
 tmp2 <- group_by(tmp1, interval)
 result <- summarize(tmp2, m=mean(steps) )
 
 #now with real dataset
 tmp1 <- arrange(dataset, interval)
 tmp2 <- group_by(tmp1, interval)
 result <- summarize(tmp2, m=mean(steps) )
 
 
 #alternative
test1 <-  steps.test %>%  group_by((interval)) %>% summarise(ave=mean(steps))
 
#now with the real data...
 test2 <- dataset %>%  group_by((interval)) %>% summarise(ave=mean(steps))  #which includes NAs
 
 
#tmp <- arrange(dataset, interval)
#tmp <- select(tmp, c(3,1))
#steps.TallyByInterval <- count(tmp, interval, wt=steps)
