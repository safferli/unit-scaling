server <- function(input, output) {
  
  # clean numeric input: http://stackoverflow.com/questions/24960407/r-shiny-numeric-input-without-selectors
  from.num <- reactive({as.numeric(input$from_length)})
  to.num <- reactive({as.numeric(input$to_length)})
  
  output$text_output <- renderText({
    paste(
      input$from_length, 
      input$from_unit, 
      "are", 
      measurements::conv_unit(as.numeric(input$from_length), from = input$from_unit, to = input$to_unit),
      input$to_unit
      #measurements::conv_unit(to.num, from.units, to.units), to.units
    )
  })
}
