# Run local
library(shiny)
runApp("~/Development/workspaces/R/shiny/results/")

# Deploy
library(shinyapps)
shinyapps::deployApp("~/Development/workspaces/R/shiny/results/")