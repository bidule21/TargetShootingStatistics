library(shiny)
source("result-stats.R")

shinyServer(function(input, output) {  
  getResults <- reactive({
    return (loadResults())
  })
  
  getResultsForRequest <- function(){
    results = getResults()
    selectedCategory = getCategoryDescription(input$select_category)
    return (subset(results,Category==selectedCategory))
  }
  
  output$mean <- renderText({
    mean=mean(getResultsForRequest()$Result)
    return(overviewText("Mean",mean))
  })
  
  output$amountOfRecords <- renderText({
    amount = length(getResultsForRequest()$Result);
    return(overviewText("# of results",amount))
  })
  
  output$summary <- renderDataTable({
    results = getResultsForRequest()
    return(results)
  })
  
  output$scatterplot <- renderPlot({
    drawScatterPlot(getResultsForRequest(), "Trend Analysis")
  })
})

overviewText <- function(property,value){
  htmlProperty = paste(paste("<b>",property),":</b>")
  return(paste(htmlProperty,value))
}



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