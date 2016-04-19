#Loading required Packages 
library(shiny)
library(ggplot2)

#Directory of Codes and Raw data
setwd("D:/R_ShinyApp/")

#Load CSV File 
datain=read.csv("Data_Input.csv")
#colnames(datain)=c("Region","Theatre","Screen","Date","Total Seats","Booked Seats","Fulfilment Rate")
#R shiny Function starts
shinyServer(function(input, output) {

  output$myhist <- renderPlot({

#Applying filter in data as per ui.r Filters list    
    
    var1=subset(datain,datain$Region==input$Region & datain$Theatre==input$Theatre & datain$Date==input$Date)
    
    validate(
      need(var1$Fulfilment.Rate != "", "Data not available for this Region-Theatre-Date Combination. Please select a valid combination to view chart.")
    )
#
    par(las=1) # make label text perpendicular to axis
    par(mar=c(5,8,4,2)) # increase y-axis margin.
    

#Plotting View Graphs 
  
   # Basic barplot
    xx=barplot(var1$Fulfilment.Rate,horiz = TRUE, cex.lab=2, #main="Movie Screen Fulfilment Rate (%)",
            xlab="Fulfilment Rate (%)", xlim=c(0,100),
            #ylab="Theatre Screen",
            names.arg=var1$Screen,
              #("Screen1", "Screen2", "Screen3"), 
            cex.names=1.5,col=c("steelblue"),cex.axis = 1.5, cex.lab=1.5)
    title(main="Movie Screen Fulfilment Rate (%)", cex.main=2.0)
    
    xx
    
    output$mytable <- renderTable({ var1=subset(datain,datain$Region==input$Region & datain$Theatre==input$Theatre & datain$Date==input$Date)
     
    })
  })
})