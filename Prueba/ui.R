#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
#library(shinydashboard)
#library(shinydashboardPlus)
library(bs4Dash)
library(rJava)
library(xlsx)
library(highcharter)
library(dplyr)


# Define UI for application that draws a histogram
dashboardPage(
  dashboardHeader(title = "Unidad de Urgencia HBV",titleWidth = 250),
  dashboardSidebar(width = 250,
                   sidebarMenu(
                     id = "sidebar",
                     menuItem("Menu Principal",tabName="Data",
                              icon=icon("layer-group"),
                              selected = TRUE))),
  dashboardBody(
    
    # Boxes need to be put in a row (or column)
    fluidRow(width=12,box(width = 12,title = "Grafico Principal",closable = FALSE,elevation = 2,highchartOutput("grafico_principal"))),
    fluidRow(width=12,
             box(width = 10,title = "Histogramas",closable = FALSE,elevation = 2,highchartOutput("histogramas_principales")),
             column(width = 2,
             infoBox(width = 12,title = h4("Media"),value = h5(1410),color = "primary",icon = icon("envelope")),
             infoBox(width = 12,title = h4("Varianza"),value = h5(1410),color = "info",icon = icon("bookmark"),tabName = "tab2"),
             infoBox(width = 12,title = h4("Asimetria"),value = h5(1410),color = "success",icon = icon("bookmark"),tabName = "tab2"),
             infoBox(width = 12,title = h4("Asimetria"),value = h5(1410),color = "warning",icon = icon("bookmark"),tabName = "tab2")
             )),
   
    
    fluidRow(box(width = 4,
                 title = "Controles para grafico de dispersión",
                 selectInput(inputId = "color2", label = "selector de color", choices = c("red","blue","green"),
                             selected = "red")),
      box(plotOutput("distPlot2"),width = 8)),
  )
)