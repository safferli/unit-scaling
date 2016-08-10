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
  
  # render DT of the stored conversions
  output$datatable <- DT::renderDataTable(
    {values$dta}, options = list(
      dom = 'Bfrtip', buttons = c('copy', 'csv', 'pdf', 'print')
    ), extensions = "Buttons", rownames = FALSE
  )

  # reative dataframe: http://stackoverflow.com/questions/23236944/add-values-to-a-reactive-table-in-shiny
  values <- reactiveValues()
  values$dta <- data.frame(
      from_unit = vector("character", length = 0),
      to_unit = vector("character", length = 0),
      scale_factor = vector("character", length = 0),
      from_length = vector("numeric", length = 0),
      to_length = vector("numeric", length = 0),
      stringsAsFactors = FALSE
    )
  
  new.entry <- observe({
    # button is pushed at least once
    if(input$keep > 0) {
      # isolate data we need
      keep.dta <- isolate(
        data.frame(
          from_unit = input$from_unit,
          to_unit = input$to_unit,
          scale_factor = paste0(input$scale_numerator, "/", input$scale_denominator),
          from_length = input$from_length,
          to_length = measurements::conv_unit(input$from_length, from = input$from_unit, to = input$to_unit)*input$scale_numerator/input$scale_denominator
        , stringsAsFactors = FALSE)
      )
      # bind data to existing
      isolate(values$dta <- dplyr::bind_rows(values$dta, keep.dta))
    }
  })
  
}
