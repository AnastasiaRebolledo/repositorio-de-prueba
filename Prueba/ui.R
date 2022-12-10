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

# Define UI for application that draws a histogram
dashboardPage(
  dashboardHeader(title = "Unidad de Urgencia HBV",titleWidth = 250),
  dashboardSidebar(width = 250),
  dashboardBody(
    # Boxes need to be put in a row (or column)
    fluidRow(
      box(width = 4,
        title = "Controles para histograma",
        sliderInput("bins", "Number of observations:", 1, 100, 50),
        selectInput(inputId = "color1", label = "selector de color", choices = c("red","blue","green"),
                    selected = "red")),
      box(plotOutput("distPlot1"),width = 8)),
    
    fluidRow(box(width = 4,
                 title = "Controles para grafico de dispersión",
                 selectInput(inputId = "color2", label = "selector de color", choices = c("red","blue","green"),
                             selected = "red")),
      box(plotOutput("distPlot2"),width = 8)),
  )
)