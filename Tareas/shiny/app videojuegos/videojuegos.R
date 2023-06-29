# Load packages ----------------------------------------------------------------

library(shiny)
library(ggplot2)
library(tools)
library(shinythemes)

# Load data -------------------------------------------------------------------
load("Videogames.RData")

# Define UI --------------------------------------------------------------------

ui <- fluidPage(theme = shinytheme("united"),
  sidebarLayout(
    sidebarPanel(
      
      selectInput(
        inputId = "y",
        label = "Eje Y:",
        choices = c(
          "Ventas Globales" = "Global_Sales",
          "Puntaje de la Critica" = "Critic_Score",
          "Cantidad de criticas" = "Critic_Count",
          "Puntuaje del usuario" = "User_Score",
          "Cantidad de critica de usuarios" = "User_Count"
        ),
        selected = "User_Score"
      ),

      selectInput(
        inputId = "x",
        label = "Eje X:",
        choices = c(
          "Ventas Globales" = "Global_Sales",
          "Puntaje de la Critica" = "Critic_Score",
          "Número de críticos (utilizados en Puntaje de la crítica)" = "Critic_Count",
          "Puntuaje del usuario" = "User_Score",
          "Número de usuarios (utilizados en Puntaje del usuario)" = "User_Count"
        ),
        selected = "Global_Sales"
      ),

      selectInput(
        inputId = "z",
        label = "Color by:",
        choices = c(
          "Plataforma" = "Platform",
          "Género" = "Genre",
          "Editor" = "Publisher",
          "Rating ESRB" = "Rating",
          "Desarollador" = "Developer"
        ),
        selected = "Plataform"
      ),

      sliderInput(
        inputId = "alpha",
        label = "Alfa:",
        min = 0, max = 1,
        value = 0.5
      ),

      sliderInput(
        inputId = "size",
        label = "Tamaño:",
        min = 0, max = 5,
        value = 2
      ),
      textInput(
        inputId = "plot_title",
        label = "Plot title",
        placeholder = "Escribe el título"
      ),
      actionButton(
        inputId = "update_plot_title",
        label = "Update plot title"
      )
    ),
    mainPanel(
      tags$br(),
      tags$p(
        "Estos datos se obtuvieron de ",
        tags$a("Kaggle, por el usuario Rush Kirubi", href = "https://www.kaggle.com/datasets/rush4ratio/video-game-sales-with-ratings?resource=download"), "."
      ),
      tags$p("Los datos", nrow(Videogames), "representan las ventas de Vgchartz y ratings correspondientes de Metacritic"),

      plotOutput(outputId = "scatterplot")
    )
  )
)

# Define server ----------------------------------------------------------------

server <- function(input, output, session) {
  new_plot_title <- eventReactive(
    eventExpr = input$update_plot_title,
    valueExpr = {
      toTitleCase(input$plot_title)
    }
)
  output$scatterplot <- renderPlot({
    ggplot(data = Videogames, aes_string(x = input$x, y = input$y, color = input$z)) +
      geom_point(alpha = input$alpha, size = input$size) +
      labs(title = new_plot_title())
  })
}

# Create the Shiny app object --------------------------------------------------

shinyApp(ui = ui, server = server)
