## header content
header <- dashboardHeader(title = "Unit Scaling App")

## Sidebar content
sidebar <-   dashboardSidebar(
  sidebarMenu(
    menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard"))
  ),
  
  # multiple inputs on one row: http://stackoverflow.com/questions/20637248/shiny-4-small-textinput-boxes-side-by-side
  # from-unit conversion
  selectizeInput("from_unit", label = "From unit:", choices = from.units, width = "45%"), 
  textInput("from_length", label = "From length:", value = "1.0", width = "45%"),
  # to-unit conversion
  selectizeInput("to_unit", label = "To unit:", choices = to.units),
  textInput("to_length", label = "To length:", value = "1.0")
)

## Body content
body <-   dashboardBody(
  tabItems(
    
    # First tab content
    tabItem(tabName = "dashboard",
            fluidRow(
              box(textOutput("text_output"), height = 250))
    )
  )
)

# put everything together now! 
ui <- dashboardPage(header, sidebar, body)


