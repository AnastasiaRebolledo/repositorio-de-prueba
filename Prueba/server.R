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
  load("datos_app.RData")
  
    
    #Aqui cambie la funcion renderplot por la funcion renderHighcharter,
    #porque la funcion que genera el grafico depende de la libreria que se use
    #por tanto en la salida de la ui tambien se cambia plotOutput ´por highchartOutput
    
    output$grafico_general<-renderHighchart({
      
      highchart() %>%
        hc_add_series(name="demanda",data, type = "line",
                      hcaes(x = x1, y = demanda))  %>% hc_xAxis(type="datetime")
      })
    
    
    output$media_1<-renderText({
          mean(data$demanda[1:1436])
      })
    
    
    output$desvest_1<-renderText({
          sd(data$demanda[1:1436])
      })
    
    
    output$histograma_principal<-renderHighchart({
          hchart(density(data$demanda[1:1436]), type = "area", name = "Demanda")
      })
    
    
    output$grafico_circular_1<-renderHighchart({ 
          causa %>% hchart("pie",hcaes(x=X1,y=X6),name="Causas")
      })  
    
    
    output$grafico_circular_2<-renderHighchart({ 
          edad %>% hchart("pie",hcaes(x=X1,y=X6),name="Causas")
      })  
    
    
    output$grafico_principal<-renderHighchart({
    
      cols <- viridis(4)
      cols <- substr(cols, 0, 7)
      
      
      #Aca cambie la forma de realizar el grafico pero con la misma libreria highcharter
       highchart() %>%
        hc_add_series(name="2019",data_por_año, type = "line",
                      hcaes(x = x2, y = y1)) %>%
         hc_add_series(name="2020",data_por_año, type = "line",
                       hcaes(x = x2, y = y2_2)) %>%
         hc_add_series(name="2021",data_por_año, type = "line",
                       hcaes(x = x2, y = y3)) %>%
         hc_add_series(name="2022",data_por_año, type = "line",
                       hcaes(x = x2, y = y4)) %>% hc_xAxis(type="datetime") %>%
         hc_colors(cols) 
        
    })
    
    output$histogramas_principales<-renderHighchart({

      cols <- viridis(4)
      cols <- substr(cols, 0, 7)
      
      #Aca deberiamos hacer los histogramas
      hchart(density(data_por_año$y1), type = "area", 
                    name = "2019") %>%
      hc_add_series(density(data_por_año$y2_2), type = "area",
                    name = "2020") %>%
      hc_add_series(density(data_por_año$y3), type = "area",
                      name = "2021") %>%
      hc_add_series(density(data_por_año$y4[1:340]), type = "area",
                      name = "2022") %>%
      hc_colors(cols)
      
      
    })

    output$grafico_circular_3<-renderHighchart({ 
      causa %>% hchart("pie",hcaes(x=X1,y=X2),name="Causas")
    })
    
    output$grafico_circular_4<-renderHighchart({ 
      causa %>% hchart("pie",hcaes(x=X1,y=X3),name="Causas")
    })
    
    output$grafico_circular_5<-renderHighchart({ 
      causa %>% hchart("pie",hcaes(x=X1,y=X4),name="Causas")
    })
    
    output$grafico_circular_6<-renderHighchart({ 
      causa %>% hchart("pie",hcaes(x=X1,y=X5),name="Causas")
    })
    
    output$grafico_circular_7<-renderHighchart({ 
      edad %>% hchart("pie",hcaes(x=X1,y=X2),name="Edad")
    })
    
    output$grafico_circular_8<-renderHighchart({ 
      edad %>% hchart("pie",hcaes(x=X1,y=X3),name="Edad")
    })
    
    output$grafico_circular_9<-renderHighchart({ 
      edad %>% hchart("pie",hcaes(x=X1,y=X4),name="Edad")
    })
    
    output$grafico_circular_10<-renderHighchart({ 
      edad %>% hchart("pie",hcaes(x=X1,y=X5),name="Edad")
    })
    
    output$grafico_barras_causa<-renderHighchart({ 
      highchart() %>%
        hc_add_series(name="2019",causa, type = "column",
                      hcaes(x = X1, y = X2)) %>%
        hc_add_series(name="2020",causa, type = "column",
                      hcaes(x = X1, y = X3)) %>%
        hc_add_series(name="2021",causa, type = "column",
                      hcaes(x = X1, y = X4)) %>%
        hc_add_series(name="2022",causa, type = "column",
                      hcaes(x = X1, y = X5)) 
    })
})
