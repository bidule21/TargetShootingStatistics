library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  includeCSS("www/style.css"),
  
  # Application title
  titlePanel("Result archive of Jonas Hansen"),
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      selectInput("select_category", label = h3("Category"), 
                  choices = list(
                      "CB10 S Final" = 1000, 
                      "CB10 S 1" = 1002, 
                      "CB10 S 10" = 1003, 
                      "CB10 S 20" = 1005,        
                      "CB10 S 40" = 1010,
                      "CB10 S 40 Final" = 1011,
                      "CB10 S 60" = 1020,
                      "CB10 S 60 Final" = 1021,
                      "CB30 S 1" = 485,
                      "CB30 S 10" = 490,
                      "CB30 S 20" = 495,
                      "CB30 S 30" = 500,
                      "CB30 K 1" = 507,
                      "CB30 K 10" = 508,
                      "CB30 K 20" = 509,
                      "CB30 K 30" = 510,
                      "CB30 Match" = 520,
                      "CB30 S Final 10" = 530,
                      "CB30 Match Final" = 531,
                      "AR10 S 1" = 90,
                      "AR10 S 10" = 100,
                      "AR10 S 20" = 110,
                      "AR10 S 40" = 120,
                      "AR10 S 60" = 130,
                      "AR10 S Final" = 140
                      ), selected = 1000),
      
      dateRangeInput("dates", label = h3("Date"), start="2010-01-01")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      tabsetPanel(
        tabPanel("Overview",      
                 div(class="overview",
                   span("You're seeing your results between the "), 
                   htmlOutput("fromDate",inline=T),
                   span("and the"),
                   htmlOutput("toDate",inline=T)
                 ),
                 div(class="overview",
                   span("You've shot a total of "),
                   htmlOutput("amountOfRecords",inline=T),
                   span(" results during this period")
                 ),
                 div(class="overview",
                   span("Your average score is "),
                   htmlOutput("mean",inline=T),
                   span("with your best being"),
                   htmlOutput("best", inline=T),
                   span("and your worst "),
                   htmlOutput("worst", inline=T)
                   )
        ),
        tabPanel("Plots",
                 plotOutput("trendPlot"),
                 plotOutput("histogram")
        ),
        tabPanel("Data",
                 dataTableOutput("summary")
        )
      )
    )
  )
))