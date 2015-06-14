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
  
  output$summary <- renderDataTable({
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
         "1000"="CB10 S Final",
         "1003"="CB10 S 10",
         "1005"="CB10 S 20",
         "1010"="CB10 S 40",
         "1011"="CB10 S 40 Final",
         "1020"="CB10 S 60",
         "1021"="CB10 S 60 Final",
         "500"="CB30 S 30",
         "507"="CB30 K 1",
         "508"="CB30 K 10",
         "509"="CB30 K 20",
         "510"="CB30 K 30",
         "520"="CB30 Match",
         "530"="CB30 Final",
         "531"="CB30 Match Final",
         "100"="AR10 S 10",
         "101"="AR10 S 10.f",
         "110"="AR10 S 20",
         "111"="AR10 S 20.f",
         "120"="AR10 S 40",
         "121"="AR10 S 40.f",
         "130"="AR10 S 60",
         "131"="AR10 S 60.f",
         "140"="AR10 S Final",
        {"Unknown Category"}
  )
}