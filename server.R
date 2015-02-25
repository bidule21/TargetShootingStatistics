library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  # Expression that generates a histogram. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should re-execute automatically
  #     when inputs change
  #  2) Its output type is a plot
  
  output$resultPlot <- renderPlot({
    selectedCategoryDescription = getCategoryDescription(input$select_category)
    
    # Setup data
    ALL_RESULTS <- read.csv("data/results.txt", sep=";")
    CHOOSEN_CATEGORY = subset(ALL_RESULTS, TypeOfResult == selectedCategoryDescription)
    
    # Diagramme
    plot(CHOOSEN_CATEGORY[,"Result"],xlab="Freq",ylab="Result")
  })
})

getCategoryDescription <- function(id){
  sId = toString(id)
  switch(sId, 
         "1000"="A10 Final",
         "1005"="A10 20",
         "1010"="A10 40",
         "1011"="A10 40 Final",
        {"Unknown Category"}
  )

}