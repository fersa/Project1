library(shiny)
library(ggplot2)

shinyServer(function(input, output) {
  
  dataset <- read.csv("data/df.csv")
  dataset <- dataset[,c(2,4,5,6,7,8)]
  names(dataset)[1]<-"Displacement"
  names(dataset)[2]<-"Month"
  names(dataset)[4]<-"Level"
  names(dataset)[5]<-"Temp"
  names(dataset)[6]<-"Rainfall"
  
#  y    <- read.csv("data/target")  # Target variable
  
  output$plot <- renderPlot({
    p <- ggplot(dataset, aes_string(x=input$x, y=input$y)) + geom_point()
    if (input$color != 'None')
      p <- p + aes_string(color=input$color)
    if (input$size != 'None')
      p <- p + aes_string(size=input$size)    
#    facets <- paste(input$facet_row, '~', input$facet_col)
#   if (facets != '. ~ .')
#      p <- p + facet_grid(facets)
#   if (input$jitter)
#      p <- p + geom_jitter()
#    if (input$smooth)
#      p <- p + geom_smooth()
    print(p)
  }, height=700)
})