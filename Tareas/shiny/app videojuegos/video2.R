# Load packages ----------------------------------------------------------------

library(shiny)
library(dplyr)
library(readr)

# Load data --------------------------------------------------------------------

load("Videogames.RData")

# Define UI --------------------------------------------------------------------

ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      
      
      checkboxGroupInput(
        inputId = "selected_var",
        label = "Select variables:",
        choices = names(Videogames),
        selected = c("title")
      )
    ),
    
    mainPanel(
      dataTableOutput(outputId = "Videogamestable"),
      downloadButton("download_data", "Download data")
    )
  )
)

# Define server ----------------------------------------------------------------

server <- function(input, output, session) {
  
  # Create reactive data frame
  videogames_selected <- reactive({
    Videogames %>% select(input$selected_var)
  })
  
  # Create data table
  output$Videogamestable <- DT::renderDataTable({
    req(input$selected_var)
    datatable(
      data = videogames_selected(),
      options = list(pageLength = 10),
      rownames = FALSE
    )
  })
  
  # Download file
  output$download_data <- downloadHandler(
    filename = function() {
      paste0("Videogames", input$filetype)
    })
    
    }

# Create the Shiny app object --------------------------------------------------

shinyApp(ui = ui, server = server)

