## header content
header <- dashboardHeader(title = "Unit Scaling App")

## Sidebar content
sidebar <-   dashboardSidebar(
  h3("unit conversion"), 
  
  # from-unit conversion
  selectizeInput("from_unit", label = "From unit:", choices = from.units, width = "45%"), 
  numericInput("from_length", label = "From length:", value = "1.0", width = "45%"),
  # to-unit conversion
  selectizeInput("to_unit", label = "To unit:", choices = to.units), 
  
  h3("scale factor"),
  numericInput("scale_numerator", label = "scale factor numerator", value = 1, min = 0),
  numericInput("scale_denominator", label = "scale factor denominator", value = 1, min = 0)
)

# multiple inputs on one row: http://stackoverflow.com/questions/20637248/shiny-4-small-textinput-boxes-side-by-side


## Body content
body <- dashboardBody(
  fluidRow(
    h2("scaling result"),
    box(htmlOutput("text_output"), width=8),
    actionButton("keep", "keep results")
  ),
  fluidRow(
    h2("stored values"),
    DT::dataTableOutput("datatable")
  )
)


# put everything together now! 
ui <- dashboardPage(header, sidebar, body)


