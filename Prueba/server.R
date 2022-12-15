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

    
    #Aqui cambie la funcion renderplot por la funcion renderHighcharter,
    #porque la funcion que genera el grafico depende de la libreria que se use
    #por tanto en la salida de la ui tambien se cambia plotOutput ´por highchartOutput
    
    
    output$grafico_principal<-renderHighchart({
      
      x1<-seq(as.Date("2022-01-01"),as.Date("2022-12-31"),"day")
      y1<-read.xlsx(file="Urgencia2022.xlsx",sheetIndex = 1, rowIndex = 19, colIndex= 2:366
                   , as.data.frame = TRUE, header = FALSE)
      y2<-read.xlsx(file="Urgencia2021.xlsx",sheetIndex = 1, rowIndex = 19, colIndex= 2:366
                    , as.data.frame = TRUE, header = FALSE)
      y3<-read.xlsx(file="Urgencia2020.xlsx",sheetIndex = 1, rowIndex = 19, colIndex= 2:366
                    , as.data.frame = TRUE, header = FALSE)
      
      #Aca transpuse el vector o si no genera n columnas
      y1<-t(y1)
      y2<-t(y2)
      y3<-t(y3)
      
      #plot(x,y,type = "l")
      
      #Aca lo guarda en un cuadro de datos,
      data<-data.frame(x1,y1,y2,y3)
      
      #Aca asignamos el cuadro datos a un grafico
      #data %>% hchart("line",hcaes(x = x, y = y))           
      
      #Aca cambie la forma de realizar el grafico pero con la misma libreria highcharter
     
       highchart() %>%
        hc_add_series(name="2022",data, type = "line",
                      hcaes(x = x1, y = y1)) %>%
         hc_add_series(name="2021",data, type = "line",
                       hcaes(x = x1, y = y2)) %>%
         hc_add_series(name="2020",data, type = "line",
                       hcaes(x = x1, y = y3)) %>% hc_xAxis(type="datetime")
        
    })
    
    output$histogramas_principales<-renderHighchart({
      
      x1<-seq(as.Date("2022-01-01"),as.Date("2022-12-31"),"day")
      y1<-read.xlsx(file="Urgencia2022.xlsx",sheetIndex = 1, rowIndex = 19, colIndex= 2:366
                    , as.data.frame = TRUE, header = FALSE)
      y2<-read.xlsx(file="Urgencia2021.xlsx",sheetIndex = 1, rowIndex = 19, colIndex= 2:366
                    , as.data.frame = TRUE, header = FALSE)
      y3<-read.xlsx(file="Urgencia2020.xlsx",sheetIndex = 1, rowIndex = 19, colIndex= 2:366
                    , as.data.frame = TRUE, header = FALSE)
      
      #Aca transpuse el vector o si no genera n columnas
      y1<-t(y1)
      y2<-t(y2)
      y3<-t(y3)
      
      #Aca lo guarda en un cuadro de datos,
      data<-data.frame(x1,y1,y2,y3)
      
      #Aca deberiamos hacer los histogramas
      hchart(density(data$y1), type = "area", color = "steelblue", 
                    name = "2022") %>%
      hc_add_series(density(data$y2), type = "area",
                    name = "2021")%>%
        hc_add_series(density(data$y3), type = "area",
                      name = "2020")
      
    })

})
