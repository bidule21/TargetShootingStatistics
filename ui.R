library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Result archive of Jonas Hansen"),
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      selectInput("select_category", label = h3("Category"), 
                  choices = list(
                      "A10 Final" = 1000, 
                      "A10 20" = 1005,        
                      "A10 40" = 1010,
                      "A10 40 Final" = 1011
                      ), selected = 1000)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("resultPlot")
    )
  )
))