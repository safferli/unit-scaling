server <- function(input, output) {
  
  output$text_output <- renderText({
    conv_result <- measurements::conv_unit(input$from_length, from = input$from_unit, to = input$to_unit)
    paste(
      input$from_length, input$from_unit, "are", 
      conv_result,
      paste0(input$to_unit, "."),
      "\n\n With a scale factor of", paste0(input$scale_numerator, "/", input$scale_denominator),
      "the result is:", 
      # scaled result
      conv_result*input$scale_numerator/input$scale_denominator,
      input$to_unit
    )
  })
  
  output$datatable <- DT::renderDataTable(
    dta, options = list(
      dom = 'Bfrtip', buttons = c('copy', 'csv', 'pdf', 'print')
    ), extensions = "Buttons", rownames = FALSE
  )
  
  observeEvent(input$keep, {
    keep.dta <- data.frame(
      from_unit = input$from_unit, 
      to_unit = input$to_unit, 
      scale_factor = paste0(input$scale_numerator, "/", input$scale_denominator),
      from_length = input$from_length,
      to_length = measurements::conv_unit(input$from_length, from = input$from_unit, to = input$to_unit)*input$scale_numerator/input$scale_denominator,
      stringsAsFactors = FALSE
    )
    dta <<- dplyr::bind_rows(dta, keep.dta)
  })
}
