#Isabella# isabella
# install.packages("shiny")
# install.packages("ggplot2")
library(shiny)
library(ggplot2)
# It defines the user interface, the HTML webpage that humans interact with. 
ui <- fluidPage( #ui es user interface
  
  tags$h3("Scatter plot generator isabella"), #h3 tipo llamado
  
  selectInput(inputId = "x", label = "X Axis", choices = names(mtcars), selected = "mpg"),# mtcars conjunto datos gemelos
  selectInput(inputId = "y", label = "Y Axis", choices = names(mtcars), selected = "hp"),
  plotOutput(outputId = "scatterPlot")
  
)

# It specifies the behavior of our app by defining a server function.

server <- function(input, output){
  data <- reactive({mtcars})
  output$scatterPlot <- renderPlot({
    ggplot(data = data(), aes_string(x = as.factor(rownames(mtcars)), y = input$y)) + #definir objeto
      
      #geom_point() +  #tipo de grafico
      geom_dotplot(binaxis = 'y')  + coord_flip()
  })
}
# Construct and start a Shiny application from UI and server.

shinyApp(ui = ui, server = server)
