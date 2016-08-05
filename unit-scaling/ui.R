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
body <-   dashboardBody(
  # tabItems(
  #   
  #   # First tab content
  #   tabItem(tabName = "dashboard",
            fluidRow(
              box(textOutput("text_output"), height = 250))
    )
  # )
# )

# put everything together now! 
ui <- dashboardPage(header, sidebar, body)


