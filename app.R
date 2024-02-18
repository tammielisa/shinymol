#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

ui <- fluidPage(
  tags$head(tags$style(HTML("
    body {
      padding-top: 20px; /* Adjust as needed */
      padding-left: 20px; /* Adjust as needed */
      padding-right: 20px; /* Adjust as needed */
    }
  "))),
  
  navbarPage(
    "Botfly Hemoglobin",
    tabPanel(
      "Main Protein",
      fluidRow(
        column(
          width = 12,
          h3("Overall Stucture of Botfly Hemoglobin Showing Porphyrin Site"),
          #p("Chemical Formula: H<sub>2</sub>O"),
          #p("Additional information about the molecule goes here."),
          uiOutput("infoImage"),
          tags$a(href = "https://www.rcsb.org/", "Source: Protein Data Bank (PDB)"),
        )
      )
    ),
    tabPanel(
      "Ligand",
      fluidRow(
        column(
          width = 12,
          h3("Protoporphyrin IX Containing Fe"),
          p("Chemical Formula: C",tags$sub("34"),"H",tags$sub("34"),"N",tags$sub("4"),"O",tags$sub("2"),"Fe"),
          sliderInput("view_slider", "Select View:", min = 1, max = 4, value = 1),
          uiOutput("pymolImage"),
          tags$a(href = "https://www.rcsb.org/", "Source: Protein Data Bank (PDB)"),
        )
      )
    )
  )
)

server <- function(input, output) {
  output$infoImage <- renderUI({
    #Shows Protein image
    tags$img(src = "info.png", id = "infoImage")
  })
  output$pymolImage <- renderUI({
    img_src <- paste0("scene", input$view_slider, ".png")
    #Shows ligand image
    tags$img(src = img_src, id = "pymolImage")
  })
}

shinyApp(ui, server)

