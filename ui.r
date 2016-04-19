library(shiny)
setwd("D:/R_ShinyApp/")
datain=read.csv("Data_Input.csv")

shinyUI(fluidPage(
  titlePanel(title=h1("Seat Fulfilment by Region - Theatre - Screens",align="center")),
  sidebarLayout(
    sidebarPanel(
      selectInput("Region", "Region",choices = levels(datain$Region),
                  selectize=TRUE, 
                  multiple=FALSE),
      selectInput("Theatre", "Theatre",choices = levels(datain$Theatre),
                  selectize=TRUE, 
                  multiple=FALSE),
      selectInput("Date", "Date",choices = levels(datain$Date),
                  selectize=TRUE, 
                  multiple=FALSE)
    ),
    mainPanel(
      h4(""),
      plotOutput("myhist"),
      h4("Observations"),
      tableOutput("mytable")
    
        )
  )))
