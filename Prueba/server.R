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
library(highcharter)
library(dplyr)

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
    
    #Aqui cambie la funcion renderplot por la funcion renderHighcharter,
    #porque la funcion que genera el grafico depende de la libreria que se use
    #por tanto en la salida de la ui tambien se cambia plotOutput ´por highchartOutput
    
    
    output$grafico_principal<-renderHighchart({
      
      x<-seq(as.Date("2022-01-01"),as.Date("2022-12-06"),"day")
      y<-read.xlsx(file="Urgencia2022.xlsx",sheetIndex = 1, rowIndex = 18, colIndex= 2:341
                   , as.data.frame = TRUE, header = FALSE)

      #Aca transpuse el vector o si no genera n columnas
      y<-t(y)
      #plot(x,y,type = "l")
      
      #Aca lo guarda en un cuadro de datos,
      data<-data.frame(x,y)
      
      #Aca asignamos el cuadro datos a un grafico
      data %>% hchart("line",hcaes(x = x, y = y))           
      
      
    })

})
