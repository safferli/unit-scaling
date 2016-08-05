server <- function(input, output) {
  
  # clean numeric input: http://stackoverflow.com/questions/24960407/r-shiny-numeric-input-without-selectors
  #from.num <- reactive({as.numeric(input$from_length)})
  
  output$text_output <- renderText({
    conv_result <- measurements::conv_unit(input$from_length, from = input$from_unit, to = input$to_unit)
    paste(
      input$from_length, input$from_unit, "are", 
      conv_result,
      input$to_unit,
      "\n\n With a scale factor of", paste0(input$scale_numerator, "/", input$scale_denominator),
      "the result is", 
      conv_result*input$scale_numerator/input$scale_denominator,
      input$to_unit
    )
  })
}
