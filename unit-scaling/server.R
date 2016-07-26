server <- function(input, output) {
  set.seed(122)
  histdata <- rnorm(500)
  
  # clean numeric input: http://stackoverflow.com/questions/24960407/r-shiny-numeric-input-without-selectors
  from.num <- reactive({as.numeric(input$from_length)})
  to.num <- reactive({as.numeric(input$from_length)})
  
  output$plot1 <- renderPlot({
    data <- histdata[seq_len(input$slider)]
    hist(data)
  })
}
