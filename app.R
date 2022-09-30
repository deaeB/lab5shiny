library(shiny)
library(lab5package)

ui <- fluidPage(
  titlePanel("getcityid"),
  
  sidebarLayout(
    sidebarPanel(
      textInput(
        inputId = "name", label = "name of munuicipality", value = "", placeholder = "input a municipality"
        ),
      
      selectInput("select", h3("data GET"), 
                  choices = list("full data GET" = 1, "less data" = 2), selected = 1)
      
    ),
    mainPanel(
      conditionalPanel(
        condition = "input$select == 1", 
        textOutput(outputId = "idreturn")
      )
    )
  )
)

server <- function(input, output){
  output$idreturn <- renderText(

    if(input$select == 1){
      getcityid(input$name)
    }else    if(input$select == 2){
      getcityid_lessdata(input$name)
    }
    
    )
  
}

shinyApp(ui, server)