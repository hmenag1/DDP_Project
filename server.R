## This script creates a shiny application for the Coursera DDP class
## This is the server part

library(shiny)
library(dplyr)
library(ggplot2)

#options(error=recover)

raw.data <- read.csv("maxdailytemp.csv", 
                     stringsAsFactors = FALSE)

us.counties <- list()
us.states <- unique(raw.data$State)
dfstates <- raw.data[,1:2]


getCounties <- function(state){
    sel <- dfstates %>% 
        filter(State==state) %>%
        select(County)
    #sel <- sort(sel)
    return(sel)
}

for (intx in 1:length(us.states)){
    cur.state <- us.states[intx]
    us.counties[[cur.state]] <- getCounties(cur.state)
}



shinyServer( 
    function(input, output, session){
        
            output$usState <- renderUI({
                selectInput("stateName", "Select a US State:", 
                            names(us.counties[]))
            })
            
            #browser()
            output$usCounty <- renderUI({
                selectInput("countyName", "Select a County from that State:", 
                            us.counties[input$stateName])
            })
            
            output$newlinegraph <- renderPlot({
                
                st <- input$stateName
                co <- input$countyName
                
                if (nchar(input$countyName)>0){
                   
                df_sel <- raw.data %>%
                    filter(State== st & County== co)
                
                df <- df_sel[,3:length(colnames(df_sel))]
                
                no <- names(df)
                nn <-gsub("X","",no)
                colnames(df)<- nn
                
                dft <- data.frame(t(df),stringsAsFactors = FALSE)
                dft$Year <- rownames(dft)
                
                 
                colnames(dft) <- c("Days","Year")
                dft$Year <- as.numeric(dft$Year)
                dft$Days <- as.numeric(dft$Days)
                
                ggplot(data=dft, aes(x=Year,y=Days,group=1)) +
                    geom_line(colour="red") +
                    geom_point(colour="red") +
                    ylab("Number of Hot Days") +
                    ggtitle(paste(
                        "Projected Number of Extreme Heat Days (>90 F) for",
                                  co, "County, ", st))
                
                }
            })
        }
)
