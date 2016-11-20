# Personal Movement Analysis
Jim Perkins  
November 13, 2016  


#### Part 1 

> *For this part of the analysis, we ignored missing values (i.e. we stripped out any "NA" values*  
> *from the dataset before calculating the mean, median and the frequency plot.*




* Over the 2 month measurement period...  
 + AVERAGE steps per day was: **10,766.2**  
 + MEDIAN  steps per day was: **10,765** 



Here is a frequency plot (i.e. histogram) of the total steps taken each day


```r
knitr::opts_chunk$set(echo = TRUE)

# xt <- xtable(summary(steps_by_day))
# print(xt, type="html" )

#/Histogram of steps
myTitle <- "Frequency plot of daily steps"
xlabel <- "Daily steps (in interval of 2,000)"
hist(non.zero.steps, breaks = 10, col = "light blue", xlab = xlabel, main = myTitle)
```

![](PA1_template_files/figure-html/3-print_Steps_Table-1.png)<!-- -->

> *Meaning: The most frequently occurring steps in a day are between 10,000 to 12,000*  





 
 

 
