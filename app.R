library(shiny)

n <- 200

ui <- bootstrapPage(
  h1("Adam Lajo Nuhu"),
  
  selectInput(
    inputId = "plotType",
    label = 'Select Plot Type:',
    choices = c('Histogram', 'Boxplot'),
    selected = 'Histogram'
  ),
  
  selectInput(
    inputId = "plotColor",
    label = "Select Plot Color",
    choices = c("Black" = "black", "Gold" = "gold", "Red" = "red", "Green" = "green"),
    selected = "black"
  ),
  
  numericInput(
    inputId = "n",
    label = "Number of Obersvations",
    value = n
  ),
  
  plotOutput("plot")
)

server <- function(input, output) {
  output$plot <- renderPlot({
    data <- runif(input$n)
    
    if (input$plotType == "Histogram") {
      hist(data, col = input$plotColor, main = "Histogram", xlab = "Value")
    } else {
      boxplot(data, col = input$plotColor, main = "Boxplot")
    }
  })
}


shinyApp(ui = ui, server = server)