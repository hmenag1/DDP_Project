## This script creates a shiny application for the Coursera DDP class
## This is the UI part
shinyUI( 
        fluidPage(
            uiOutput("usState"),
            uiOutput("usCounty"),
    
            mainPanel(
                plotOutput('newlinegraph')
            )
        )
)
        