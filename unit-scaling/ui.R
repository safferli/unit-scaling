## header content
header <- dashboardHeader(title = "Unit Scaling App")

## Sidebar content
sidebar <-   dashboardSidebar(
  sidebarMenu(
    menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
    menuItem("Widgets", tabName = "widgets", icon = icon("th"))
  ),
  
  # multiple inputs on one row: http://stackoverflow.com/questions/20637248/shiny-4-small-textinput-boxes-side-by-side
  #fluidRow(
    # from-unit conversion
    selectizeInput("from_unit", label = "From unit:", choices = from.units, width = "45%"), 
    textInput("from_length", label = "From length:", width = "45%"),
    # to-unit conversion
    selectizeInput("to_unit", label = "To unit:", choices = to.units),
    textInput("to_length", label = "To length:")
  #)
)

## Body content
body <-   dashboardBody(
  tabItems(
    # First tab content
    tabItem(tabName = "dashboard",
            fluidRow(
              box(plotOutput("plot1", height = 250)),
              
              box(
                title = "Controls",
                sliderInput("slider", "Number of observations:", 1, 100, 50)
              )
            )
    ),
    
    # Second tab content
    tabItem(tabName = "widgets",
            h2("Widgets tab content")
    )
  )
)

# put everything together now! 
ui <- dashboardPage(header, sidebar, body)


