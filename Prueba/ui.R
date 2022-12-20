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
library(viridisLite)


# Define UI for application that draws a histogram
dashboardPage(
  dashboardHeader(title = "Unidad de Urgencia HBV",titleWidth = 250),
  dashboardSidebar(width = 250,skin = "light",elevation = 2,status = "primary",
                   sidebarMenu(
                     id = "sidebar",
                     menuItem("Menu Principal",tabName="menu1",
                              icon=icon("layer-group"),
                              selected = TRUE),
                     menuItem("Segundo menu",tabName="menu2",
                              icon=icon("layer-group"),
                              selected = FALSE))),
  dashboardBody(
    
    # Boxes need to be put in a row (or column)
    fluidRow(width=12,box(width = 12,title = "Grafico Principal",closable = FALSE,elevation = 2,highchartOutput("grafico_principal"),
                          status = "primary",headerBorder = FALSE,collapsible = FALSE)),
    fluidRow(width=12,
             box(width = 10,title = "Histogramas",closable = FALSE,elevation = 2,highchartOutput("histogramas_principales"),
                          status = "info",headerBorder = FALSE,collapsible = FALSE),
             column(width = 2,
             valueBox(width = 12,subtitle = "Media",value = 1410,color = "primary",icon = icon("envelope")),
             valueBox(width = 12,subtitle = "Varianza",value = 1410,color = "info",icon = icon("bookmark")),
             valueBox(width = 12,subtitle = "Asimetria",value = 1410,color = "success",icon = icon("bookmark"))
             )),
   
    
    fluidRow(box(width = 4,
                 title = "Controles para grafico de dispersión",
                 selectInput(inputId = "color2", label = "selector de color", choices = c("red","blue","green"),
                             selected = "red")),
      box(plotOutput("distPlot2"),width = 8)),
  )
)