#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(rJava)
library(xlsx)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$distPlot1 <- renderPlot({

        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = input$color1, border = 'white',
             xlab = 'Waiting time to next eruption (in mins)',
             main = 'Histograma de tiempos de espera')

    })
    output$distPlot2 <- renderPlot({
      
      # generate bins based on input$bins from ui.R
      x    <- faithful[, 1]
      y    <- faithful[, 2]
     
      plot(x,y,col=input$color2) 
    })
    
    output$grafico_principal<-renderPlot({
      
      x<-seq(as.Date("2022-01-01"),as.Date("2022-12-06"),"day")
      y<-read.xlsx(file="Urgencia2022.xlsx",sheetIndex = 1, rowIndex = 18, colIndex= 2:341
                   , as.data.frame = TRUE, header = FALSE)
      plot(x,y,type = "l")
                 
      
      
    })

})
