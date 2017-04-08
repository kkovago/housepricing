
library(shiny)

ui <- fluidPage(

    titlePanel("Prediction of House List Prices in Boulder, CO"),
    sidebarLayout(
        sidebarPanel(
            h4("Select house parameters", align="center"),
            selectInput("fieldZip", "ZIP", listZip ),
            selectInput("fieldBeds", "Bedrooms", listBeds ),
            checkboxInput("fieldGarage", "Has garage?", value = TRUE)
        ),
        mainPanel(
            h4("Predicted List Price by Square Feet", align="center"),
            p("How to use it: Based on the house parameters you select in the left panel, the diagram below will show the predicted list price in Boulder"),
            plotOutput("plotHouse")
        )
    )
)