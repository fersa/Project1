library(shiny)
library(ggplot2)

dataset <- read.csv("data/df.csv")
dataset <- dataset[,c(2,4,5,6,7,8)]
names(dataset)[1]<-"Displacement"
names(dataset)[2]<-"Month"
names(dataset)[4]<-"Level"
names(dataset)[5]<-"Temp"
names(dataset)[6]<-"Rainfall"

shinyUI(pageWithSidebar(
  
  headerPanel("Data Exploration"),
  sidebarPanel(
    
#     sliderInput('sampleSize', 'Sample Size', min=1, max=nrow(dataset),
#                 value=min(1000, nrow(dataset)), step=500, round=0),
    selectInput('x', 'X', names(dataset), names(dataset)[[4]]),
    selectInput('y', 'Y', names(dataset), names(dataset)[[1]]),
    selectInput('color', 'Color', c('None', names(dataset))),
    selectInput('size', 'Size', c('None', names(dataset)))
#    checkboxInput('jitter', 'Jitter'),
#    checkboxInput('smooth', 'Smooth'),
#    selectInput('facet_row', 'Facet Row', c(None='.', names(dataset))),
#    selectInput('facet_col', 'Facet Column', c(None='.', names(dataset)))
  ),
  
  mainPanel(
    plotOutput('plot')
  )
))