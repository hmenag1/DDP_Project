DDP Presentation
========================================================
author: HM
date: 6/21/2015
transition: rotate

Objectives
========================================================
In this presentation I'd like to demonstrate the utility of my Coursera course Developing Data Product class project

Objectives:
At the end of this presentation, participants will be able to:
- Select a U.S. state and a county from that state
- Display a line graph indicating the trend for future annual number of hot days for a particular county
- Understand the importance of the real-world issue that is the subject of the project


Introduction
========================================================
- The Intergovernmental Panel on Climate Change (IPCC) projects with "virtual certainty" (99-100% probability) that climate change will cause more frequent, more intense, and longer heat waves.    
- Exposure to extreme outdoors temperatures can be very dangerous especially when the exposure occurs over the course of several consecutive days.   
- 


Heat Illnesses
========================================================
Heat Illnesses include:   
- Cramps, 
- Syncope, and 
- Edema
- Heat stroke
- Heat exhaustion



Data source
========================================================
- The individual county data is downloadable from the web at: http://ephtracking.cdc.gov/showIndicatorPages.action

- This application is based on real data and it is available for the years 2020 to 2084


Temperature projections
========================================================


```r
library(dplyr)
library(scales)
raw.data <- read.csv("maxdailytemp.csv", 
                     stringsAsFactors = FALSE)
subdf <- raw.data[,c(3, 67)]
subdf$X2020 <- as.numeric(subdf$X2020)
subdf$X2084 <- as.numeric(subdf$X2084)
avg2020 <- mean(subdf$X2020,na.rm=TRUE)                     
avg2084 <- mean(subdf$X2084,na.rm=TRUE)   
```
it is predicted that the average number of hot days in the U.S. will go from 50 in the year 2020 to 67 in the year 2084.


Accessing the App
========================================================
To access the App and th view the projections for your county, please follow this link:
https://hm-datascience.shinyapps.io/DDP_Project

Steps:
- Select a U.S. State
- Select a county within the selected state.

The graph of the projections should be then visible. Have fun!
