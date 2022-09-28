library(shiny)

ui <- fluidPage(
  titlePanel("getcityid"),
  
  sidebarLayout(
    sidebarPanel(
      textInput(
        inputId = "name", label = "name of munuicipality", value = "", placeholder = "input a municipality"
        )
    ),
    mainPanel(
      textOutput(outputId = "idreturn")
    )
  )
)

server <- function(input, output){
  output$idreturn <- renderText(getcityid(input$name))
    
}

shinyApp(ui, server)