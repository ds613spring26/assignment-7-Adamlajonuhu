# Shiny App Homework 1
# Name: ADAM LAJO NUHU

library(shiny)

ui <- fluidPage(
  sliderInput(inputId = "num",
              label = "Choose a number",
              value = 25, min = 1, max = 100),
  
  plotOutput("boxplot")
)

server <- function(input, output) {
  
  output$boxplot <- renderPlot({
    
    boxplot(rnorm(input$num),
            col = "red",
            main = "Boxplot of Random Normal Values")
    
  })
}


shinyApp(ui = ui, server = server)




