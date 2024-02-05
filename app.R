###################################################################
# this script should constitute a shiny app that explores the iris dataset

#it should have with the following features:
# a sidebar panel with a selectInput for the x-axis variable
# a sidebar panel with a selectInput for the y-axis variable
# a main panel with a plotOutput for the scatterplot

# ggplot2 should be used to create the scatterplot
# the color of the points should be determined by the Species variable
# the theme should be set to theme_minimal()
# the axis labels should correspond to the variable names

#####################################################################

# load packages
library(shiny)
library(ggplot2)

# create the ui
ui <- fluidPage(
  sidebarPanel(
    selectInput("x", "X-axis variable", choices = names(iris)),
    selectInput("y", "Y-axis variable", choices = names(iris))
  ),
  mainPanel(
    br(),
    plotOutput("scatterplot", height = "700px")
  )
)

# create the server
server <- function(input, output) {
  output$scatterplot <- renderPlot({
    ggplot(iris, aes_string(x = input$x, y = input$y, color = "Species")) +
      geom_point(size=3) +
      theme_minimal() +
      xlab(input$x) +
      ylab(input$y)
  })
}

# run the app
shinyApp(ui = ui, server = server)




