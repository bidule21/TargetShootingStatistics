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
                      "A10 40 Final" = 1011,
                      "A10 60" = 1020,
                      "A10 60 Final" = 1021,
                      "A30 S 30" = 500,
                      "A30 K 30" = 510,
                      "A30 Match" = 520,
                      "A30 Final" = 530,
                      "A30 Match Final" = 531,
                      "LG 10" = 100,
                      "LG 10.f" = 101,
                      "LG 20" = 110,
                      "LG 20.f" = 111,
                      "LG 40" = 120,
                      "LG 40.f" = 121,
                      "LG 60" = 130,
                      "LG 60.f" = 131,
                      "LG Final" = 140
                      ), selected = 1000)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("resultPlot"),
      tableOutput("summary")
    )
  )
))