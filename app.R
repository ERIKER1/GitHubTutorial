rm(list=ls())

source("base.R", local=TRUE)$value

ui <- dashboardPage(
  dashboardHeader(title = "Kvasir 0.1",
    dropdownMenu(type = "notifications",
        notificationItem(
          text = "Fake data is generated. Illustration purposes only!",
          icon("warning")
        )
    )
  ),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Achtergrond", tabName = "Achtergrond", icon = icon("glyphicon glyphicon-align-justify", lib = "glyphicon")),
      menuItem("Simulatie", tabName = "simulatie", icon = icon("glyphicon glyphicon-export", lib = "glyphicon")),
      menuItem("Optimalisatie", tabName = "optimalisatie", icon = icon("glyphicon glyphicon-export", lib = "glyphicon"))
    )
    
  ),
  dashboardBody(
    tabItems(
      source(file.path("ui","achtergrond_ui.R"), local=TRUE)$value,
      source(file.path("ui","simulator_ui.R"), local=TRUE)$value,
      source(file.path("ui","optimizer_ui.R"), local=TRUE)$value
    )
  )
)


server <- function(input,output,session){
  source(file.path("server","achtergrond_server.R"), local=TRUE)$value
  source(file.path("server","simulator_server.R"), local=TRUE)$value
  source(file.path("server","optimizer_server.R"), local=TRUE)$value
  
}

shinyApp(ui=ui,server=server)
