library(shiny)
source("result-stats.R")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  # Expression that generates a histogram. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should re-execute automatically
  #     when inputs change
  #  2) Its output type is a plot
  
  output$summary <- renderTable({
    selectedCategoryDescription = getCategoryDescription(input$select_category)
    results<-loadResultType(selectedCategoryDescription)
    return(results)
  })
  
  output$scatterplot <- renderPlot({
    selectedCategoryDescription = getCategoryDescription(input$select_category)
    results<-loadResultType(selectedCategoryDescription)

    # Diagramme
    title = paste("Scatter Plot for", selectedCategoryDescription)
    drawScatterPlot(results, title)
  })
})

getCategoryDescription <- function(id){
  sId = toString(id)
  switch(sId, 
         "1000"="A10 Final",
         "1005"="A10 20",
         "1010"="A10 40",
         "1011"="A10 40 Final",
         "1020"="A10 60",
         "1021"="A10 60 Final",
         "500"="A30 S 30",
         "510"="A30 K 30",
         "520"="A30 Match",
         "530"="A30 Final",
         "531"="A30 Match Final",
         "100"="LG 10",
         "101"="LG 10.f",
         "110"="LG 20",
         "111"="LG 20.f",
         "120"="LG 40",
         "121"="LG 40.f",
         "130"="LG 60",
         "131"="LG 60.f",
         "140"="LG Final",
        {"Unknown Category"}
  )
}