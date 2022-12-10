#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

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

})
