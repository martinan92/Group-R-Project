######### Visual Comparison of Two Files in Shiny ######### 

if(!"diffr" %in% installed.packages()) {install.packages("diffr")}
library(diffr)
if(!"shiny" %in% installed.packages()) {install.packages("shiny")}
library(shiny)

#Set input files here
file1<-"Final\ Group\ Project\ v15.Rmd"
file2<-"Final\ Group\ Project\ v14.Rmd"

#Change this depending on where you saved the files
setwd("~/Documents/MBD/Programming in R/Group Project/workgroup data")

ui <- fluidPage(h1("Group Project Script Comparison"), checkboxInput("wordWrap", "Word Wrap", value = TRUE),
      diffrOutput("exdiff"))

server <- function(input, output, session) {
  output$exdiff <- renderDiffr({
    diffr(file1, file2, wordWrap = input$wordWrap)
  })
}

shinyApp(ui, server)
